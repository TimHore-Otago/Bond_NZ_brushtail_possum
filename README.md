# NZ brushtail possum genome
This repository contains the scripts and datasets for the paper "The admixed genome of New Zealand brushtail possum reveals invasion history and novel marsupial imprinted genes, Bond et al."

## Components of the analysis
### Scripts
- Bash script for RNA-seq variant calling.
- Bash script for DNA-seq variant calling.
- Bash script for mithocondrial genome reconstruction.
- Bash script for low-coverage whole genome bisulfite sequencing analysis.
- Bash script for allele-specific methylation using NanoMethPhase.

### Datasets
These are the raw sequencing files for various amplicon sequencing analyses
"See Figure 5a-h, Figure S2c, Figure S4a-e, Supplementary Data 4 and Source Data file for processed results (following trimming, aligning and variant calling at SNP position - see methods for further details)"
- Folder iSeq036
"DNA amplicons for genotyping a subset of population for SNPs: H19, IGF2R, UBP1, GPX7, MLH1 "
"See 'iSeq036_DNAamplicons.txt' file for sample names, R1 and R2 sequencing files, and amplicons present in file (per sample)"
See 'Amplicon_products_iSeq036.fasta' file for reference amplicon sequences used for mapping sequencing reads
- Folder iSeq037_1
DNA amplicons for genotyping subset of population for SNPs in: EPM2AIP1
"See iSeq037_1_DNAamplicons.txt file for sample names, R1 and R2 sequencing files, and specific amplicons present in file (per sample)"
See 'Amplicon_products_iSeq037_1.fasta' file for specific reference amplicon sequences used for mapping sequencing reads
- Folder iSeq037_2
"DNA amplicons for genotyping a remainder of population for SNPs: H19, IGF2R, UBP1, GPX7, MLH1, EPM2AIP1"
"See 'iSeq037_2_DNAamplicons.txt' file for sample names, R1 and R2 sequencing files, and specific amplicons present in file (per sample)"
See 'Amplicon_products_iSeq037_2.fasta' file for specific reference amplicon sequences used for mapping sequencing reads
- Folder iSeq047
DNA amplicons for genotyping a remainder of population for SNPs: MLH1
"See 'iSeq047_DNAamplicons.txt' file for sample names, R1 and R2 sequencing files, and specific amplicons present in file (per sample)"
See 'Amplicon_products_iSeq047.fasta' file for specific reference amplicon sequences used for mapping sequencing reads
- Folder iSeq042
DNA amplicons for genotyping population for SNPs: IGF2
"See 'iSeq042_DNAamplicons.txt' file for sample names, R1 and R2 sequencing files, and specific amplicons present in file (per sample)"
See 'Amplicon_products_iSeq042.fasta' file for specific reference amplicon sequences used for mapping sequencing reads
- Folder RT_PCR_samples
This data is  specifically for RT-PCR results presented in Supplementary Data 4 (RT-PCR analysis tab)
 - Subfolder: DNAamplicons_mothers
"DNA amplicons for genotyping various mothers for SNPs: H19, IGF2R, UBP1, GPX7, MLH1, EPM2AIP1"
"See 'DNAamplicons_mothers.txt' file for sample names, R1 and R2 sequencing files, and specific amplicons present in file (per sample)"
See 'Amplicon_products_mothers.fasta' file for specific reference amplicon sequences used for mapping sequencing reads
 - Subfolder
"DNA amplicons for genotyping various pouch young for SNPs: H19, IGF2R, UBP1, GPX7, MLH1, EPM2AIP1"
"See 'DNAamplicons_PouchYoung.txt' file for sample names, R1 and R2 sequencing files, and specific amplicons present in file (per sample)"
See 'Amplicon_products_PouchYoung.fasta' file for specific reference amplicon sequences used for mapping sequencing reads
 - Subfolder: cDNA_PY
"cDNA amplicons from heterozygous pouch young (with homozygous mothers) to determine parent of origin expression - SNPs in: H19, IGF2R, UBP1, GPX7, MLH1, EPM2AIP1"
"See 'cDNA_PY.txt' file for sample names, R1 and R2 sequencing files, and specific amplicons present in file (per sample)"
See 'Amplicon_products_cDNA.fasta' file for specific reference amplicon sequences used for mapping sequencing reads

Last update: 16:00 16/08/2023 EST