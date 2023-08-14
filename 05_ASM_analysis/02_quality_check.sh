#!/bin/bash -e

#SBATCH --job-name	 02_quality_check
#SBATCH --account        uoo00071
#SBATCH --time           24:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  2                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         02_quality_check.%j.out  # Include the job ID in the names of the
#SBATCH --error          02_quality_check.%j.err  # Output and error files

# Load modules
module load Python

# Run trimming
readarray filenames < filenames.txt
for i in ${filenames[@]}
do
	mkdir -p 02_quality_check/${i}
	/home/oscar.ortega/.local/bin/NanoPlot --fastq 01_raw_data/${i}.fastq -o 02_quality_check/${i}/
done
