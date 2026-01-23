#!/bin/bash

# Create fastq directory if it doesn't exist
mkdir -p /placodes/data/fastq/
mkdir -p /placodes/data/cellranger/

# Lens1
# Create lens directory if it doesn't exist
mkdir -p /placodes/data/fastq/P33869_lens1
mkdir -p /placodes/data/fastq/P33869_lens1/GEX
mkdir -p /placodes/data/cellranger/lens1/

#wget -nv https://ftp.ncbi.nlm.nih.gov/geo/series/GSE201nnn/GSE201257/suppl/GSE201257%5Fadata%5Fassigned%2Eh5ad%2Egz -P /placodes/data/fastq/P33869_lens1/GEX
#wget -nv https://ftp.ncbi.nlm.nih.gov/geo/series/GSE201nnn/GSE201257/suppl/GSE201257%5Fadata%5Fassigned%2Eh5ad%2Egz -P /placodes/data/fastq/P33869_lens1/GEX
#wget -nv https://ftp.ncbi.nlm.nih.gov/geo/series/GSE201nnn/GSE201257/suppl/GSE201257%5Fadata%5Fassigned%2Eh5ad%2Egz -P /placodes/data/fastq/P33869_lens1/GEX
#wget -nv https://ftp.ncbi.nlm.nih.gov/geo/series/GSE201nnn/GSE201257/suppl/GSE201257%5Fadata%5Fassigned%2Eh5ad%2Egz -P /placodes/data/fastq/P33869_lens1/GEX

#gunzip /placodes/data/fastq/P33869_lens1/GEX/*


#nextflow run /placodes/code/00_align/cellranger.nf \
#  --CPU=64 \
#  --ID=GEX_ \
#  --do_velocyto=true \
#  --multiple_fastqs=False \
#  --fastq=/placodes/data/fastq/P33869_lens1/GEX \
#  --reference=/placodes/data/reference/pMR671_mm39 \
#  --output_dir=/placodes/data/cellranger/lens1/GEX && \
#rm -rf nextflow.work








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

