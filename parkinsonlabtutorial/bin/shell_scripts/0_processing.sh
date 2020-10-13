#!/bin/sh

#Valeria Flores
#fastQC analysis, trimming and impose read quality treshold

#Raw data fastQC analysis
fastqc ../../data/raw/mouse1.fastq --outdir=../../metadata/fastqc

#Trimming with Trimmomatic-0.36
trimmomatic SE ../../data/raw/mouse1.fastq ../../data/trimmed/mouse1_trimmed.fastq ILLUMINACLIP:../../data/adpaters/TruSeq3-SE.fa:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:10:28 MINLEN:50 HEADCROP:13

#Trimmed data fastQC quality analysis
fastqc ../../data/trimmed/mouse1_trimmed.fastq --outdir=../../metadata/fastqc

#Read quality filtering by imposing an overall read quality treshold
vsearch --fastq_filter ../../data/trimmed/mouse1_trimmed.fastq --fastq_maxee 2.00 --fastqout ../../data/trimmed/mouse1_qual.fastq

#Filtered data fastQC quality analysis
fastqc ../../data/trimmed/mouse1_qual.fastq --outdir=../../metadata/fastqc