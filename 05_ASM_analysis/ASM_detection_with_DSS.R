# Script ASM detection with DSS

library(DSS)

###########################################################################

# Chr 1
HP1 <- read.table("Sandy_merged_chr1_NanoMethPhase_HP1_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP2 <- read.table("Sandy_merged_chr1_NanoMethPhase_HP2_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP1_DSS <- data.frame("chr"= HP1$chromosome,"pos"=HP1$start,"N"=HP1$NumOfAllCalls,"X"=HP1$NumOfModCalls)
HP2_DSS <- data.frame("chr"= HP2$chromosome,"pos"=HP2$start,"N"=HP2$NumOfAllCalls,"X"=HP2$NumOfModCalls)
BSobj <- makeBSseqData(list(HP1_DSS,HP2_DSS),c("HP1","HP2"))
dmlTest1 <- DMLtest(BSobj, group1=c("HP1"), group2=c("HP2"), smoothing=TRUE, smoothing.span=500)

# Chr 2
HP1 <- read.table("Sandy_merged_chr2_NanoMethPhase_HP1_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP2 <- read.table("Sandy_merged_chr2_NanoMethPhase_HP2_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP1_DSS <- data.frame("chr"= HP1$chromosome,"pos"=HP1$start,"N"=HP1$NumOfAllCalls,"X"=HP1$NumOfModCalls)
HP2_DSS <- data.frame("chr"= HP2$chromosome,"pos"=HP2$start,"N"=HP2$NumOfAllCalls,"X"=HP2$NumOfModCalls)
BSobj <- makeBSseqData(list(HP1_DSS,HP2_DSS),c("HP1","HP2"))
dmlTest2 <- DMLtest(BSobj, group1=c("HP1"), group2=c("HP2"), smoothing=TRUE, smoothing.span=500)

# Chr 3
HP1 <- read.table("Sandy_merged_chr3_NanoMethPhase_HP1_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP2 <- read.table("Sandy_merged_chr3_NanoMethPhase_HP2_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP1_DSS <- data.frame("chr"= HP1$chromosome,"pos"=HP1$start,"N"=HP1$NumOfAllCalls,"X"=HP1$NumOfModCalls)
HP2_DSS <- data.frame("chr"= HP2$chromosome,"pos"=HP2$start,"N"=HP2$NumOfAllCalls,"X"=HP2$NumOfModCalls)
BSobj <- makeBSseqData(list(HP1_DSS,HP2_DSS),c("HP1","HP2"))
dmlTest3 <- DMLtest(BSobj, group1=c("HP1"), group2=c("HP2"), smoothing=TRUE, smoothing.span=500)

# Chr 4
HP1 <- read.table("Sandy_merged_chr4_NanoMethPhase_HP1_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP2 <- read.table("Sandy_merged_chr4_NanoMethPhase_HP2_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP1_DSS <- data.frame("chr"= HP1$chromosome,"pos"=HP1$start,"N"=HP1$NumOfAllCalls,"X"=HP1$NumOfModCalls)
HP2_DSS <- data.frame("chr"= HP2$chromosome,"pos"=HP2$start,"N"=HP2$NumOfAllCalls,"X"=HP2$NumOfModCalls)
BSobj <- makeBSseqData(list(HP1_DSS,HP2_DSS),c("HP1","HP2"))
dmlTest4 <- DMLtest(BSobj, group1=c("HP1"), group2=c("HP2"), smoothing=TRUE, smoothing.span=500)

# Chr 5
HP1 <- read.table("Sandy_merged_chr5_NanoMethPhase_HP1_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP2 <- read.table("Sandy_merged_chr5_NanoMethPhase_HP2_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP1_DSS <- data.frame("chr"= HP1$chromosome,"pos"=HP1$start,"N"=HP1$NumOfAllCalls,"X"=HP1$NumOfModCalls)
HP2_DSS <- data.frame("chr"= HP2$chromosome,"pos"=HP2$start,"N"=HP2$NumOfAllCalls,"X"=HP2$NumOfModCalls)
BSobj <- makeBSseqData(list(HP1_DSS,HP2_DSS),c("HP1","HP2"))
dmlTest5 <- DMLtest(BSobj, group1=c("HP1"), group2=c("HP2"), smoothing=TRUE, smoothing.span=500)

# Chr 6
HP1 <- read.table("Sandy_merged_chr6_NanoMethPhase_HP1_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP2 <- read.table("Sandy_merged_chr6_NanoMethPhase_HP2_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP1_DSS <- data.frame("chr"= HP1$chromosome,"pos"=HP1$start,"N"=HP1$NumOfAllCalls,"X"=HP1$NumOfModCalls)
HP2_DSS <- data.frame("chr"= HP2$chromosome,"pos"=HP2$start,"N"=HP2$NumOfAllCalls,"X"=HP2$NumOfModCalls)
BSobj <- makeBSseqData(list(HP1_DSS,HP2_DSS),c("HP1","HP2"))
dmlTest6 <- DMLtest(BSobj, group1=c("HP1"), group2=c("HP2"), smoothing=TRUE, smoothing.span=500)

# Chr 7
HP1 <- read.table("Sandy_merged_chr7_NanoMethPhase_HP1_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP2 <- read.table("Sandy_merged_chr7_NanoMethPhase_HP2_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP1_DSS <- data.frame("chr"= HP1$chromosome,"pos"=HP1$start,"N"=HP1$NumOfAllCalls,"X"=HP1$NumOfModCalls)
HP2_DSS <- data.frame("chr"= HP2$chromosome,"pos"=HP2$start,"N"=HP2$NumOfAllCalls,"X"=HP2$NumOfModCalls)
BSobj <- makeBSseqData(list(HP1_DSS,HP2_DSS),c("HP1","HP2"))
dmlTest7 <- DMLtest(BSobj, group1=c("HP1"), group2=c("HP2"), smoothing=TRUE, smoothing.span=500)

# Chr 8
HP1 <- read.table("Sandy_merged_chr8_NanoMethPhase_HP1_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP2 <- read.table("Sandy_merged_chr8_NanoMethPhase_HP2_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP1_DSS <- data.frame("chr"= HP1$chromosome,"pos"=HP1$start,"N"=HP1$NumOfAllCalls,"X"=HP1$NumOfModCalls)
HP2_DSS <- data.frame("chr"= HP2$chromosome,"pos"=HP2$start,"N"=HP2$NumOfAllCalls,"X"=HP2$NumOfModCalls)
BSobj <- makeBSseqData(list(HP1_DSS,HP2_DSS),c("HP1","HP2"))
dmlTest8 <- DMLtest(BSobj, group1=c("HP1"), group2=c("HP2"), smoothing=TRUE, smoothing.span=500)

# Chr 9
HP1 <- read.table("Sandy_merged_chr9_NanoMethPhase_HP1_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP2 <- read.table("Sandy_merged_chr9_NanoMethPhase_HP2_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP1_DSS <- data.frame("chr"= HP1$chromosome,"pos"=HP1$start,"N"=HP1$NumOfAllCalls,"X"=HP1$NumOfModCalls)
HP2_DSS <- data.frame("chr"= HP2$chromosome,"pos"=HP2$start,"N"=HP2$NumOfAllCalls,"X"=HP2$NumOfModCalls)
BSobj <- makeBSseqData(list(HP1_DSS,HP2_DSS),c("HP1","HP2"))
dmlTest9 <- DMLtest(BSobj, group1=c("HP1"), group2=c("HP2"), smoothing=TRUE, smoothing.span=500)

# Chr 10
HP1 <- read.table("Sandy_merged_chr10_NanoMethPhase_HP1_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP2 <- read.table("Sandy_merged_chr10_NanoMethPhase_HP2_MethylFrequency.tsv", sep = "\t", header = TRUE)
HP1_DSS <- data.frame("chr"= HP1$chromosome,"pos"=HP1$start,"N"=HP1$NumOfAllCalls,"X"=HP1$NumOfModCalls)
HP2_DSS <- data.frame("chr"= HP2$chromosome,"pos"=HP2$start,"N"=HP2$NumOfAllCalls,"X"=HP2$NumOfModCalls)
BSobj <- makeBSseqData(list(HP1_DSS,HP2_DSS),c("HP1","HP2"))
dmlTest10 <- DMLtest(BSobj, group1=c("HP1"), group2=c("HP2"), smoothing=TRUE, smoothing.span=500)

#  DML test with and without smoothing

DML1_1 <- callDML(dmlTest1, delta=0.1, p.threshold=1e-5)
DMR1_1 <- callDMR(dmlTest1, delta=0, p.threshold=1e-5,
                  minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

DML1_2 <- callDML(dmlTest2, delta=0.1, p.threshold=1e-5)
DMR1_2 <- callDMR(dmlTest2, delta=0, p.threshold=1e-5,
                  minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

DML1_3 <- callDML(dmlTest3, delta=0.1, p.threshold=1e-5)
DMR1_3 <- callDMR(dmlTest3, delta=0, p.threshold=1e-5,
                  minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

DML1_4 <- callDML(dmlTest4, delta=0.1, p.threshold=1e-5)
DMR1_4 <- callDMR(dmlTest4, delta=0, p.threshold=1e-5,
                  minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

DML1_5 <- callDML(dmlTest5, delta=0.1, p.threshold=1e-5)
DMR1_5 <- callDMR(dmlTest5, delta=0, p.threshold=1e-5,
                  minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

DML1_6 <- callDML(dmlTest6, delta=0.1, p.threshold=1e-5)
DMR1_6 <- callDMR(dmlTest6, delta=0, p.threshold=1e-5,
                  minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

DML1_7 <- callDML(dmlTest7, delta=0.1, p.threshold=1e-5)
DMR1_7 <- callDMR(dmlTest7, delta=0, p.threshold=1e-5,
                  minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

DML1_8 <- callDML(dmlTest8, delta=0.1, p.threshold=1e-5)
DMR1_8 <- callDMR(dmlTest8, delta=0, p.threshold=1e-5,
                  minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

DML1_9 <- callDML(dmlTest9, delta=0.1, p.threshold=1e-5)
DMR1_9 <- callDMR(dmlTest9, delta=0, p.threshold=1e-5,
                  minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

DML1_10 <- callDML(dmlTest10, delta=0.1, p.threshold=1e-5)
DMR1_10 <- callDMR(dmlTest10, delta=0, p.threshold=1e-5,
                  minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

library(dplyr)

DMR_all = rbind(DMR1_2,DMR1_3,DMR1_4,DMR1_5,DMR1_6,
                DMR1_7,DMR1_8,DMR1_9,DMR1_10)

DMR_all_20 <- DMR_all[DMR_all$nCG>=20,]
DMR_all_25 <- DMR_all[DMR_all$nCG>=25,]
DMR_all_50 <- DMR_all[DMR_all$nCG>=50,]
write.csv(DMR_all_20,"DMR_t20.csv",quote = FALSE)
write.csv(DMR_all_25,"DMR_t25.csv",quote = FALSE)
write.csv(DMR_all_50,"DMR_t50.csv",quote = FALSE)
