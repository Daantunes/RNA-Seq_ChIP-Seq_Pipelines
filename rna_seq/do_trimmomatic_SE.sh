#!/bin/bash
if [ "$1" == "-h" ]; then
  echo "<Pathway to fastq files> <Name of the fastq file>"
  exit 0
fi
docker pull quay.io/biocontainers/trimmomatic:0.39--1

chmod 777 $1

docker run -d -it --rm -v /usr/share/trimmomatic:/adapters/ \
-v $1:/data/ quay.io/biocontainers/trimmomatic:0.39--1 \
trimmomatic SE /data/$2 /data/T_$2 \
ILLUMINACLIP:/adapters/TruSeq3-SE.fa:2:30:10 \
MINLEN:36


#docker run -d -it --rm -v /usr/share/trimmomatic:/adapters/ -v /home/user/Documentos/Mestrado/Projeto/Docker/tutorial_rna_seq:/data/ quay.io/biocontainers/trimmomatic:0.39--1 trimmomatic SE /data/sample_adaptors.fastq.gz /data/sample_adaptors.fastq_T.gz ILLUMINACLIP:/adapters/TruSeq3-PE.fa:2:30:10 MINLEN:36
