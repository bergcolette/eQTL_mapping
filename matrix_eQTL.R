install.packages("MatrixEQTL")

library(MatrixEQTL)

base.dir = find.package("MatrixEQTL")

useModel = modelLINEAR; # modelANOVA or modelLINEAR or modelLINEAR_CROSS
SNP_file_name = paste(base.dir, "/data/SNP.txt", sep="");
expression_file_name = paste(base.dir, "/data/GE.txt", sep="");
covariates_file_name = paste(base.dir, "/data/Covariates.txt", sep="");
output_file_name = tempfile();
pvOutputThreshold = 1e-2;
errorCovariance = numeric();

snps = SlicedData$new();
snps$fileDelimiter = ",";       # denote missing values;
snps$fileSkipRows = 1;          # one row of column labels
snps$fileSkipColumns = 1;       # one column of row labels
snps$fileSliceSize = 2000;      # read file in pieces of 2,000 rows
snps$LoadFile("~/Dropbox/lowryLab/data/test_matrix_eQTL.csv");

gene = SlicedData$new()
gene$fileDelimiter = ",";    
gene$LoadFile("~/Dropbox/lowryLab/data/test_matrix_eQTL_genes.csv")

me = Matrix_eQTL_engine(
  snps = snps,
  gene = gene,
  output_file_name = output_file_name,
  pvOutputThreshold = pvOutputThreshold,
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = TRUE,
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = FALSE)

me$all$eqtls
