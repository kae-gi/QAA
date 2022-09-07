#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --time=01:00:00
#SBATCH --job-name=trimmomatic
#SBATCH --output=trimmomatic_%j.out
#SBATCH --error=trimmomatic_%j.err

conda activate QAA

/usr/bin/time -v trimmomatic PE -phred33 \
21_3G_both_S15_L008_R1_001.trim.fastq.gz \
21_3G_both_S15_L008_R2_001.trim.fastq.gz \
21_3G_both_S15_L008_R1_001.paired.qtrim.fastq.gz \
21_3G_both_S15_L008_R1_001.unpaired.qtrim.fastq.gz \
21_3G_both_S15_L008_R2_001.paired.qtrim.fastq.gz \
21_3G_both_S15_L008_R2_001.unpaired.qtrim.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

echo "DONE WITH 21"
echo ""

/usr/bin/time -v trimmomatic PE -phred33 \
34_4H_both_S24_L008_R1_001.trim.fastq.gz \
34_4H_both_S24_L008_R2_001.trim.fastq.gz \
34_4H_both_S24_L008_R1_001.paired.qtrim.fastq.gz \
34_4H_both_S24_L008_R1_001.unpaired.qtrim.fastq.gz \
34_4H_both_S24_L008_R2_001.paired.qtrim.fastq.gz \
34_4H_both_S24_L008_R2_001.unpaired.qtrim.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

echo "DONE WITH 34"
echo ""