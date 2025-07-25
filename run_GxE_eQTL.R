chrom1K = "~/Dropbox/lowryLab/data/Chr01K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom1K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_1K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_1K.txt",
  output_file_name.cis = "data/MI_Midwest_1K_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)




chrom1N = "~/Dropbox/lowryLab/data/Chr01N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom1N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_1N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_1N.txt",
  output_file_name.cis = "data/MI_Midwest_1N_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



chrom2K = "~/Dropbox/lowryLab/data/Chr02K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom2K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_2K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_2K.txt",
  output_file_name.cis = "data/MI_Midwest_2K_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



chrom2N = "~/Dropbox/lowryLab/data/Chr02N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom2N)

# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_2N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_2N.txt",
  output_file_name.cis = "data/MI_Midwest_2N_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)


chrom3K = "~/Dropbox/lowryLab/data/Chr03K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom3K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_3K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_3K.txt",
  output_file_name.cis = "data/MI_Midwest_3K_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)


chrom3N = "~/Dropbox/lowryLab/data/Chr03N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom3N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_3N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_3N.txt",
  output_file_name.cis = "data/MI_Midwest_3N_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)


chrom4K = "~/Dropbox/lowryLab/data/Chr04K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom4K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_4K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_4K.txt",
  output_file_name.cis = "data/MI_Midwest_4K_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



chrom4N = "~/Dropbox/lowryLab/data/Chr04N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom4N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_4N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_4N.txt",
  output_file_name.cis = "data/MI_Midwest_4N_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)




chrom5K = "~/Dropbox/lowryLab/data/Chr05K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom5K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_5K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_5K.txt",
  output_file_name.cis = "data/MI_Midwest_5K_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)






chrom5N = "~/Dropbox/lowryLab/data/Chr05N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom5N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_5N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_5N.txt",
  output_file_name.cis = "data/MI_Midwest_5N_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)





chrom6K = "~/Dropbox/lowryLab/data/Chr06K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom6K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_6K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_6K.txt",
  output_file_name.cis = "data/MI_Midwest_6K_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)






chrom6N = "~/Dropbox/lowryLab/data/Chr06N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom6N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_6N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_6N.txt",
  output_file_name.cis = "data/MI_Midwest_6N_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



chrom7K = "~/Dropbox/lowryLab/data/Chr07K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom7K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_7K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_7K.txt",
  output_file_name.cis = "data/MI_Midwest_7K_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)




chrom7N = "~/Dropbox/lowryLab/data/Chr07N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom7N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_7N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_7N.txt",
  output_file_name.cis = "data/MI_Midwest_7N_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)


chrom8K = "~/Dropbox/lowryLab/data/Chr08K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom8K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_8K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_8K.txt",
  output_file_name.cis = "data/MI_Midwest_8K_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)




chrom8N = "~/Dropbox/lowryLab/data/Chr08N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom8N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_8N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_8N.txt",
  output_file_name.cis = "data/MI_Midwest_8N_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)





chrom8K = "~/Dropbox/lowryLab/data/Chr08K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom8K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_8K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_8K.txt",
  output_file_name.cis = "data/MI_Midwest_8K_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)




chrom8N = "~/Dropbox/lowryLab/data/Chr08N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom8N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_8N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_8N.txt",
  output_file_name.cis = "data/MI_Midwest_8N_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)




chrom9K = "~/Dropbox/lowryLab/data/Chr09K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom9K)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_9K = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_9K.txt",
  output_file_name.cis = "data/MI_Midwest_9K_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)




chrom9N = "~/Dropbox/lowryLab/data/Chr09N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom9N)



# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_MI_Midwest_9N = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneMI_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/MI_Midwest_9N.txt",
  output_file_name.cis = "data/MI_Midwest_9N_cis.txt",
  pvOutputThreshold = 1e-8,
  pvOutputThreshold.cis = 1e-8,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)
