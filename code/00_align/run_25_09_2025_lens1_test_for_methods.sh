#!/bin/bash

# Read the config file line by line
#while IFS= read -r line; do
#    # Skip empty lines and comments
#    [[ -z "$line" || "$line" =~ ^# ]] && continue
#    
#    # Split on colon to get sample name and variable
#    sample=$(echo "$line" | cut -d':' -f1)
#    var_part=$(echo "$line" | cut -d':' -f2)
#    
#    # Split variable part to get name and value
#    var_name=$(echo "$var_part" | cut -d'=' -f1)
#    var_value=$(echo "$var_part" | cut -d'=' -f2)
#    
#    echo "Sample: $sample, Variable: $var_name, Value: $var_value"
#done < config.txt

# Test
/placodes/code/00_align/cellranger.nf \
  --CPU=64 \
  --ID=GEX \
  --do_velocyto=true \
  --multiple_fastqs=False \
  --fastq=/placodes/data/fastq/P33869_lens1/GEX \
  --reference=/placodes/data/reference/pMR671_mm39 \
  --output_dir=/placodes/data/GEX && \
rm -rf nextflow.work

# Lens 1
#/home/felix/pipelines/pipelines_from_sergey/pipelines/cellranger.nf \
#  --CPU=64 \
#  --ID=GEX \
#  --do_velocyto=true \
#  --multiple_fastqs=true \
#  --fastq=/home/felix/data/clonal_project/fastq/P33869_lens1/GEX,/home/felix/data/clonal_project/fastq/P34765_lens1/GEX \
#  --reference=/home/sergey/sequences/mouse/reference/pMR671_mm39 \
#  --output_dir=/home/felix/data/clonal_project/cellranger/lens1/GEX && \
#rm -rf /home/felix/nextflow.work


# Lens 2
#/home/felix/pipelines/pipelines_from_sergey/pipelines/cellranger.nf \
#  --CPU=64 \
#  --ID=GEX \
#  --do_velocyto=true \
#  --multiple_fastqs=true \
#  --fastq=/home/felix/data/clonal_project/fastq/P33869_lens2/GEX,/home/felix/data/clonal_project/fastq/P34765_lens2/GEX \
#  --reference=/home/sergey/sequences/mouse/reference/pMR671_mm39 \
#  --output_dir=/home/felix/data/clonal_project/cellranger/lens2/GEX && \
#rm -rf /home/felix/pipelines/nextflow.work


# Lens 3
#/home/felix/pipelines/pipelines_from_sergey/pipelines/cellranger.nf \
#  --CPU=64 \
#  --ID=GEX \
#  --do_velocyto=true \
#  --multiple_fastqs=true \
#  --fastq=/home/felix/data/clonal_project/fastq/P33869_lens3/GEX,/home/felix/data/clonal_project/fastq/P34765_lens3/GEX \
#  --reference=/home/sergey/sequences/mouse/reference/pMR671_mm39 \
#  --output_dir=/home/felix/data/clonal_project/cellranger/lens3/GEX && \
#rm -rf /home/felix/pipelines/nextflow.work


# Otic 1
#/home/felix/pipelines/pipelines_from_sergey/pipelines/cellranger.nf \
#  --CPU=64 \
#  --ID=GEX \
#  --do_velocyto=true \
#  --multiple_fastqs=true \
#  --fastq=/home/felix/data/clonal_project/fastq/P33869_otic1/GEX,/home/felix/data/clonal_project/fastq/P34765_otic1/GEX \
#  --reference=/home/sergey/sequences/mouse/reference/pMR671_mm39 \
#  --output_dir=/home/felix/data/clonal_project/cellranger/otic1/GEX && \
#rm -rf /home/felix/pipelines/nextflow.work

# Otic 2
#/home/felix/pipelines/pipelines_from_sergey/pipelines/cellranger.nf \
#  --CPU=64 \
#  --ID=GEX \
#  --do_velocyto=true \
#  --multiple_fastqs=true \
#  --fastq=/home/felix/data/clonal_project/fastq/P33869_otic2/GEX,/home/felix/data/clonal_project/fastq/P34765_otic2/GEX \
#  --reference=/home/sergey/sequences/mouse/reference/pMR671_mm39 \
#  --output_dir=/home/felix/data/clonal_project/cellranger/otic2/GEX && \
#rm -rf /home/felix/pipelines/nextflow.work

# Olfac 1
#/home/felix/pipelines/pipelines_from_sergey/pipelines/cellranger.nf \
#  --CPU=64 \
#  --ID=GEX \
#  --do_velocyto=true \
#  --multiple_fastqs=true \
#  --fastq=/home/felix/data/clonal_project/fastq/P33869_olfac1/GEX,/home/felix/data/clonal_project/fastq/P34765_olfac1/GEX \
#  --reference=/home/sergey/sequences/mouse/reference/pMR671_mm39 \
#  --output_dir=/home/felix/data/clonal_project/cellranger/olfac1/GEX && \
#rm -rf /home/felix/pipelines/nextflow.work

# Olfac 2
#/home/felix/pipelines/pipelines_from_sergey/pipelines/cellranger.nf \
#  --CPU=64 \
#  --ID=GEX \
#  --do_velocyto=true \
#  --multiple_fastqs=true \
#  --fastq=/home/felix/data/clonal_project/fastq/P33869_olfac2/GEX,/home/felix/data/clonal_project/fastq/P34765_olfac2/GEX \
#  --reference=/home/sergey/sequences/mouse/reference/pMR671_mm39 \
#  --output_dir=/home/felix/data/clonal_project/cellranger/olfac2/GEX && \
#rm -rf /home/felix/pipelines/nextflow.work


# Add cranial 1,2 and old lens olfac and otic

