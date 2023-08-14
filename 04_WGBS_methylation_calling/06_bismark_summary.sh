#!/bin/bash -e

#SBATCH --job-name	 06_bismark_summary
#SBATCH --account        uoo00071
#SBATCH --time           01:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    4096                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  1                            # Number of cores per task
#SBATCH --partition	 prepost                        # Partition
#SBATCH --output         06_bismark_summary%j.out           # Include the job ID in the names of the
#SBATCH --error          06_bismark_summary%j.err           # Output and error files

# Variables
OUT_DIR=06_bismark_summary
FOLDER=05_bismark
CLOCK=clock.txt

# Make output directory
#mkdir $OUT_DIR

# Start clock
date > $OUT_DIR/$CLOCK

# Make summary
echo -e "Sample\tReads_number\tUnique_best_hit\tMapping_efficiency\tNo_alignments\tTotal_Cs\tTotal_CsM_CpG\tTotal_CsM_CHG\tTotal_CsM_CHH\tTotal_CsM_UNKNOWN\tTotal_CsU_CpG\tTotal_CsU_CHG\tTotal_CsU_CHH\tTotal_CsU_UNKNOWN\tCsM_CpG\tCsM_CHG\tCsM_CHH\tCsM_UNKNOWN" > $OUT_DIR/summary.txt

FILES=$FOLDER/*report.txt
for f in $FILES
do
	SAMPLE=$(grep -oP "(?<=trimmed\/)[^\s]+" $f)
	READS_NUMBER=$(grep -oP "(?<=Sequences analysed in total:\t)[^ ]+" $f)
	UNIQUE_BEST_HIT=$(grep -oP "(?<=Number of alignments with a unique best hit from the different alignments:\t)[^ ]+" $f)
	MAPPING_EFFICIENCY=$(grep -oP "(?<=Mapping efficiency:\t)[^ ]+" $f)
	NO_ALIGMENTS=$(grep -oP "(?<=Sequences with no alignments under any condition:\t)[^ ]+" $f)
	Total_Cs=$(grep -oP "(?<=Total number of C's analysed:\t)[^ ]+" $f)
	Total_CsM_CpG=$(grep -oP "(?<=Total methylated C's in CpG context:\t)[^ ]+" $f)
	Total_CsM_CHG=$(grep -oP "(?<=Total methylated C's in CHG context:\t)[^ ]+" $f)
	Total_CsM_CHH=$(grep -oP "(?<=Total methylated C's in CHH context:\t)[^ ]+" $f)
	Total_CsM_UNKNOWN=$(grep -oP "(?<=Total methylated C's in Unknown context:\t)[^ ]+" $f)
	Total_CsU_CpG=$(grep -oP "(?<=Total unmethylated C's in CpG context:\t)[^ ]+" $f)
        Total_CsU_CHG=$(grep -oP "(?<=Total unmethylated C's in CHG context:\t)[^ ]+" $f)
        Total_CsU_CHH=$(grep -oP "(?<=Total unmethylated C's in CHH context:\t)[^ ]+" $f)
        Total_CsU_UNKNOWN=$(grep -oP "(?<=Total unmethylated C's in Unknown context:\t)[^ ]+" $f)
	CsM_CpG=$(grep -oP "(?<=C methylated in CpG context:\t)[^ ]+" $f)
	CsM_CHG=$(grep -oP "(?<=C methylated in CHG context:\t)[^ ]+" $f)
	CsM_CHH=$(grep -oP "(?<=C methylated in CHH context:\t)[^ ]+" $f)
	CsM_UNKNOWN=$(grep -oP "(?<=C methylated in Unknown context \(CN or CHN\):\t)[^ ]+" $f)
	echo -e "$SAMPLE\t$READS_NUMBER\t$UNIQUE_BEST_HIT\t$MAPPING_EFFICIENCY\t$NO_ALIGMENTS\t$Total_Cs\t$Total_CsM_CpG\t$Total_CsM_CHG\t$Total_CsM_CHH\t$Total_CsM_UNKNOWN\t$Total_CsU_CpG\t$Total_CsU_CHG\t$Total_CsU_CHH\t$Total_CsU_UNKNOWN\t$CsM_CpG\t$CsM_CHG\t$CsM_CHH\t$CsM_UNKNOWN" >> $OUT_DIR/summary.txt
done

# Finish clock
date >> $OUT_DIR/$CLOCK
