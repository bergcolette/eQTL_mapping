library(ggplot2)
library(reshape2)
library(dplyr)
library(tidyverse)
library(pwr)

# read in the processed ASE counts

ASE_dat <- read.csv("~/Dropbox/LowryLab/data/ASE/pvirgatums.processed_ASC.csv")

# make dataframe long to process

ASE_long <- reshape2::melt(ASE_dat)

# split by ID# and genome 
df_split <- ASE_long %>%
  separate_wider_delim(
    cols = variable, # The column to split
    delim = "_",       # The delimiter
    names = c("ID", "allele") # Names for the new columns
  )

# now process to get the DAC / AP13 alleles next to each other for each gene / ID combo
# split and rename

#AP13
AP13_alleles <- filter(df_split, allele == "AP13")
AP13_alleles <- dplyr::rename(AP13_alleles, AP13_allele = value)

# DAC6
DAC6_alleles <- filter(df_split, allele == "DAC6")
DAC6_alleles <- dplyr::rename(DAC6_alleles, DAC6_allele = value)

# put 'em together
formatted_indvs <- cbind(dplyr::select(as.data.frame(AP13_alleles), repID, ID, AP13_allele), dplyr::select(as.data.frame(DAC6_alleles), DAC6_allele))

# filter to F1's only
F1_ASE <- (filter(formatted_indvs, ID=="BUWAP" |
                         ID=="BUWBO" |
                          ID=="BUWBZ" |
                              ID=="BUWCP" |
                              ID=="BUWCS" |
                              ID=="BUWCT" |
                              ID=="BUWBG" |
                             ID=="BUWBU" |
                              ID=="BUWBW" |
                              ID=="BUWHW" |
                              ID=="BUWHY" |
                              ID=="BUWNX" |
                              ID=="BUWCY" |
                              ID=="BUWGO" |
                              ID=="BUWHS" |
                              ID=="BUWHZ" |
                              ID=="BUWNA" |
                              ID=="BUWNP"))


# next step is to only look at genes that contain FIXED SNPs between AP13 and DAC6 
# that was done on the cluster -- now time to read in that file 

snp_overlap <- read.csv("~/Dropbox/LowryLab/data/ASE/SNP_overlap.txt", sep="\t", header=FALSE)

# do a little cleanup of the gene names before we use them
snp_overlap$V14 <- gsub(".v6.1", "", snp_overlap$V14)

# from here, get list of genes that overlap with at least one SNP
genes_with_SNPs <- as.data.frame(unique(snp_overlap$V14))

# more formatting / filtering of the ASE files before filtering to SNP genes
F1_ASE <- mutate(F1_ASE, total=AP13_allele + DAC6_allele)

# filter to where there enough total reads to conduct a statistical test 
F1_ASE_filt <- filter(F1_ASE, total > 30)

# filter to only genes that contain SNPs 
filtered_genes <- filter(F1_ASE_filt, repID %in% genes_with_SNPs$`unique(snp_overlap$V14)`)


# filter to only genes that are 1:1 orthologs between AP13 & DAC6 
# read in the list of orthologs 
orthos <- read.csv("~/Dropbox/LowryLab/data/ASE/AP13H1_DAC6H1_singleCopy.Orthologs.txt", sep = " ", header = FALSE)

# clean up the orthos gene name 
orthos$V1 <- gsub(".v6.1", "", orthos$V1)

# only keep the 1:1 orthos 
genes_1_1 <- filter(filtered_genes, repID %in% orthos$V1)



# filter out the excessively expressed genes 
depth_filt <- filter(genes_1_1, total < 2500)



# read in the bed file to get the gene location
AP13_bed <- read.csv("~/Dropbox/LowryLab/data/AP13/AP13.bed", sep = "\t", header = FALSE)


# clean up the gene names 
AP13_bed$V4 <- gsub(".v6.1", "", AP13_bed$V4)

