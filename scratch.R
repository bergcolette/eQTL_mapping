library(viridis)
library(gridExtra)
library(dplyr)
library(slider)
library(ggplot2)

grid.arrange(KBS_alt, KBS_ref, nrow = 1)


grid.arrange(Atlantic_MI_sfsPlot, Atlantic_TX_sfsPlot,
             Gulf_MI_sfsPlot, Gulf_TX_sfsPlot, nrow =2,
             bottom = "Folded Site Frequency Spectrum")

ggplot(Midwest_transHot,
       aes(x = as.numeric(genome_bp)/1000000,
           y = n,
           col = presence)) +
  facet_wrap(~genome_Chrom, 
             nrow = 1,
             scales = "free_x") +
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        #legend.position = "none",
        panel.grid = element_blank()) +
  geom_line() +
  ggtitle("Midwest trans hotspots") +
  scale_color_manual(values=c("dodgerblue",
                              "black",
                              "red"))

ggplot(Gulf_presence_labeled,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = presence)) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        #legend.position = "none",
        panel.grid = element_blank()) +
  geom_point(size = 0.75) +
  ggtitle("eGWAS Results") +
  scale_color_manual(values=c("dodgerblue",
                              "black",
                              "red")) +
  xlab("Genome Position (Mb)") +
  ylab("Gene Position (Mb)") 

