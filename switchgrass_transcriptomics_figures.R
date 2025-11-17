## Drafting / plotting main figures for the switchgrass transcriptoomics paper 

# figure 1: mapping eQTLs 

# first read in the data. there are 9 sets: MI, TX, GxE eQTLs for Midwest, Atlantic, and Gulf populations
# I think I'll only end up plotting 3 instead of all 9, and relegate the remaining 6 to supplemental data 

# MI
MI_Atlantic_eQTLs <- read.csv("~/Dropbox/LowryLab/data/eQTL_output/MI_Atlantic_all_eQTLs.csv")
MI_Gulf_eQTLs <- read.csv("~/Dropbox/LowryLab/data/eQTL_output/MI_Gulf_all_eQTLs.csv")
MI_Midwest_eQTLs <- read.csv("~/Dropbox/LowryLab/data/eQTL_output/MI_Midwest_all_eQTLs.csv")

# TX
TX_Atlantic_eQTLs <- read.csv("~/Dropbox/LowryLab/data/eQTL_output/TX_Atlantic_all_eQTLs.csv")
TX_Gulf_eQTLs <- read.csv("~/Dropbox/LowryLab/data/eQTL_output/TX_Gulf_all_eQTLs.csv")
TX_Midwest_eQTLs <- read.csv("~/Dropbox/LowryLab/data/eQTL_output/TX_Midwest_all_eQTLs.csv")

# GxE
GxE_Atlantic_eQTLs <- read.csv("~/Dropbox/LowryLab/data/eQTL_output/GxE_Atlantic_all_eQTLs.csv")
GxE_Gulf_eQTLs <- read.csv("~/Dropbox/LowryLab/data/eQTL_output/GxE_Gulf_all_eQTLs.csv")
GxE_Midwest_eQTLs <- read.csv("~/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_all_eQTLs.csv")


# for the plots to look good the Chroms need to be ordered 9 -> 1 
GxE_Midwest_eQTLs$genome_Chrom <- factor(GxE_Midwest_eQTLs$genome_Chrom,
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


GxE_Gulf_eQTLs$Chrom <- factor(GxE_Gulf_eQTLs$Chrom,
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

GxE_Atlantic_eQTLs$Chrom <- factor(GxE_Atlantic_eQTLs$Chrom,
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

MI_Midwest_eQTLs$Chrom <- factor(MI_Midwest_eQTLs$Chrom,
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

TX_Midwest_eQTLs$Chrom <- factor(TX_Midwest_eQTLs$Chrom,
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

MI_Gulf_eQTLs$Chrom <- factor(MI_Gulf_eQTLs$Chrom,
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

TX_Gulf_eQTLs$Chrom <- factor(TX_Gulf_eQTLs$Chrom,
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

MI_Atlantic_eQTLs$Chrom <- factor(MI_Atlantic_eQTLs$Chrom,
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

TX_Atlantic_eQTLs$Chrom <- factor(TX_Atlantic_eQTLs$Chrom,
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


ggplot(dplyr::filter(GxE_Midwest_eQTLs,
                     genome_Chrom != "scaffold_174",
                     genome_Chrom !="scaffold_19",
                     genome_Chrom != "scaffold_24",
                     FDR < 0.1),
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
  scale_color_viridis() +
  ylab("Genome Position (Mb)") +
  xlab("Gene Position (Mb)")  +
  ggtitle("GxE eQTLs, Midwest Only")


