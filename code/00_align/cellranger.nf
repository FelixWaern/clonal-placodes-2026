#!/usr/bin/env nextflow

params.GFPbc_fastq = false
params.TOMbc_fastq = false
params.do_velocyto = true
params.multiple_fastqs = false
params.output_dir = "results/"
params.chemistry = "auto"

// Set system parameters. 
params.CPU = 32
params.RAM = 10
params.EXPECTED_CELLS = 15000

// Validate required parameters
if( !params.ID ) error "Missing required parameter: --ID"
if( !params.reference ) error "Missing required parameter: --reference"
if( !params.fastq ) error "Missing required parameter: --fastq"

log.info ""
log.info "    C E L L R A N G E R   V.   7.1.0    "
log.info "======================================"
log.info "Sample name                         : ${params.ID}"
log.info "10x chemistry version               : ${params.chemistry}"
log.info "Compute spliced / unspliced counts  : ${params.do_velocyto}"
log.info "Memory to use                       : ${params.RAM}"
log.info "Number of cores to use              : ${params.CPU}"
log.info "Output directory                    : ${params.output_dir}"
log.info ""

process CellRanger{
    publishDir "${params.output_dir}", mode: 'copy'
    
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
    publishDir "${params.output_dir}", mode: 'copy'
    
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

process velocyto{
    publishDir "${params.output_dir}", mode: 'copy'
    
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
        /placodes/code/tools/scripts/prepare_reference.py -i genes.gtf.gz -o genes.gtf
        /opt/conda/envs/sclitr/bin/velocyto run10x --samtools-threads ${CPU} --samtools-memory ${RAM} ${cellranger_output} genes.gtf
        """
}

workflow{
    if( !params.multiple_fastqs ){
        cellranger_output = CellRanger(
            params.ID,
            params.reference,
            params.fastq,
            params.CPU,
            params.RAM,
            params.chemistry,
            params.EXPECTED_CELLS
        )
        
        if( params.do_velocyto ) {
            velocyto(cellranger_output, params.reference, params.CPU, params.RAM)
        }
    }
    else {
        cellranger_output = CellRangerMultiple(
            params.ID,
            params.reference,
            params.fastq[0],
            params.fastq[1],
            params.CPU,
            params.RAM,
            params.chemistry,
            params.EXPECTED_CELLS
        )
        
        if( params.do_velocyto ) {
            velocyto(cellranger_output, params.reference, params.CPU, params.RAM)
        }
    }
}