# this is a scratch area for plotting 

ggplot(filter(mergeFilt,
              chr != "scaffold_19",
              chr != "scaffold_34"),
       aes(x = V3/1000000,
           y = s1/1000000,
           color=-log10(p.value),
           alpha = -log10(p.value))) +
  geom_point() +
  theme_bw() +
  scale_color_viridis() +
  facet_wrap(~chr,
             nrow = 9) +
  ylab("Gene Position (Mb)") +
  xlab("Chr 01K Position (Mb)") +
  theme(
    strip.background = element_blank(),
    strip.text.x = element_blank()
  )


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