ggplot(Midwest_TX_eQTLs_filt,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  scale_color_viridis() + 
  ggtitle("Midwest eQTLs, TX")

ggplot(Midwest_MI_eQTLs_filt,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  scale_color_viridis() + 
  ggtitle("Midwest eQTLs, MI")

ggplot(Atlantic_MI_eQTLs_filt,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  scale_color_viridis() + 
  ggtitle("Atlantic eQTLs, MI")

ggplot(Atlantic_TX_eQTLs_filt,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  scale_color_viridis() + 
  ggtitle("Atlantic eQTLs, TX")


ggplot(Atlantic_TX_eQTLs_filt,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  scale_color_viridis() + 
  ggtitle("Atlantic eQTLs, TX")



ggplot(Gulf_TX_eQTLs_filt,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  scale_color_viridis() + 
  ggtitle("Gulf eQTLs, TX")

ggplot(filter(Gulf_MI_eQTLs, FDR < 0.1),
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none") +
  geom_point(size = 0.25) +
  scale_color_viridis() + 
  ggtitle("Midwest eQTLs, GxE")






MidwestTXtrans$row.names <- MidwestTXtrans$genome_Chrom
MidwestTXtrans$CHROM <- as.numeric(MidwestTXtrans$genome_bp)

MidwestTXcis$row.names <- MidwestTXcis$genome_Chrom
MidwestTXcis$CHROM <- as.numeric(MidwestTXcis$genome_bp)

Atl_TX_trans_SFS <- inner_join(MidwestTXtrans, Midwest_folded, by = c("row.names", "CHROM"))
Atl_TX_cis_SFS <- inner_join(MidwestTXcis, Midwest_folded, by = c("row.names", "CHROM"))

t.test(Atl_TX_trans_SFS$freq_folded, Atl_TX_cis_SFS$freq_folded)



MidwestMItrans$row.names <- MidwestMItrans$genome_Chrom
MidwestMItrans$CHROM <- as.numeric(MidwestMItrans$genome_bp)

MidwestMIcis$row.names <- MidwestMIcis$genome_Chrom
MidwestMIcis$CHROM <- as.numeric(MidwestMIcis$genome_bp)

Atl_MI_trans_SFS <- inner_join(MidwestMItrans, Midwest_folded, by = c("row.names", "CHROM"))
Atl_MI_cis_SFS <- inner_join(MidwestMIcis, Midwest_folded, by = c("row.names", "CHROM"))

hist(Atl_MI_trans_SFS$freq_folded)
hist(Atl_MI_cis_SFS$freq_folded)



AtlanticTXtrans$row.names <- AtlanticTXtrans$genome_Chrom
AtlanticTXtrans$CHROM <- as.numeric(AtlanticTXtrans$genome_bp)

AtlanticTXcis$row.names <- AtlanticTXcis$genome_Chrom
AtlanticTXcis$CHROM <- as.numeric(AtlanticTXcis$genome_bp)

Atl_TX_trans_SFS <- inner_join(AtlanticTXtrans, Atlantic_folded, by = c("row.names", "CHROM"))
Atl_TX_cis_SFS <- inner_join(AtlanticTXcis, Atlantic_folded, by = c("row.names", "CHROM"))

t.test(Atl_TX_trans_SFS$freq_folded, Atl_TX_cis_SFS$freq_folded)

hist(Atl_TX_trans_SFS$freq_folded)
hist(Atl_TX_cis_SFS$freq_folded)


AtlanticMItrans$row.names <- AtlanticMItrans$genome_Chrom
AtlanticMItrans$CHROM <- as.numeric(AtlanticMItrans$genome_bp)

AtlanticMIcis$row.names <- AtlanticMIcis$genome_Chrom
AtlanticMIcis$CHROM <- as.numeric(AtlanticMIcis$genome_bp)

Atl_MI_trans_SFS <- inner_join(AtlanticMItrans, Atlantic_folded, by = c("row.names", "CHROM"))
Atl_MI_cis_SFS <- inner_join(AtlanticMIcis, Atlantic_folded, by = c("row.names", "CHROM"))

t.test(Atl_MI_trans_SFS$freq_folded, Atl_MI_cis_SFS$freq_folded)

hist(Atl_MI_trans_SFS$freq_folded)
hist(Atl_MI_cis_SFS$freq_folded)


# format eQTLs, Gulf
GulfMIcis <- dplyr::select(filter(Gulf_MI_eQTLs, type == "cis", FDR < 0.1), gene, genome_Chrom, genome_bp)
GulfTXcis <- dplyr::select(filter(Gulf_TX_eQTLs, type == "cis", FDR < 0.1), gene, genome_Chrom, genome_bp)

GulfMItrans <- dplyr::select(filter(Gulf_MI_eQTLs, type == "trans", FDR < 0.1), gene, genome_Chrom, genome_bp)
GulfTXtrans <- dplyr::select(filter(Gulf_TX_eQTLs, type == "trans", FDR < 0.1), gene, genome_Chrom, genome_bp)



nrow(GulfTXtrans)
nrow(GulfTXcis)
nrow(GulfMItrans)
nrow(GulfMIcis)


nrow(intersect(GulfMIcis, GulfTXcis))
nrow(intersect(GulfMItrans, GulfTXtrans))

# format eQTLs, Atlantic
AtlanticMIcis <- dplyr::select(filter(Atlantic_MI_eQTLs, type == "cis", FDR < 0.1), gene, genome_Chrom, genome_bp)
AtlanticTXcis <- dplyr::select(filter(Atlantic_TX_eQTLs, type == "cis", FDR < 0.1), gene, genome_Chrom, genome_bp)

AtlanticMItrans <- dplyr::select(filter(Atlantic_MI_eQTLs, type == "trans", FDR < 0.1), gene, genome_Chrom, genome_bp)
AtlanticTXtrans <- dplyr::select(filter(Atlantic_TX_eQTLs, type == "trans", FDR < 0.1), gene, genome_Chrom, genome_bp)

hist()


## SFS for Atlantic TX 
AtlanticTXtrans$row.names <- AtlanticTXtrans$genome_Chrom
AtlanticTXtrans$CHROM <- as.numeric(AtlanticTXtrans$genome_bp)

AtlanticTXcis$row.names <- AtlanticTXcis$genome_Chrom
AtlanticTXcis$CHROM <- as.numeric(AtlanticTXcis$genome_bp)

Atl_TX_trans_SFS <- inner_join(AtlanticTXtrans, Atlantic_folded, by = c("row.names", "CHROM"))
Atl_TX_cis_SFS <- inner_join(AtlanticTXcis, Atlantic_folded, by = c("row.names", "CHROM"))

## SFS for Atlantic MI 
AtlanticMItrans$row.names <- AtlanticMItrans$genome_Chrom
AtlanticMItrans$CHROM <- as.numeric(AtlanticMItrans$genome_bp)

AtlanticMIcis$row.names <- AtlanticMIcis$genome_Chrom
AtlanticMIcis$CHROM <- as.numeric(AtlanticMIcis$genome_bp)

Atl_MI_trans_SFS <- inner_join(AtlanticMItrans, Atlantic_folded, by = c("row.names", "CHROM"))
Atl_MI_cis_SFS <- inner_join(AtlanticMIcis, Atlantic_folded, by = c("row.names", "CHROM"))


hist(Atl_MI_trans_SFS$freq_folded)
hist(Atl_MI_cis_SFS$freq_folded)

nrow(AtlanticTXtrans)
nrow(AtlanticTXcis)
nrow(AtlanticMItrans)
nrow(AtlanticMIcis)




nrow(intersect(AtlanticMIcis, AtlanticTXcis))
nrow(intersect(AtlanticMItrans, AtlanticTXtrans))



# format eQTLs, Midwest
MidwestMIcis <- dplyr::select(filter(Midwest_MI_eQTLs, type == "cis", FDR < 0.1), gene, genome_Chrom, genome_bp)
MidwestTXcis <- dplyr::select(filter(Midwest_TX_eQTLs, type == "cis", FDR < 0.1), gene, genome_Chrom, genome_bp)

MidwestMItrans <- dplyr::select(filter(Midwest_MI_eQTLs, type == "trans", FDR < 0.1), gene, genome_Chrom, genome_bp)
MidwestTXtrans <- dplyr::select(filter(Midwest_TX_eQTLs, type == "trans", FDR < 0.1), gene, genome_Chrom, genome_bp)


nrow(MidwestTXtrans)
nrow(MidwestTXcis)
nrow(MidwestMItrans)
nrow(MidwestMIcis)


nrow(intersect(MidwestMIcis, MidwestTXcis))
nrow(intersect(MidwestMItrans, MidwestTXtrans))


# format eQTLs, Atlantic



6868/16779

1620/5593

merge((filter(Gulf_MI_eQTLs,
     type == "cis",
     FDR < 0.1)),
     (filter(Gulf_TX_eQTLs,
            type == "cis",
            FDR < 0.1)),
     id.vars=c("gene"))

filter(Gulf_MI_eQTLs,
       type == "cis",
       FDR < 0.1)

filter(Gulf_TX_eQTLs,
       type == "cis",
       FDR < 0.1)



ggplot(filter(Gulf_MI_eQTLs, FDR < 0.1),
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none") +
  geom_point(size = 0.25) +
  scale_color_viridis() + 
  ggtitle("Midwest eQTLs, GxE")


View(filter(Gulf_MI_eQTLs, FDR < 0.1,
      as.numeric(genome_bp) < 1100000,
      as.numeric(genome_bp) > 1090000,
      genome_Chrom == "Chr01N"))

View(Atlantic_GxE_eQTLs)

Atlantic_MI_eQTLs$genome_Chrom <- factor(Atlantic_MI_eQTLs$genome_Chrom,
                                         levels = c("Chr09N",
                                                    "Chr09K",
                                                    "Chr08N",
                                                    "Chr08K",
                                                    "Chr07N",
                                                    "Chr07K",
                                                    "Chr06N",
                                                    "Chr06K",
                                                    "Chr05N",
                                                    "Chr05K",
                                                    "Chr04N",
                                                    "Chr04K",
                                                    "Chr03N",
                                                    "Chr03K",
                                                    "Chr02N",
                                                    "Chr02K",
                                                    "Chr01N",
                                                    "Chr01K"))


nrow(filter(Midwest_MI_eQTLs,
              type == "trans",
              FDR < 0.1))

summarize_trans <- filter(Atlantic_TX_eQTLs,
                          type == "trans",
                          FDR < 0.1) %>% 
  group_by(geneid) %>% 
  summarise(n = n())

View(summarize_trans)

summarize_trans_hotspots <- filter(Midwest_MI_eQTLs,
                          type == "trans",
                          FDR < 0.1) %>% 
  group_by(genome_Chrom,
             genome_bp) %>% 
  summarise(n = n())


ggplot(filter(Atlantic_MI_eQTLs,
              genome_Chrom != "scaffold_174",
              genome_Chrom !="scaffold_19",
              genome_Chrom != "scaffold_24",
              FDR < 0.05),
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none") +
  geom_point(size = 0.25) +
  scale_color_viridis() + 
  ylab("Gene Position") +
  xlab("Genome Position") + 
  ggtitle("Atlantic eQTLs, KBSM")









ggplot(filter(Atlantic_MI_eQTLs,
              FDR < 0.1,
              genome_Chrom != "scaffold_174",
              genome_Chrom !="scaffold_19",
              genome_Chrom != "scaffold_24"),
       aes(x = as.numeric(genome_bp)/1000000,
           y = as.numeric(s1)/1000000)) +
  facet_grid(genome_Chrom~chr) + 
  geom_point()


nrow(filter(Atlantic_MI_eQTLs, FDR < 0.1))

pca <- prcomp(dplyr::select(expressionData,
              -GeneID,
              -row_median,
              -row_max,
              -row_mean))


ggplot(pca$x, aes(x = PC1,
                y = PC2)) + 
  geom_point()

output <- as.data.frame(pca$x)

output$GeneID <- rownames(output)

pcMerge <- merge(transSum, output)

ggplot(pcMerge, aes(x = PC1,
                    y = PC2,
                    label=GeneID)) +
  geom_point() +
  geom_text()

ggplot(pcMerge,
       aes(x = n,
           y= PC1)) + 
  geom_point()

biplot(pca)

expressionData$row_median <- apply(dplyr::select(expressionData, -GeneID),
                                   1, median, na.rm=TRUE)

expressionData$row_max <- apply(dplyr::select(expressionData, -GeneID),
                                   1, max, na.rm=TRUE)

expressionData$row_mean <- apply(dplyr::select(expressionData, -GeneID),
                                1, mean, na.rm=TRUE)
# filter
exp_medFilt <- dplyr::filter(expressionData,
                             row_median>3)

dplyr::select(expressionData, 
              GeneID,
              row_median)

hist(expressionData$row_median)
hist(expressionData$row_max)
hist(expressionData$row_mean)

genes_means_raw <- dplyr::select(expressionData, GeneID, row_mean, row_median, row_max)

hist(as.numeric(t(filter(expressionData, 
              GeneID == "Pavir.9KG114100"))[-1]))

transSum <- as.data.frame(summarize_trans)
transSum$GeneID <- transSum$geneid
transSum

datMerge <- merge(transSum, genes_means_raw,
      id.vars=c("GeneID"))

ggplot(filter(datMerge,
              n > 10),
       aes(x = row_mean,
           y = n)) +
  geom_point() +
  geom_abline(method="lm")


summary(lm(row_median ~ n,
   filter(datMerge,
          n > 15)))

View(MI_Gulf_geneExpression)

grid.arrange(gen_con,
             hab_con,
             full_con,
             nrow = 1)

ggplot(filter(DE, 
              Chrom != "",
              diffexpressed != "NO"),
       aes(x = geneNum/1000,
           y= -log10(padj),
           col = diffexpressed)) +
  facet_wrap(~Chrom,
             nrow = 1,
             scales = "free_x") +
  geom_point() +
  theme_bw()

ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj), col = diffexpressed)) +
  geom_point() +
  theme_minimal() +
  scale_color_manual(values = c("NO" = "grey", "UP" = "red", "DOWN" = "blue")) +
  labs(title = "Volcano Plot", x = "Log2 Fold Change", y = "-Log10 Adjusted P-value") +
  geom_vline(xintercept = c(-1, 1), col = "grey") + # Add vertical lines for LFC threshold
  geom_hline(yintercept = -log10(0.05), col = "grey")



cut(filter(MI_Atlantic_eQTLs,
            FDR < 0.1)$genome_bp, 100,
    labels = NULL, include.lowest = FALSE, 
    right = TRUE, dig.lab = 3, 
    ordered_result = FALSE)

nrow(filter(TX_Atlantic_eQTLs,
            FDR < 0.1))



Gulf_MI_eQTLs


Gulf_MI_eQTLs

grid.arrange(GxE_Atlantic_plot,
             TX_Atlantic_plot,
             MI_Atlantic_plot,
             nrow=1)

ggplot(dplyr::filter(Gulf_MI_eQTLs, 
                     FDR < 0.05),
       aes(x = as.numeric(genome_bp)/1000000,
           y = as.numeric(s1)/1000000,
           color=-log10(p.value),
           alpha = -log10(p.value))) +
  theme_bw() +
  facet_grid(chr~genome_Chrom,
             space = "free",
             scales = "free") +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none") +
  geom_point(size = 0.25) +
  scale_color_viridis()

nrow(dplyr::filter(Gulf_MI_eQTLs, 
              FDR < 0.05))


summarize_trans <- filter(Gulf_MI_eQTLs,
       type == "trans",
       FDR < 0.1) %>% 
  group_by(geneid) %>% 
  summarise(n = n())
View(summarize_trans)

write.csv(summarize_trans, "MI_Gulf_trans_summary.csv")



nrow(filter(Gulf_MI_eQTLs,
            FDR < 0.1,
       chr == "Chr09K",
       s1 > 16715000,
       s1 < 16720000,
       type == "trans"))





MI_Gulf_geneExpression <- read.csv("~/Dropbox/LowryLab/data/expression/genes_MI_Gulf.csv")
hist(as.numeric(t(filter(MI_Gulf_geneExpression, 
       X == "Pavir.1NG496300"))$Pavir.1NG496300))

hist(as.numeric(as.data.frame(t(filter(MI_Gulf_geneExpression, 
         X == "Pavir.1NG496300")))$V1))

hist(as.numeric(as.data.frame(t(filter(MI_Gulf_geneExpression, 
                                       X == "Pavir.6NG167900")))$V1))

head(filter(Gulf_MI_eQTLs, type=="trans"))

hist(as.numeric(as.data.frame(t(filter(MI_Gulf_exp_labeled, 
                                       gene == "000700")))$V1))

MI_Gulf_exp_labeled <- MI_Gulf_geneExpression %>% 
  separate(X, into = c("chrom", "gene"), sep="G")

head(filter(MI_Gulf_exp_labeled, chrom == "Pavir.1N"))

Gulf_MI_eQTLs$genome_Chrom <- factor(Gulf_MI_eQTLs$genome_Chrom,
                          levels = c("Chr09N",
                                     "Chr09K",
                                     "Chr08N",
                                     "Chr08K",
                                     "Chr07N",
                                     "Chr07K",
                                     "Chr06N",
                                     "Chr06K",
                                     "Chr05N",
                                     "Chr05K",
                                     "Chr04N",
                                     "Chr04K",
                                     "Chr03N",
                                     "Chr03K",
                                     "Chr02N",
                                     "Chr02K",
                                     "Chr01N",
                                     "Chr01K"))

ggplot(dplyr::filter(datLab,
                     Chrom != "scaffold_174",
                     Chrom !="scaffold_19",
                     Chrom != "scaffold_24"),
       aes(x = as.numeric(Pos)/1000000,
           y = as.numeric(s1)/1000000,
           color=-log10(p.value),
           alpha = -log10(p.value))) +
  theme_bw() +
  facet_grid(chr~Chrom,
             space = "free",
             scales = "free") +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none") +
  geom_point(size = 0.25) +
  scale_color_viridis() +
  ylab("Genome Position (Mb)") +
  xlab("Gene Position (Mb)")  +
  ggtitle("GxE eQTLs, Midwest Only")


GxE_eQTLs$chr <- factor(GxE_eQTLs$chr,levels = c("Chr09N",
                                     "Chr09K",
                                     "Chr08N",
                                     "Chr08K",
                                     "Chr07N",
                                     "Chr07K",
                                     "Chr06N",
                                     "Chr06K",
                                     "Chr05N",
                                     "Chr05K",
                                     "Chr04N",
                                     "Chr04K",
                                     "Chr03N",
                                     "Chr03K",
                                     "Chr02N",
                                     "Chr02K",
                                     "Chr01N",
                                     "Chr01K"))






ggplot(filter(GxE_summ,
              median > 0.25,
              chr != "scaffold_19"),
       aes(x=s1/1000000,
           y = median)) +
  facet_wrap(~chr,
             ncol=2,
             strip.position="left") + 
  geom_point(size = 0.8) +
  theme_bw()




cisTest <- read.csv("data/TX_2N_cis.txt",
                    sep= "\t")

ggplot(cisTest, 
       aes(x = SNP,
           y = p.value))

MI_exp <- read.csv("MI_median.csv")


ggplot(filter(MI_exp,
              Chrom != "scaffold_19",
              Chrom != "scaffold_34",
              Chrom != "scaffold_390",
              Chrom != "scaffold_174"),
       aes(x=Chrom,
           y=median,
           fill = subgenome)) +
  geom_boxplot() +
  theme_bw() +
  scale_fill_manual(values=c( "mediumpurple",
                              "yellow"))

# read in the data output (one chrom at a time for now)
output1K <- read.csv("data/TX_2N_cis.txt",
                     sep="\t")

# merging eQTLs with gene position 
posMerge_1K <- merge(output1K, 
                     genePos,
                     ID.vars = c("gene"),
                     all.x = TRUE)

# merging eQTLs with gene position and SNP position 
allMerge <- merge(posMerge_1K,
                  snpsPos,
                  ID.vars = SNP,
                  all.x=TRUE)

# filtering out columns I don't need 
mergeFilt <- dplyr::select(allMerge,
                           SNP,
                           gene,
                           p.value,
                           chr,
                           s1,
                           V3)

# this is a scratch area for plotting 

ggplot(filter(mergeFilt,
              chr != "scaffold_19",
              chr != "scaffold_34",
              -log10(p.value) > 13),
       aes(x = V3/1000000,
           y = s1/1000000,
           color=-log10(p.value),
           alpha = -log10(p.value))) +
  geom_point() +
  theme_bw() +
  scale_color_viridis() +
  facet_wrap(~chr,
             nrow = 9,
             strip.position = "left") +
  ylab("Gene Position (Mb)") +
  xlab("Chr 01K Position (Mb)") +
  theme(legend.position = "none",
        strip.background = element_rect(fill="white"))








ggplot(summTX,
       aes(x=chr,
           y=median,
           fill = subgenome)) +
  theme_bw() +
  geom_boxplot() +
  scale_fill_manual(values=c( "mediumpurple",
                              "yellow"))

grid.arrange(cis, trans)


chrom7K = "~/Dropbox/lowryLab/data/Chr07K_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom7K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_TX_7K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneTX,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/TX_7K.txt",
  output_file_name.cis = "data/TX_7K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



chrom7N = "~/Dropbox/lowryLab/data/Chr07N_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom7N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_TX_7N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneTX,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/TX_7N.txt",
  output_file_name.cis = "data/TX_7N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



chrom8K = "~/Dropbox/lowryLab/data/Chr08K_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom8K)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_TX_8K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneTX,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/TX_8K.txt",
  output_file_name.cis = "data/TX_8K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)




chrom8N = "~/Dropbox/lowryLab/data/Chr08N_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom8N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_TX_8N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneTX,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/TX_8N.txt",
  output_file_name.cis = "data/TX_8N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)


chrom9K = "~/Dropbox/lowryLab/data/Chr09K_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom9K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_TX_9K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneTX,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/TX_9K.txt",
  output_file_name.cis = "data/TX_9K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



chrom9N = "~/Dropbox/lowryLab/data/Chr09N_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom9N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_TX_9N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneTX,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/TX_9N.txt",
  output_file_name.cis = "data/TX_9N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)