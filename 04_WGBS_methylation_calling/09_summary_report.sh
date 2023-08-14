#!/bin/bash -e

#SBATCH --job-name	 09_summary_report
#SBATCH --account        uoo00098
#SBATCH --time           01:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    4096                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  1                            # Number of cores per task
#SBATCH --partition	 prepost                        # Partition
#SBATCH --output         09_summary_report%j.out           # Include the job ID in the names of the
#SBATCH --error          09_summary_report%j.err           # Output and error files

# Variables
OUT_DIR=09_summary_report
FOLDER=08_report
CLOCK=clock.txt

# Make output directory
#mkdir $OUT_DIR

# Start clock
date > $OUT_DIR/$CLOCK

# Make summary
echo -e "Sample\tTotal_strings\tTotal_Cs\tTotal_CsM_CpG\tTotal_CsM_CHG\tTotal_CsM_CHH\tTotal_CsU_CpG\tTotal_CsU_CHG\tTotal_CsU_CHH\tCsM_CpG\tCsM_non_CpG" > $OUT_DIR/summary.txt

FILES=$FOLDER/*report.txt
for f in $FILES
do
	SAMPLE=$(head -n1 -q $f)
	Total_strings=$(grep -oP "(?<=Total number of methylation call strings processed: )[^ ]+" $f)
	Total_Cs=$(grep -oP "(?<=Total number of C's analysed:\t)[^ ]+" $f)
	Total_CsM_CpG=$(grep -oP "(?<=Total methylated C's in CpG context:\t)[^ ]+" $f)
	Total_CsM_CHG=$(grep -oP "(?<=Total methylated C's in CHG context:\t)[^ ]+" $f)
	Total_CsM_CHH=$(grep -oP "(?<=Total methylated C's in CHH context:\t)[^ ]+" $f)
	Total_CsU_CpG=$(grep -oP "(?<=Total C to T conversions in CpG context:\t)[^ ]+" $f)
	Total_CsU_CHG=$(grep -oP "(?<=Total C to T conversions in CHG context:\t)[^ ]+" $f)
	Total_CsU_CHH=$(grep -oP "(?<=Total C to T conversions in CHG context:\t)[^ ]+" $f)
	CsM_CpG=$(grep -oP "(?<=C methylated in CpG context:\t)[^ ]+" $f)
	CsM_non_CpG=$(grep -oP "(?<=C methylated in non-CpG context:\t)[^ ]+" $f)
	echo -e "$SAMPLE\t$Total_strings\t$Total_Cs\t$Total_CsM_CpG\t$Total_CsM_CHG\t$Total_CsM_CHH\t$Total_CsU_CpG\t$Total_CsU_CHG\t$Total_CsU_CHH\t$CsM_CpG\t$CsM_non_CpG"  >> $OUT_DIR/summary.txt
done

# Finish clock
date >> $OUT_DIR/$CLOCK