# join the bed file to the ASE file to get the start / end position of each gene 
# clean up the column names
AP13_bed <- dplyr::rename(AP13_bed, repID = V4)

# join them based on gene name
ASE_genePos <- inner_join(depth_filt, AP13_bed, by = "repID")


# clean up file names 
ASE_genePos <- dplyr::rename(ASE_genePos, Chrom = V1)
ASE_genePos <- dplyr::rename(ASE_genePos, start_bp = V2)
ASE_genePos <- dplyr::rename(ASE_genePos, end_bp = V3)

# split by habitat
KBSM_F1s <- filter(ASE_genePos, ID == "BUWBG" |
                     ID == "BUWBU" |
                     ID == "BUWBW" |
                     ID == "BUWHW" |
                     ID == "BUWHY" |
                     ID == "BUWNX")


# now look at the mean allelic ratio across all samples
add_AP13_allele <- dplyr::select(KBSM_F1s, repID, ID, AP13_allele, Chrom, start_bp)
AP13_allele_wider <- pivot_wider(add_AP13_allele, names_from=ID, values_from=AP13_allele)
AP13_allele_widerNA <- AP13_allele_wider  %>% mutate(na_count = rowSums(across(everything(), is.na)))
allele_filt <- filter(AP13_allele_widerNA, na_count < 3)
allele_filt <- mutate(allele_filt, alleleSum = rowSums(pick(BUWBG, BUWBW, BUWHW, BUWHY, BUWNX), na.rm = TRUE))

add_total  <- dplyr::select(KBSM_F1s, repID, ID, total, Chrom, start_bp)
total_wider <- pivot_wider(add_total, names_from=ID, values_from=total)
total_widerNA <- total_wider  %>% mutate(na_count = rowSums(across(everything(), is.na)))
total_filt <- filter(total_widerNA, na_count < 3)
total_filt <- mutate(total_filt, totalSum = rowSums(pick(BUWBG, BUWBW, BUWHW, BUWHY, BUWNX), na.rm = TRUE))

# now add the total to the allele filt df
allele_filt$total <- total_filt$totalSum

# conduct a binomial test 
test_all_KBSM <- allele_filt  %>%
 rowwise() %>%
  mutate(p_value = binom.test(alleleSum, total, p = 0.5)$p.value) %>%
  ungroup()

# same thing for PKLE
# split by habitat
PKLE_F1s <- filter(ASE_genePos, ID == "BUWCY" |
                     ID == "BUWGO" |
                     ID == "BUWHS" |
                     ID == "BUWHZ" |
                     ID == "BUWNA" |
                     ID == "BUWNP")

# now look at the mean allelic ratio across all samples
add_AP13_allele <- dplyr::select(PKLE_F1s, repID, ID, AP13_allele, Chrom, start_bp)
AP13_allele_wider <- pivot_wider(add_AP13_allele, names_from=ID, values_from=AP13_allele)
AP13_allele_widerNA <- AP13_allele_wider  %>% mutate(na_count = rowSums(across(everything(), is.na)))
allele_filt <- filter(AP13_allele_widerNA, na_count < 3)
allele_filt <- mutate(allele_filt, alleleSum = rowSums(pick(BUWCY, BUWGO, BUWHS, BUWHZ, BUWNA, BUWNP), na.rm = TRUE))


add_total  <- dplyr::select(PKLE_F1s, repID, ID, total, Chrom, start_bp)
total_wider <- pivot_wider(add_total, names_from=ID, values_from=total)
total_widerNA <- total_wider  %>% mutate(na_count = rowSums(across(everything(), is.na)))
total_filt <- filter(total_widerNA, na_count < 3)
total_filt <- mutate(total_filt, totalSum = rowSums(pick(BUWCY, BUWGO, BUWHS, BUWHZ, BUWNA, BUWNP), na.rm = TRUE))

# now add the total to the allele filt df
allele_filt$total <- total_filt$totalSum

