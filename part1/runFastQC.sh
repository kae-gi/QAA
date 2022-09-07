#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --time=01:00:00
#SBATCH --job-name=fastqc
#SBATCH --output=fastqc_%j.out
#SBATCH --error=fastqc_%j.err

module load fastqc/0.11.5 

file1=/projects/bgmp/shared/2017_sequencing/demultiplexed/21_3G_both_S15_L008_R1_001.fastq.gz
file2=/projects/bgmp/shared/2017_sequencing/demultiplexed/21_3G_both_S15_L008_R2_001.fastq.gz
file3=/projects/bgmp/shared/2017_sequencing/demultiplexed/34_4H_both_S24_L008_R1_001.fastq.gz
file4=/projects/bgmp/shared/2017_sequencing/demultiplexed/34_4H_both_S24_L008_R2_001.fastq.gz
outputDir=/projects/bgmp/kaetlyng/bioinfo/Bi622/QAA/part1/fqcResults

/usr/bin/time -v fastqc \
    $file1 $file2 $file3 $file4 \
    -o $outputDir \
    -f fastq \
    -t 4 \