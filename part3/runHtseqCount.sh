#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --time=01:00:00
#SBATCH --job-name=htseqct
#SBATCH --output=htseqct_%j.out
#SBATCH --error=htseqct_%j.err

conda activate QAA

file21=./aligned21/Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a.21.Aligned.out.sam
file34=./aligned34/Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a.34.Aligned.out.sam

/usr/bin/time -v htseq-count \
--format sam $file21 \
--stranded=yes \
./mme/Mus_musculus.GRCm39.107.gtf \
> ./htseq_outputs/21.Mus_musculus.htseq_count.stranded_yes.output.txt

echo "DONE WITH 21_stranded"
echo ""

/usr/bin/time -v htseq-count \
--format sam $file21 \
--stranded=reverse ./mme/Mus_musculus.GRCm39.107.gtf \
> ./htseq_outputs/21.Mus_musculus.htseq_count.stranded_reverse.output.txt 

echo "DONE WITH 21_reverse"
echo ""

/usr/bin/time -v htseq-count \
--format sam $file34 \
--stranded=yes ./mme/Mus_musculus.GRCm39.107.gtf \
> ./htseq_outputs/34.Mus_musculus.htseq_count.stranded_yes.output.txt

echo "DONE WITH 34_stranded"
echo ""

/usr/bin/time -v htseq-count \
--format sam $file34 \
--stranded=reverse ./mme/Mus_musculus.GRCm39.107.gtf \
> ./htseq_outputs/34.Mus_musculus.htseq_count.stranded_reverse.output.txt

echo "DONE WITH 34_reverse"
echo ""
