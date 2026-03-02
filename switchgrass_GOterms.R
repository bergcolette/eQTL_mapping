
library(dplyr)
library(gridExtra)
library(ggplot2)
library(DESeq2)
library(clusterProfiler)
library(GO.db)
library(enricher)


# read in the genes with GO terms from the annotation 
Pvirg_GOterms <- read.csv("~/Dropbox/LowryLab/Pavir_GOterms_multiple.csv")

# melt so there is one line per gene / GO term pair
longer_GOterms <- unique(melt(Pvirg_GOterms,
                              id.vars=c("locusName")))

test_mult <- as.data.frame(cbind(longer_GOterms$value,
                                 longer_GOterms$locusName))

# extract names of GO terms

# Extract a named vector of all GO terms and their names
goterms <- Term(GOTERM)

# Convert to a data frame for easier use
term2name <- data.frame("GOID" = names(goterms), "term" = goterms)


# read in DE genes
genes_fullModel <- read.csv("~/Dropbox/LowryLab/data/genotype_habitat_DE.csv")
genes_genotypeContrast <- read.csv("~/Dropbox/LowryLab/data/AP13_DAC6_DE.csv")
genes_habitatContrast <- read.csv("~/Dropbox/LowryLab/data/KBSM_PKLE_DE.csv")


# make dotplots 
enrich_object_genotypes <- enricher(as.vector(filter(genes_genotypeContrast,
                                                     diffexpressed!="NO")$gene), 
                                    pvalueCutoff = 0.05, 
                                    pAdjustMethod = "BH", 
                                    minGSSize = 10, 
                                    maxGSSize = 500, qvalueCutoff = 0.2,
                                    TERM2GENE=test_mult, TERM2NAME = term2name)

# habitat contrast
enrich_object_habitat <- enricher(as.vector(filter(genes_habitatContrast,
                                                   diffexpressed!="NO")$gene), 
                                  pvalueCutoff = 0.05, 
                                  pAdjustMethod = "BH", 
                                  minGSSize = 10, 
                                  maxGSSize = 500, qvalueCutoff = 0.2,
                                  TERM2GENE=test_mult, TERM2NAME = term2name)

# full model contrast
enrich_object_fullModel <- enricher(as.vector(filter(genes_fullModel,
                                                     diffexpressed!="NO")$gene), 
                                    pvalueCutoff = 0.05, 
                                    pAdjustMethod = "BH", 
                                    minGSSize = 10, 
                                    maxGSSize = 500, qvalueCutoff = 0.2,
                                    TERM2GENE=Pvirg_GOterms, TERM2NAME = term2name)

gen_con <- dotplot(enrich_object_genotypes) + ggtitle("AP13 vs. DAC6") + theme(legend.position = "none")
hab_con <- dotplot(enrich_object_habitat) + ggtitle("MI vs. TX") + theme(legend.position = "none")
full_con <-  dotplot(enrich_object_fullModel) + ggtitle("full model")

grid.arrange(gen_con,
             hab_con,
             full_con)