# conduct a binomial test 
test_all_PKLE <- allele_filt  %>%
  rowwise() %>%
  mutate(p_value = binom.test(alleleSum, total, p = 0.5)$p.value) %>%
  ungroup()


# process before joining
PKLE <- dplyr::select(test_all_PKLE, repID, alleleSum, total)
PKLE$site <- "PKLE"
PKLE <- rename(PKLE,  alleleSum_PKLE = alleleSum)
PKLE <- rename(PKLE,  total_PKLE = total)
PKLE$ratio_PKLE <- PKLE$alleleSum_PKLE / PKLE$total_PKLE

KBSM <- dplyr::select(test_all_KBSM, repID, alleleSum, total)
KBSM$site <- "KBSM"
KBSM <- rename(KBSM,  alleleSum_KBSM = alleleSum)
KBSM <- rename(KBSM,  total_KBSM = total)
KBSM$ratio_KBSM <- KBSM$alleleSum_KBSM / KBSM$total_KBSM

bothAlleles <- inner_join(dplyr::select(KBSM, repID, alleleSum_KBSM, total_KBSM, ratio_KBSM),
           dplyr::select(PKLE, repID, alleleSum_PKLE, total_PKLE, ratio_PKLE))

# add test results to bothAlleles file 
test_both <- bothAlleles  %>%
  rowwise() %>%
  mutate(p_value_KBSM = binom.test(alleleSum_KBSM, total_KBSM, p = 0.5)$p.value) %>%
  ungroup()

test_both <- test_both  %>%
  rowwise() %>%
  mutate(p_value_PKLE = binom.test(alleleSum_PKLE, total_PKLE, p = 0.5)$p.value) %>%
  ungroup()

# label by direction
test_both$PKLE_dir <- test_both$ratio_PKLE > 0.5
test_both$KBSM_dir <- test_both$ratio_KBSM > 0.5


test_both$sameDir <- test_both$PKLE_dir == test_both$KBSM_dir

both_sig_same <- filter(test_both, p_value_PKLE < 2.2e-6 & p_value_KBSM < 2.2e-6 & sameDir == "TRUE")
both_sig_same$sig <- "both_same"


both_sig_diff <- filter(test_both, p_value_PKLE < 2.2e-6 & p_value_KBSM < 2.2e-6 & sameDir == "FALSE")
both_sig_diff$sig <- "both_diff"

PK_sig_only <- filter(test_both, p_value_PKLE < 2.2e-6 & p_value_KBSM > 2.2e-6)
PK_sig_only$sig <- "PKLE"

KB_sig_only <- filter(test_both, p_value_KBSM < 2.2e-6 & p_value_PKLE > 2.2e-6)
KB_sig_only$sig <- "KBSM"

notSig <- filter(test_both, p_value_KBSM > 2.2e-6 & p_value_PKLE > 2.2e-6)
notSig$sig <- "no"

datLabeled <- rbind(both_sig_same,
                    both_sig_diff,
      PK_sig_only,
      KB_sig_only,
      notSig)


# nice and shiny ASE figure
ggplot(filter(datLabeled,
              sig != "no"),
       aes(x = ratio_PKLE,
           y = ratio_KBSM,
           col = sig)) +
  geom_point() +
  theme_bw() +
  #scale_color_manual(values = c("black",
   #                              "black",
    #                             "dodgerblue",
     #                            "red")) +
  theme(legend.position = "none",
        axis.title = element_text(size = 18),
        axis.text = element_text(size = 14)) +
  geom_vline(xintercept = 0.5,
             linetype = "dashed") +
  geom_hline(yintercept = 0.5,
             linetype = "dashed") +
  ylab("Allelic Ratio, MI") +
  xlab("Allelic Ratio, TX") +
  ggtitle("Allele Specific Expression in AP13 x DAC6 F1's")

# count up to report the ASE 
KBSM_ASE <- filter(datLabeled, p_value_KBSM < 2.2e-6)
PKLE_ASE <- filter(datLabeled, p_value_KBSM < 2.2e-6)

