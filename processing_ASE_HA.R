library(ggplot2)
library(reshape2)
library(dplyr)

# read in the processed ASE counts

ASE_dat <- read.csv("~/Dropbox/LowryLab/pvirgatums.processed_ASC.csv")

# make dataframe long to process
ASE_long <- melt(ASE_dat)

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
AP13_alleles <- rename(AP13_alleles, AP13_allele = value)

# DAC6
DAC6_alleles <- filter(df_split, allele == "DAC6")
DAC6_alleles <- rename(DAC6_alleles, DAC6_allele = value)

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

snp_overlap <- read.csv("~/Dropbox/LowryLab/SNP_overlap.txt", sep="\t", header=FALSE)

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
orthos <- read.csv("~/Dropbox/LowryLab/AP13H1_DAC6H1_singleCopy.Orthologs.txt", sep = " ", header = FALSE)

# clean up the orthos gene name 
orthos$V1 <- gsub(".v6.1", "", orthos$V1)

# only keep the 1:1 orthos 
genes_1_1 <- filter(filtered_genes, repID %in% orthos$V1)

# filter out the excessively expressed genes 
depth_filt <- filter(genes_1_1, total < 2500)

# conduct a binomial test 
test_all <- depth_filt  %>%
  rowwise() %>%
  mutate(p_value = binom.test(AP13_allele, total, p = 0.5)$p.value) %>%
  ungroup()

# read in the bed file to get the gene location
AP13_bed <- read.csv("~/Dropbox/LowryLab/AP13.bed", sep = "\t", header = FALSE)

# clean up the gene names 
AP13_bed$V4 <- gsub(".v6.1", "", AP13_bed$V4)

# join the bed file to the ASE file to get the start / end position of each gene 
# clean up the column names
AP13_bed <- rename(AP13_bed, repID = V4)

# join them based on gene name
ASE_genePos <- inner_join(test_all, AP13_bed, by = "repID")

# clean up file names 
ASE_genePos  <- rename(ASE_genePos, Chrom = V1)
ASE_genePos  <- rename(ASE_genePos, start_bp = V2)
ASE_genePos  <- rename(ASE_genePos, end_bp = V3)

ggplot(filter(ASE_genePos, ID == "BUWAP",
              -log10(p_value) > 7),
       aes(y = start_bp, x = Chrom)) + 
  geom_point()

# filter to just the F1's 
ASE_F1s <- filter(ASE_genePos, ID=="BUWAP" |
         ID=="BUWBG" |
         ID=="BUWBO" |
         ID=="BUWBU" |
         ID=="BUWBW" |
         ID=="BUWBZ" |
         ID=="BUWCP" |
         ID=="BUWCS" |
         ID=="BUWCT" |
         ID=="BUWCY" |
         ID=="BUWGO" |
         ID=="BUWHS" |
         ID=="BUWHW" |
         ID=="BUWHY" |
         ID=="BUWHZ" |
         ID=="BUWNA" |
         ID=="BUWNP" |
         ID=="BUWNX")

# add the direction 
ASE_F1s_dir <- mutate(ASE_F1s, bias = AP13_allele > DAC6_allele)
ASE_F1s_dir <- mutate(ASE_F1s_dir, sig = p_value < 0.05)

# split by habitat
KBSM_F1s <- filter(ASE_F1s_dir, ID == "BUWBG" |
                     ID == "BUWBU" |
                     ID == "BUWBW" |
                     ID == "BUWHW" |
                     ID == "BUWHY" |
                     ID == "BUWNX")

# now look  @direction of bias 
bias_dat <- dplyr::select(KBSM_F1s, repID, ID, bias, Chrom, start_bp)
bias_dat_wider <- pivot_wider(bias_dat, names_from=ID, values_from=bias)

# sum up the direction and only keep genes where they're all in the same direction 
# do the same thing but with p-value and only keep genes where they all have the same p-value

# count the number "TRUE" 
bias_dat_wider$falseCount <- rowSums(bias_dat_wider == "FALSE", na.rm = TRUE)
bias_dat_wider$trueCount <- rowSums(bias_dat_wider == "TRUE", na.rm = TRUE)

AP13_bias <- filter(bias_dat_wider, trueCount == 6)
DAC6_bias <- filter(bias_dat_wider, falseCount == 6)

# now filter by significance
sig_dat <- dplyr::select(KBSM_F1s, repID, ID, p_value, Chrom, start_bp)
sig_dat <- filter(sig_dat, p_value < 0.05)

# make wider
sig_dat_wider <- pivot_wider(sig_dat, names_from=ID, values_from=p_value)

# filter to only genes where all 5 have significant bias 
sig_filt <- na.omit(sig_dat_wider)


# join together AP13 / DAC6 bias genes with significant genes 
AP13_bias_ASEgenes <- inner_join(as.data.frame(dplyr::select(AP13_bias, repID)), as.data.frame(sig_filt))
AP13_bias_ASEgenes$bias <- "AP13"

DAC6_bias_ASEgenes <- inner_join(as.data.frame(dplyr::select(DAC6_bias, repID)), as.data.frame(sig_filt))
DAC6_bias_ASEgenes$bias <- "DAC6"

KBSM_ASE_processed <- rbind(AP13_bias_ASEgenes,
      DAC6_bias_ASEgenes)


write.csv(KBSM_ASE_processed, "~/Dropbox/LowryLab/data/KBSM_ASE_genes.csv")

