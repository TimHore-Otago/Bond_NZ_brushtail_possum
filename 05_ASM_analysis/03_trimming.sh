#!/bin/bash -e

#SBATCH --job-name	 03_trimming
#SBATCH --account        uoo00071
#SBATCH --time           24:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  4                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         03_trimming.%j.out  # Include the job ID in the names of the
#SBATCH --error          03_trimming.%j.err  # Output and error files

# Load modules
module load Porechop
module load Filtlong

# Run trimming
readarray filenames < filenames.txt
for i in ${filenames[@]}
do
	porechop -t 4 --check_reads 1000 --discard_middle -i 01_raw_data/${i}.fastq -o 03_trimmed/${i}_porechop.fastq
	filtlong --min_length 500 --min_mean_q 9 03_trimmed/${i}_porechop.fastq > 03_trimmed/${i}_trimmed.fastq
	rm 03_trimmed/${i}_porechop.fastq
done