# now compare with the eQTL 
Midwest_KBSM <- unique(filter(Midwest_presence_labeled, presence != "TX_only", type == "cis"))
Midwest_PKLE <- unique(filter(Midwest_presence_labeled, presence != "MI_only", type == "cis"))
Gulf_KBSM <- unique(filter(Gulf_presence_labeled, presence != "TX_only", type == "cis"))
Gulf_PKLE <- unique(filter(Gulf_presence_labeled, presence != "MI_only", type == "cis"))
Atlantic_KBSM <- unique(filter(Atlantic_presence_labeled, presence != "TX_only", type == "cis"))
Atlantic_PKLE <- unique(filter(Atlantic_presence_labeled, presence != "MI_only", type == "cis"))

# now get the overlap for all three pops, KBSM
Mid_KBSM_overlap <- length(intersect(Midwest_KBSM$gene, KBSM_ASE$repID))
Gulf_KBSM_overlap <- length(intersect(Gulf_KBSM$gene, KBSM_ASE$repID))
Atlantic_KBSM_overlap <- length(intersect(Atlantic_KBSM$gene, KBSM_ASE$repID))

# overlap for all three pops, PKLE 
Mid_PKLE_overlap <- length(intersect(Midwest_PKLE$gene, PKLE_ASE$repID))
Gulf_PKLE_overlap <- length(intersect(Gulf_PKLE$gene, PKLE_ASE$repID))
Atlantic_PKLE_overlap <- length(intersect(Atlantic_PKLE$gene, PKLE_ASE$repID))


total_genes <- 38000
ASE_cisgenes_KBSM <- length(KBSM_ASE$repID)
ASE_cisgenes_PKLE <- length(PKLE_ASE$repID)

write.csv(PKLE_ASE, "~/Desktop/bergetal_2026/ASE_cisReg_TX.csv")
write.csv(KBSM_ASE, "~/Desktop/bergetal_2026/ASE_cisReg_MI.csv")

#hyper tests 
#Midwest, KBSM 
phyper(q = Mid_KBSM_overlap,     
  m = ASE_cisgenes_KBSM,          
  n = total_genes - ASE_cisgenes,
  k = total_genes            
)
# Gulf, KBSM
phyper(q = Gulf_KBSM_overlap - 1,     
       m = length(Gulf_KBSM$gene),          
       n = total_genes - length(Gulf_KBSM$gene),
       k = length(Gulf_KBSM$gene),
       lower.tail = FALSE
)

length(Gulf_KBSM$gene)
# Atlantic, KBSM
phyper(q = Atlantic_KBSM_overlap-1,     
       m = ASE_cisgenes_KBSM,          
       n = total_genes - ASE_cisgenes_KBSM,
       k = length(Atlantic_KBSM$gene),
       lower.tail = FALSE
)

#Midwest, PKLE 
phyper(q = Mid_PKLE_overlap,     
       m = ASE_cisgenes_PKLE,          
       n = total_genes - ASE_cisgenes,
       k = length(Midwest_PKLE$gene),
       lower.tail = FALSE
)

# Gulf, PKLE
phyper(q = Gulf_PKLE_overlap,     
       m = ASE_cisgenes_PKLE,          
       n = total_genes - ASE_cisgenes_PKLE,
       k = length(Gulf_PKLE$gene),
       lower.tail = FALSE
)
# Atlantic, PKLE
phyper(q = Atlantic_PKLE_overlap,     
       m = ASE_cisgenes_PKLE,          
       n = total_genes - ASE_cisgenes_PKLE,
       k = length(Atlantic_PKLE$gene),
       lower.tail = FALSE
)



#Population (N): The total number of items or individuals in the entire group.
#Successes in Population (K): The total number of items in the population that have a specific feature.
#Sample Size (n): The number of items chosen from the population.
#Successes in Sample (k): The number of observed successful items within the chosen sample. 