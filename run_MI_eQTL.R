chrom4K = "~/Dropbox/lowryLab/data/Chr04K_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom4K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_4K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_4K.txt",
  output_file_name.cis = "data/MI_4K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



chrom4N = "~/Dropbox/lowryLab/data/Chr04N_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom4N)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_4N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_4N.txt",
  output_file_name.cis = "data/MI_4N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)




chrom5K = "~/Dropbox/lowryLab/data/Chr05K_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom5K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_5K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_5K.txt",
  output_file_name.cis = "data/MI_5K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)


chrom5N = "~/Dropbox/lowryLab/data/Chr05N_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom5N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_5N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_5N.txt",
  output_file_name.cis = "data/MI_5N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



chrom6K = "~/Dropbox/lowryLab/data/Chr06K_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom6K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_6K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_6K.txt",
  output_file_name.cis = "data/MI_6K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)





chrom6N = "~/Dropbox/lowryLab/data/Chr06N_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom6N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_6N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_6N.txt",
  output_file_name.cis = "data/MI_6N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)