# same thing for CLMB
# split by habitat
CLMB_F1s <- filter(ASE_F1s_dir, ID == "BUWAP" |
                     ID == "BUWBO" |
                     ID == "BUWBZ" |
                     ID == "BUWCP" |
                     ID == "BUWCS" |
                     ID == "BUWCT")

# now look  @direction of bias 
bias_dat <- dplyr::select(CLMB_F1s, repID, ID, bias, Chrom, start_bp)
bias_dat_wider <- pivot_wider(bias_dat, names_from=ID, values_from=bias)

# sum up the direction and only keep genes where they're all in the same direction 
# do the same thing but with p-value and only keep genes where they all have the same p-value

# count the number "TRUE" 
bias_dat_wider$falseCount <- rowSums(bias_dat_wider == "FALSE", na.rm = TRUE)
bias_dat_wider$trueCount <- rowSums(bias_dat_wider == "TRUE", na.rm = TRUE)

AP13_bias <- filter(bias_dat_wider, trueCount == 6)
DAC6_bias <- filter(bias_dat_wider, falseCount == 6)

# now filter by significance
sig_dat <- dplyr::select(KBSM_F1s, repID, ID, p_value, Chrom, start_bp)
sig_dat <- filter(sig_dat, p_value < 0.05)

# make wider
sig_dat_wider <- pivot_wider(sig_dat, names_from=ID, values_from=p_value)

# filter to only genes where all 5 have significant bias 
sig_filt <- na.omit(sig_dat_wider)


# join together AP13 / DAC6 bias genes with significant genes 
AP13_bias_ASEgenes <- inner_join(as.data.frame(dplyr::select(AP13_bias, repID)), as.data.frame(sig_filt))
AP13_bias_ASEgenes$bias <- "AP13"

DAC6_bias_ASEgenes <- inner_join(as.data.frame(dplyr::select(DAC6_bias, repID)), as.data.frame(sig_filt))
DAC6_bias_ASEgenes$bias <- "DAC6"

CLMB_ASE_processed <- rbind(AP13_bias_ASEgenes,
                       DAC6_bias_ASEgenes)

write.csv(CLMB_ASE_processed, "~/Dropbox/LowryLab/data/CLMB_ASE_genes.csv")




# same thing for PKLE
# split by habitat
PKLE_F1s <- filter(ASE_F1s_dir, ID == "BUWCY" |
                     ID == "BUWGO" |
                     ID == "BUWHS" |
                     ID == "BUWHZ" |
                     ID == "BUWNA" |
                     ID == "BUWNP")

# now look  @direction of bias 
bias_dat <- dplyr::select(PKLE_F1s, repID, ID, bias, Chrom, start_bp)
bias_dat_wider <- pivot_wider(bias_dat, names_from=ID, values_from=bias)

# sum up the direction and only keep genes where they're all in the same direction 
# do the same thing but with p-value and only keep genes where they all have the same p-value

# count the number "TRUE" 
bias_dat_wider$falseCount <- rowSums(bias_dat_wider == "FALSE", na.rm = TRUE)
bias_dat_wider$trueCount <- rowSums(bias_dat_wider == "TRUE", na.rm = TRUE)

AP13_bias <- filter(bias_dat_wider, trueCount == 6)
DAC6_bias <- filter(bias_dat_wider, falseCount == 6)

# now filter by significance
sig_dat <- dplyr::select(KBSM_F1s, repID, ID, p_value, Chrom, start_bp)
sig_dat <- filter(sig_dat, p_value < 0.05)

# make wider
sig_dat_wider <- pivot_wider(sig_dat, names_from=ID, values_from=p_value)

# filter to only genes where all 5 have significant bias 
sig_filt <- na.omit(sig_dat_wider)


# join together AP13 / DAC6 bias genes with significant genes 
AP13_bias_ASEgenes <- inner_join(as.data.frame(dplyr::select(AP13_bias, repID)), as.data.frame(sig_filt))
AP13_bias_ASEgenes$bias <- "AP13"

DAC6_bias_ASEgenes <- inner_join(as.data.frame(dplyr::select(DAC6_bias, repID)), as.data.frame(sig_filt))
DAC6_bias_ASEgenes$bias <- "DAC6"

# make joined df
PKLE_ASE_processed <- rbind(AP13_bias_ASEgenes,
                       DAC6_bias_ASEgenes)

write.csv(PKLE_ASE_processed, "~/Dropbox/LowryLab/data/PKLE_ASE_genes.csv")

# now compare the PKLE / KBSM 
PKLE_simple <- dplyr::select(PKLE_ASE_processed, Chrom, start_bp, repID, bias)
KBSM_simple <- dplyr::select(KBSM_ASE_processed, Chrom, start_bp, repID, bias)

nrow(KBSM_simple)
nrow(PKLE_simple)
\
KBSM_simple

nrow(intersect(PKLE_simple, KBSM_simple))
nrow(filter(intersect(PKLE_simple, KBSM_simple), bias=="AP13"))

4285/8196

nrow(filter(setdiff(PKLE_simple, KBSM_simple), bias == "AP13"))

nrow(filter(setdiff(KBSM_simple, PKLE_simple), bias == "AP13"))
nrow(KBSM_simple)
nrow(PKLE_simple)
# there are only 22 genes that are distinct in the two habitats in terms of their ASE 
# ASE is very stable 
