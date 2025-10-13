# load the packages you need 
library(WGCNA)
library(dplyr)


# getting results for the relevant contrasts -- first genotype, then habitat
res_geno <- as.data.frame(results(expDiff, contrast=c("genotype", "AP13", "DAC6")))
res_hab <- as.data.frame(results(expDiff, contrast=c("habitat", "KBSM", "PKLE")))

# getting the top 5% most differentiated genes 
topGenes_geno <- top_n(res, -1845, padj)
topGenes_hab <- top_n(res_hab, -1845, padj)



