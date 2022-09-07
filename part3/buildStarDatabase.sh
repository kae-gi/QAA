#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
conda activate QAA

/usr/bin/time -v STAR \
    --runThreadN 8 \
    --runMode genomeGenerate \
    --genomeDir Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a \
    --genomeFastaFiles ./mme/Mus_musculus.GRCm39.dna.primary_assembly.fa \
    --sjdbGTFfile ./mme/Mus_musculus.GRCm39.107.gtf 
