#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --time=10:00:00
#SBATCH --job-name=scoreDist
#SBATCH --output=scoreDist_%j.out
#SBATCH --error=scoreDist_%j.err

conda activate bgmp_py310

file1=/projects/bgmp/shared/2017_sequencing/demultiplexed/21_3G_both_S15_L008_R1_001.fastq.gz
file2=/projects/bgmp/shared/2017_sequencing/demultiplexed/21_3G_both_S15_L008_R2_001.fastq.gz
file3=/projects/bgmp/shared/2017_sequencing/demultiplexed/34_4H_both_S24_L008_R1_001.fastq.gz
file4=/projects/bgmp/shared/2017_sequencing/demultiplexed/34_4H_both_S24_L008_R2_001.fastq.gz
outputDir=/projects/bgmp/kaetlyng/bioinfo/Bi622/QAA/part1/scoreDistResults


/usr/bin/time -v ./scoreDist.py -f $file1 -o ./histograms/hist_21_3G_both_S15_L008_R1_001.png -p 101 -r 9237299
echo "DONE WITH file1"
echo ""
echo ""
/usr/bin/time -v ./scoreDist.py -f $file2 -o ./histograms/hist_21_3G_both_S15_L008_R2_001.png -p 101 -r 9237299
echo "DONE WITH file2"
echo ""
echo ""
/usr/bin/time -v ./scoreDist.py -f $file3 -o ./histograms/hist_34_4H_both_S24_L008_R1_001.png -p 101 -r 9040597
echo "DONE WITH file3"
echo ""
echo ""
/usr/bin/time -v ./scoreDist.py -f $file4 -o ./histograms/hist_34_4H_both_S24_L008_R2_001.png -p 101 -r 9040597
echo "DONE WITH file4"
echo ""
echo ""