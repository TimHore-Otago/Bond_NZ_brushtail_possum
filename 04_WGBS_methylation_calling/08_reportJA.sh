#!/bin/bash -e

#SBATCH --job-name	 08_report
#SBATCH --account        uoo00071
#SBATCH --time           00:05:00                     # Time spend on the running
#SBATCH --mem-per-cpu    512                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  1                            # Number of cores per task
#SBATCH --partitionk     prepost                         # Partition
#SBATCH --output         08_report           # Include the job ID in the names of the
#SBATCH --error          08_report           # Output and error files

# Variables
FILE=08_report.sh
NEW_NAME=08_report

# Create files
readarray filenames < filenames.txt
for i in ${filenames[@]}
do
  	NAME=$NEW_NAME\_$i.sh
        cp $FILE $NAME
        sed -i "s|filename|${i}|g" $NAME
        sed -i "s|clock|clock_${i}|g" $NAME
done
