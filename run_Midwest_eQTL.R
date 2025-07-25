# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom1K = "~/Dropbox/lowryLab/data/Chr01K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom1K)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_1K.txt",
  output_file_name.cis = "data/GxE_Midwest_1K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)


# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom1N = "~/Dropbox/lowryLab/data/Chr01N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom1N)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_1N.txt",
  output_file_name.cis = "data/GxE_Midwest_1N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)

# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom2K = "~/Dropbox/lowryLab/data/Chr02K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom2K)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_2K.txt",
  output_file_name.cis = "data/GxE_Midwest_2K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)


# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom2N = "~/Dropbox/lowryLab/data/Chr02N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom2N)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_2N.txt",
  output_file_name.cis = "data/GxE_Midwest_2N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)


# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom3K = "~/Dropbox/lowryLab/data/Chr03K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom3K)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_3K.txt",
  output_file_name.cis = "data/GxE_Midwest_3K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom3N = "~/Dropbox/lowryLab/data/Chr03N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom3N)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_3N.txt",
  output_file_name.cis = "data/GxE_Midwest_3N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom4K = "~/Dropbox/lowryLab/data/Chr04K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom4K)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_4K.txt",
  output_file_name.cis = "data/GxE_Midwest_4K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom4N = "~/Dropbox/lowryLab/data/Chr04N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom4N)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_4N.txt",
  output_file_name.cis = "data/GxE_Midwest_4N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom5K = "~/Dropbox/lowryLab/data/Chr05K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom5K)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_5K.txt",
  output_file_name.cis = "data/GxE_Midwest_5K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom5N = "~/Dropbox/lowryLab/data/Chr05N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom5N)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_5N.txt",
  output_file_name.cis = "data/GxE_Midwest_5N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom6K = "~/Dropbox/lowryLab/data/Chr06K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom6K)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_6K.txt",
  output_file_name.cis = "data/GxE_Midwest_6K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom6N = "~/Dropbox/lowryLab/data/Chr06N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom6N)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_6N.txt",
  output_file_name.cis = "data/GxE_Midwest_6N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom7K = "~/Dropbox/lowryLab/data/Chr07K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom7K)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_7K.txt",
  output_file_name.cis = "data/GxE_Midwest_7K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom7N = "~/Dropbox/lowryLab/data/Chr07N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom7N)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_7N.txt",
  output_file_name.cis = "data/GxE_Midwest_7N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom8K = "~/Dropbox/lowryLab/data/Chr08K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom8K)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_8K.txt",
  output_file_name.cis = "data/GxE_Midwest_8K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)




# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom8N = "~/Dropbox/lowryLab/data/Chr08N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom8N)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_8N.txt",
  output_file_name.cis = "data/GxE_Midwest_8N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)




# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom9K = "~/Dropbox/lowryLab/data/Chr09K_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom9K)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_9K.txt",
  output_file_name.cis = "data/GxE_Midwest_9K_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)



# setting genotype matrices 
# these were generated in awk on the MSU HPCC, from vcfs 
chrom9N = "~/Dropbox/lowryLab/data/Chr09N_Midwest_genotype_matrix.txt"

# loading genotype data 
allsnps = SlicedData$new();
allsnps$fileDelimiter = "\t";       # denote missing values;
allsnps$fileSkipColumns = 1;          # one column of row labels
allsnps$fileSliceSize = 10000;      # read file in pieces of 2,000 rows
allsnps$LoadFile(chrom9N)


# run the matrix eQTL function, scanning for cis and trans eQTLs 
me_GxE_Midwest = Matrix_eQTL_main(
  snps = allsnps,
  gene = geneGxE_Midwest,
  cvrt = cvrt,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "data/GxE_Midwest_9N.txt",
  output_file_name.cis = "data/GxE_Midwest_9N_cis.txt",
  pvOutputThreshold = pvOutputThreshold,
  pvOutputThreshold.cis = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = TRUE)