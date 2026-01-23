
nextflow run /placodes/code/00_align/cellranger.nf \
  --CPU=64 \
  --ID=GEX_ \
  --do_velocyto=true \
  --multiple_fastqs=False \
  --fastq=/placodes/data/fastq/P33869_lens1/GEX \
  --reference=/placodes/data/reference/pMR671_mm39 \
  --output_dir=/placodes/data/cellranger/lens1/GEX && \
rm -rf nextflow.work
