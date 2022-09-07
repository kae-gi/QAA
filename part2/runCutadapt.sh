#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --time=01:00:00
#SBATCH --job-name=cutadapt
#SBATCH --output=cutadapt_%j.out
#SBATCH --error=cutadapt_%j.err

conda activate QAA

/usr/bin/time -v cutadapt \
-a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
-o 21_3G_both_S15_L008_R1_001.trim.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/21_3G_both_S15_L008_R1_001.fastq.gz \
> 21.R1.cutadapt.output.txt

echo "DONE WITH 21_R1"
echo ""

/usr/bin/time -v cutadapt \
-a AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o 21_3G_both_S15_L008_R2_001.trim.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/21_3G_both_S15_L008_R2_001.fastq.gz \
> 21.R2.cutadapt.output.txt

echo "DONE WITH 21_R2"
echo ""

/usr/bin/time -v cutadapt \
-a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
-o 34_4H_both_S24_L008_R1_001.trim.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/34_4H_both_S24_L008_R1_001.fastq.gz \
> 34.R1.cutadapt.output.txt

echo "DONE WITH 34_R1"
echo ""

/usr/bin/time -v cutadapt \
-a AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o 34_4H_both_S24_L008_R2_001.trim.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/34_4H_both_S24_L008_R2_001.fastq.gz \
> 34.R2.cutadapt.output.txt

echo "DONE WITH 34_R2"
echo ""