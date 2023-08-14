#!/bin/bash -e

#SBATCH --job-name	 02_trimming
#SBATCH --account        uoo00071
#SBATCH --time           12:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  16                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         02_trimming.%j.out  # Include the job ID in the names of the
#SBATCH --error          02_trimming.%j.err  # Output and error files

# Variables
INPUT_FOLDER=00_data
OUTPUT_FOLDER=02_trimmed

# Load modules
module load TrimGalore

# Running TrimGalore
trim_galore -q 20 -j 16 -o $OUTPUT_FOLDER/ --paired \
$INPUT_FOLDER/mTriVul1_S1_L002_R1_001.fastq.gz \
$INPUT_FOLDER/mTriVul1_S1_L002_R2_001.fastq.gz
