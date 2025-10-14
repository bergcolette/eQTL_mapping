
# eQTL_1K
me_GxE_Midwest_1K = Matrix_eQTL_main(
  snps = Midwest_allsnps_1K,
  gene = geneGxE_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  cvrt = cvrt_Midwest,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_1K.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_1K_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)


# eQTL_1N
me_GxE_Midwest_1N = Matrix_eQTL_main(
  snps = Midwest_allsnps_1N,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_1N.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_1N_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_2K
me_GxE_Midwest_2K = Matrix_eQTL_main(
  snps = Midwest_allsnps_2K,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_2K.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_2K_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_2N
me_GxE_Midwest_2N = Matrix_eQTL_main(
  snps = Midwest_allsnps_2N,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_2N.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_2N_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_3K
me_GxE_Midwest_3K = Matrix_eQTL_main(
  snps = Midwest_allsnps_3K,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_3K.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_3K_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_3N
me_GxE_Midwest_3N = Matrix_eQTL_main(
  snps = Midwest_allsnps_3N,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_3N.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_3N_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_4K
me_GxE_Midwest_4K = Matrix_eQTL_main(
  snps = Midwest_allsnps_4K,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_4K.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_4K_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_4N
me_GxE_Midwest_4N = Matrix_eQTL_main(
  snps = Midwest_allsnps_4N,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_4N.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_4N_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_5K
me_GxE_Midwest_5K = Matrix_eQTL_main(
  snps = Midwest_allsnps_5K,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_5K.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_5K_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_5N
me_GxE_Midwest_5N = Matrix_eQTL_main(
  snps = Midwest_allsnps_5N,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_5N.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_5N_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_6K
me_GxE_Midwest_6K = Matrix_eQTL_main(
  snps = Midwest_allsnps_6K,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_6K.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_6K_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_6N
me_GxE_Midwest_6N = Matrix_eQTL_main(
  snps = Midwest_allsnps_6N,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_6N.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_6N_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_7K
me_GxE_Midwest_7K = Matrix_eQTL_main(
  snps = Midwest_allsnps_7K,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_7K.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_7K_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_7N
me_GxE_Midwest_7N = Matrix_eQTL_main(
  snps = Midwest_allsnps_7N,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_7N.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_7N_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_8K
me_GxE_Midwest_8K = Matrix_eQTL_main(
  snps = Midwest_allsnps_8K,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_8K.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_8K_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_8N
me_GxE_Midwest_8N = Matrix_eQTL_main(
  snps = Midwest_allsnps_8N,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_8N.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_8N_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_9K
me_GxE_Midwest_9K = Matrix_eQTL_main(
  snps = Midwest_allsnps_9K,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_9K.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_9K_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)

# eQTL_9N
me_GxE_Midwest_9N = Matrix_eQTL_main(
  snps = Midwest_allsnps_9N,
  gene = geneGxE_Midwest,
  cvrt = cvrt_Midwest,
  snpspos = snpspos,
  genepos = genepos,
  cisDist = 1e6,
  output_file_name = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_9N.txt",
  output_file_name.cis = "/Users/coletteberg/Dropbox/LowryLab/data/eQTL_output/GxE_Midwest_9N_cis.txt",
  pvOutputThreshold = 1e-10,
  pvOutputThreshold.cis = 1e-2, 
  useModel = useModel,
  errorCovariance = errorCovariance,
  verbose = TRUE,
  pvalue.hist = "qqplot",
  min.pv.by.genesnp = TRUE,
  noFDRsaveMemory = FALSE)