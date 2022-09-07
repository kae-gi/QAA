#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --time=01:00:00
#SBATCH --job-name=RLDist
#SBATCH --output=RLDist_%j.out
#SBATCH --error=RLDist_%j.err

file1=/projects/bgmp/kaetlyng/bioinfo/Bi623/PS/QAA/part2/trimmomatic/21_3G_both_S15_L008_R1_001.paired.qtrim.fastq.gz
file2=/projects/bgmp/kaetlyng/bioinfo/Bi623/PS/QAA/part2/trimmomatic/21_3G_both_S15_L008_R2_001.paired.qtrim.fastq.gz
file3=/projects/bgmp/kaetlyng/bioinfo/Bi623/PS/QAA/part2/trimmomatic/34_4H_both_S24_L008_R1_001.paired.qtrim.fastq.gz
file4=/projects/bgmp/kaetlyng/bioinfo/Bi623/PS/QAA/part2/trimmomatic/34_4H_both_S24_L008_R2_001.paired.qtrim.fastq.gz

zcat $file1 | awk 'NR%4==2 {print length ()}'| sort | uniq -c | sort -n > 21.R1.read_length_dist.txt

echo "DONE WITH 21_R1"
echo ""

zcat $file2 | awk 'NR%4==2 {print length ()}'| sort | uniq -c | sort -n > 21.R2.read_length_dist.txt

echo "DONE WITH 21_R2"
echo ""

zcat $file3 | awk 'NR%4==2 {print length ()}'| sort | uniq -c | sort -n > 34.R1.read_length_dist.txt

echo "DONE WITH 34_R1"
echo ""

zcat $file4 | awk 'NR%4==2 {print length ()}'| sort | uniq -c | sort -n > 34.R2.read_length_dist.txt

echo "DONE WITH 34_R2"
echo ""