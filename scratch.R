library(viridis)
library(gridExtra)
library(dplyr)


datLab$Chrom <- factor(datLab$Chrom,
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