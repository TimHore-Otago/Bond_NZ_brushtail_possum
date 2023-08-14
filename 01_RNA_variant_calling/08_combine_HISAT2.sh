#!/bin/bash -e

#SBATCH --job-name	 08_combine
#SBATCH --account        uoo00071
#SBATCH --time           240:00:00                    # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  16                           # Number of cores per task
#SBATCH --partition	 long                         # Partition
#SBATCH --output         08_combine.%j.out  # Include the job ID in the names of the
#SBATCH --error          08_combine.%j.err  # Output and error files

# Variables
INPUT_FOLDER=07_haplotypecaller_0
GENOME=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna
OUTPUT_FOLDER=08_combined

# Load modules
module load GATK

# Running BWA
gatk --java-options "-Xmx32g" CombineGVCFs  \
   -R $GENOME \
   -V $INPUT_FOLDER/batch_2_020721PY01.vcf \
   -V $INPUT_FOLDER/batch_2_020721PY02.vcf \
   -V $INPUT_FOLDER/batch_2_020721PY03.vcf \
   -V $INPUT_FOLDER/batch_2_050521PY02.vcf \
   -V $INPUT_FOLDER/batch_2_070521PY01.vcf \
   -V $INPUT_FOLDER/batch_2_080721PY01.vcf \
   -V $INPUT_FOLDER/batch_2_090421PY01.vcf \
   -V $INPUT_FOLDER/batch_2_090421PY02.vcf \
   -V $INPUT_FOLDER/batch_2_100920PY01.vcf \
   -V $INPUT_FOLDER/batch_2_10720MGSDR1.vcf \
   -V $INPUT_FOLDER/batch_2_10720MGSDR2.vcf \
   -V $INPUT_FOLDER/batch_2_110820FGWSG1.vcf \
   -V $INPUT_FOLDER/batch_2_11721MRJohn.vcf \
   -V $INPUT_FOLDER/batch_2_121020PY01.vcf \
   -V $INPUT_FOLDER/batch_2_12621BH_001.vcf \
   -V $INPUT_FOLDER/batch_2_12820FGWSG2.vcf \
   -V $INPUT_FOLDER/batch_2_12820MGWSG1.vcf \
   -V $INPUT_FOLDER/batch_2_12820WSGPYM2.1.vcf \
   -V $INPUT_FOLDER/batch_2_13820MGWSG1.vcf \
   -V $INPUT_FOLDER/batch_2_140421PY02.vcf \
   -V $INPUT_FOLDER/batch_2_140421PY03.vcf \
   -V $INPUT_FOLDER/batch_2_14421MGWSG1.vcf \
   -V $INPUT_FOLDER/batch_2_150121PY01.vcf \
   -V $INPUT_FOLDER/batch_2_17920FBSDRMary.vcf \
   -V $INPUT_FOLDER/batch_2_180820PY01.vcf \
   -V $INPUT_FOLDER/batch_2_18320MGWSG1.vcf \
   -V $INPUT_FOLDER/batch_2_18521FGPF2.vcf \
   -V $INPUT_FOLDER/batch_2_18521MGPF1.vcf \
   -V $INPUT_FOLDER/batch_2_18521MGPF3.vcf \
   -V $INPUT_FOLDER/batch_2_18820FBSDR1.vcf \
   -V $INPUT_FOLDER/batch_2_19820MBSDR1.vcf \
   -V $INPUT_FOLDER/batch_2_20421MBSDR1.vcf \
   -V $INPUT_FOLDER/batch_2_20521MRPig2.vcf \
   -V $INPUT_FOLDER/batch_2_210721PY01.vcf \
   -V $INPUT_FOLDER/batch_2_210721PY02.vcf \
   -V $INPUT_FOLDER/batch_2_21720MGWSG1.vcf \
   -V $INPUT_FOLDER/batch_2_22920FGPYRAVB1.vcf \
   -V $INPUT_FOLDER/batch_2_240621PY01.vcf \
   -V $INPUT_FOLDER/batch_2_25521MGPig1.vcf \
   -V $INPUT_FOLDER/batch_2_28720FGSDR1.vcf \
   -V $INPUT_FOLDER/batch_2_28720PYSDR1.1.vcf \
   -V $INPUT_FOLDER/batch_2_290920PY01.vcf \
   -V $INPUT_FOLDER/batch_2_300621PY01.vcf \
   -V $INPUT_FOLDER/batch_2_3621MRPig1.vcf \
   -V $INPUT_FOLDER/batch_2_3920MBSDR1.vcf \
   -V $INPUT_FOLDER/batch_2_4521MBSDR1.vcf \
   -V $INPUT_FOLDER/batch_2_4820FGBB1.vcf \
   -V $INPUT_FOLDER/batch_2_4820FPYBB1-1.vcf \
   -V $INPUT_FOLDER/batch_2_9421MBSDR1.vcf \
   -V $INPUT_FOLDER/batch_2_9621MGJohn1.vcf \
   -V $INPUT_FOLDER/batch_2_9621MGPig1.vcf \
   -V $INPUT_FOLDER/batch_2_Young_male66.vcf \
   -V $INPUT_FOLDER/Fukurogitsune_clean_R.vcf \
   -V $INPUT_FOLDER/L1.vcf \
   -V $INPUT_FOLDER/L2.vcf \
   -V $INPUT_FOLDER/L3.vcf \
   -V $INPUT_FOLDER/L4.vcf \
   -V $INPUT_FOLDER/Puku_liver.vcf \
   -V $INPUT_FOLDER/S15_290520_PY01.vcf \
   -V $INPUT_FOLDER/S16_16620_MG_SDR1.vcf \
   -V $INPUT_FOLDER/S17_13320_MB_SDR1.vcf \
   -V $INPUT_FOLDER/S18_17320_FR_SDR1.vcf \
   -V $INPUT_FOLDER/S19_19320_MR_WSG1.vcf \
   -V $INPUT_FOLDER/S20_19320_FG_WSG2.vcf \
   -V $INPUT_FOLDER/S21_19320_MJ_WSG2_1.vcf \
   -V $INPUT_FOLDER/S22_280520_PY01.vcf \
   -V $INPUT_FOLDER/S23_14720_FG_BB1.vcf \
   -V $INPUT_FOLDER/S24_25620_MG_WSG1_1.vcf \
   -V $INPUT_FOLDER/S25_03620_FG_WSG1.vcf \
   -V $INPUT_FOLDER/S26_12320_MB_SDR2.vcf \
   -V $INPUT_FOLDER/S27_15720_MG_BB2.vcf \
   -V $INPUT_FOLDER/S28_150720_PY01.vcf \
   -V $INPUT_FOLDER/S29_15720_FR_BB1.vcf \
   -V $INPUT_FOLDER/S30_030620_PY01.vcf \
   -V $INPUT_FOLDER/S31_140720_PY01.vcf \
   -V $INPUT_FOLDER/S32_25620_FG_WSG1.vcf \
   -V $INPUT_FOLDER/S33_10620_MG_BB1.vcf \
   -V $INPUT_FOLDER/S34_12320_MR_SDR1.vcf \
   -V $INPUT_FOLDER/S35_3720_FG_SDR1.vcf \
   -V $INPUT_FOLDER/S36_030720_PY01.vcf \
   -V $INPUT_FOLDER/Sandy_liver.vcf \
   -V $INPUT_FOLDER/Sandy_spleen.vcf \
   -V $INPUT_FOLDER/Sheila_liver.vcf \
   -V $INPUT_FOLDER/SRR3901715_.vcf \
   -V $INPUT_FOLDER/SRR8658969_.vcf \
   -V $INPUT_FOLDER/Vert35.R.vcf \
   -V $INPUT_FOLDER/Vert36.R.vcf \
   -V $INPUT_FOLDER/Vert37.R.vcf \
   -V $INPUT_FOLDER/Vert38.R.vcf \
   -V $INPUT_FOLDER/Vert39.R.vcf \
   -V $INPUT_FOLDER/Vert40.R.vcf \
   -V $INPUT_FOLDER/Vert41.R.vcf \
   -O $OUTPUT_FOLDER/combined.vcf


