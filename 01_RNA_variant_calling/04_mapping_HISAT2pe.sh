#!/bin/bash -e

#SBATCH --job-name	 04_mapping
#SBATCH --account        uoo00071
#SBATCH --time           12:00:00                     # Time spend on the runni$
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  16                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         04_mapping.%j.out  # Include the job ID in t$
#SBATCH --error          04_mapping.%j.err  # Output and error files

GENOME=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01
SPLICESITES=genome/CF_011100635.1_mTriVul1.pri_genomic_24Aug22.ss
INPUT_FOLDER=02_trimmed_ex
OUTPUT_FOLDER=04_mapped_ex2

# Load modules
module load HISAT2
module load picard

hisat2 -p 8 --dta -x $GENOME -1 $INPUT_FOLDER/fileTemp1_val_1.fq.gz \
-2 $INPUT_FOLDER/fileTemp2_val_2.fq.gz --known-splicesite-infile $SPLICESITES \
-S $OUTPUT_FOLDER/fileTemp.sam

java -Xmx16g -jar $EBROOTPICARD/picard.jar SortSam \
--INPUT $OUTPUT_FOLDER/fileTemp.sam --OUTPUT $OUTPUT_FOLDER/fileTemp_sorted.sam \
--SORT_ORDER coordinate --CREATE_INDEX true

rm $OUTPUT_FOLDER/fileTemp.sam

# Create BAM files

module load SAMtools

samtools view -S -b $OUTPUT_FOLDER/fileTemp_sorted.sam > $OUTPUT_FOLDER/fileTemp_sorted.bam
rm $OUTPUT_FOLDER/fileTemp_sorted.sam

samtools index -c $OUTPUT_FOLDER/fileTemp_sorted.bam

