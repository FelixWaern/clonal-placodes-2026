#!/usr/bin/env nextflow

params.GFPbc_fastq = false
params.TOMbc_fastq = false
params.do_velocyto = true
params.multiple_fastqs = false
params.CRISPR_location = false
params.output_dir = "results/"
params.chemistry = "auto"

params.rm_work = true
params.nextflow_work = "${HOME}/nextflow.work"
params.CPU = 32
params.RAM = 256
params.EXPECTED_CELLS = 15000

log.info ""
log.info "    C E L L R A N G E R   V.   7.1.0    "
log.info "======================================"
log.info "Sample name                         : ${params.ID}"
log.info "Fastq location on Adameyko server   : ${params.fastq}"

log.info "Reference location on local server  : ${params.reference}"
log.info "10x chemistry version               : ${params.chemistry}"
log.info "Compute spliced / unspliced counts  : ${params.do_velocyto}"
log.info "Output directory on Adameyko server : ${params.output_dir}"
log.info "CRISPR screening experiment         : ${params.CRISPR}"
if ( params.CRISPR ){
    if( !params.CRISPR_location ) {
        CRISPR_location = params.fastq[0..-4] + "gRNA"
    }
    else {
        CRISPR_location = params.CRISPR_location
    }
    log.info "CRISPR library location             : ${CRISPR_location}"
}
log.info "Memory to use                       : ${params.RAM}"
log.info "Number of cores to use              : ${params.CPU}"

log.info "Remove nextflow working directory   : ${params.rm_work}"
log.info "Nextflow working directory          : ${params.nextflow_work}"
log.info ""

process readsDownload{
    input:
        val adameyko_path

    output:
        path "reads"

    script:
        """
        /home/felix/tools/scripts_from_sergey/scripts/scp_data_down.py -f ${adameyko_path} -o reads
        """
}

process readsDownloadMultiple{
    input:
        val adameyko_path

    output:
        path "reads1"
        path "reads2"
    script:
        
        def (fastq1, fastq2) = adameyko_path.split(',') 
        """
        /home/felix/tools/scripts_from_sergey/scripts/scp_data_down.py -f ${fastq1} -o reads1
        /home/felix/tools/scripts_from_sergey/scripts/scp_data_down.py -f ${fastq2} -o reads2
        """
}

process readsDownloadCRISPR{
    input:
        val GEX_path
        val CRISPR_path

    output:
        path "reads"

    script:
        """
        mkdir reads
        /home/felix/tools/scripts_from_sergey/scripts/scp_data_down.py -f ${GEX_path} -o reads/GEX
        /home/felix/tools/scripts_from_sergey/scripts/scp_data_down.py -f ${CRISPR_path} -o reads/gRNA
        """
}

process CellRanger{
    input:
        val sample_id
        path reference
        path reads
        val CPU
        val RAM
        val chemistry
        val EXPECTED_CELLS

    output:
        path "${sample_id}"

    script:
        """
        cellranger count \
            --id=${sample_id} \
            --transcriptome=${reference} \
            --fastqs=${reads} \
            --localcores=${CPU} \
            --chemistry=${chemistry} \
            --localmem=${RAM} \
            --expect-cells=${EXPECTED_CELLS}
        rm -r ${sample_id}/SC_RNA_COUNTER_CS
        """
}

process CellRangerMultiple{
    input:
        val sample_id
        path reference
        path reads1
        path reads2
        val CPU
        val RAM
        val chemistry
        val EXPECTED_CELLS

    output:
        path "${sample_id}"

    script:
        """
        cellranger count \
            --id=${sample_id} \
            --transcriptome=${reference} \
            --fastqs=${reads1},${reads2} \
            --localcores=${CPU} \
            --chemistry=${chemistry} \
            --localmem=${RAM} \
            --expect-cells=${EXPECTED_CELLS}
        rm -r ${sample_id}/SC_RNA_COUNTER_CS
        """
}



process CellRangerCRISPR{
    input:
        val sample_id
        path reference
        path reads
        val CPU
        val RAM
        val chemistry

    output:
        path "${sample_id}"

    script:
        """
        /home/felix/tools/scripts_from_sergey/scripts/prepare_CRISPR_sheet.py -i ${reads} -o library.csv
        cellranger count \
            --id=${sample_id} \
            --libraries=library.csv \
            --transcriptome=${reference} \
            --localcores=${CPU} \
            --chemistry=${chemistry} \
            --localmem=${RAM} \
            --feature-ref=${reference}/feature_ref.csv
        rm -r ${sample_id}/SC_RNA_COUNTER_CS
        """
}

process velocyto{
    input:
        path cellranger_output
        path reference
        val CPU
        val RAM

    output:
        path "${cellranger_output}"

    script:
        """
        cp ${reference}/genes/genes.gtf.gz .
        /home/felix/tools/scripts_from_sergey/scripts/prepare_reference.py -i genes.gtf.gz -o genes.gtf
        /home/sergey/miniconda3/envs/sc/bin/velocyto run10x --samtools-threads ${CPU} --samtools-memory ${RAM} ${cellranger_output} genes.gtf
        """
}

process resultsUpload{
    input:
        path cellranger_output
        val adameyko_path

    output:
        val "Done!"

    script:
        """
        /home/felix/tools/scripts_from_sergey/scripts/scp_data_up.py -f ${cellranger_output} -o ${adameyko_path}
        """
}

process tmpDelete{
    input:
        path nextflow_work
        val x

    script:
        """
        rm -rf ${nextflow_work}
        """
}

workflow{
    if( !params.multiple_fastqs ){
        readsDownload(params.fastq)
        CellRanger(params.ID, params.reference, readsDownload.out, params.CPU, params.RAM, params.chemistry, params.EXPECTED_CELLS)
        if( params.do_velocyto ) {
        velocyto(CellRanger.out, params.reference, params.CPU, params.RAM)
        resultsUpload(velocyto.out, params.output_dir)
        }
        else {
            resultsUpload(CellRanger.out, params.output_dir)
        }
        if( params.rm_work ) {
            tmpDelete(params.nextflow_work, resultsUpload.out.collect())
        }
    }
    else {
        readsDownloadMultiple(params.fastq)
        
        CellRangerMultiple(params.ID,
        params.reference,
        readsDownloadMultiple.out[0],
        readsDownloadMultiple.out[1],
        params.CPU, params.RAM,
        params.chemistry,
        params.EXPECTED_CELLS)
        
        if( params.do_velocyto ) {
        velocyto(CellRangerMultiple.out, params.reference, params.CPU, params.RAM)
        resultsUpload(velocyto.out, params.output_dir)
        }
        else {
            resultsUpload(CellRangerMultiple.out, params.output_dir)
        }
        if( params.rm_work ) {
            tmpDelete(params.nextflow_work, resultsUpload.out.collect())
        }
    }

}
