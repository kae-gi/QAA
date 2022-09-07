#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --job-name=runStar
#SBATCH --output=runStar_%j.out
#SBATCH --error=runStar_%j.err
conda activate QAA

read1_21=/projects/bgmp/kaetlyng/bioinfo/Bi623/PS/QAA/part2/trimmomatic/21_3G_both_S15_L008_R1_001.paired.qtrim.fastq.gz
read2_21=/projects/bgmp/kaetlyng/bioinfo/Bi623/PS/QAA/part2/trimmomatic/21_3G_both_S15_L008_R2_001.paired.qtrim.fastq.gz
read1_34=/projects/bgmp/kaetlyng/bioinfo/Bi623/PS/QAA/part2/trimmomatic/34_4H_both_S24_L008_R1_001.paired.qtrim.fastq.gz
read2_34=/projects/bgmp/kaetlyng/bioinfo/Bi623/PS/QAA/part2/trimmomatic/34_4H_both_S24_L008_R2_001.paired.qtrim.fastq.gz

/usr/bin/time -v STAR \
    --runThreadN 8 \
    --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn $read1_21 $read2_21 \
    --genomeDir Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a \
    --outFileNamePrefix aligned21/Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a.21.

echo "DONE WITH 21"
echo ""

/usr/bin/time -v STAR \
    --runThreadN 8 \
    --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn $read1_34 $read2_34 \
    --genomeDir Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a \
    --outFileNamePrefix aligned34/Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a.34.
