# read in and format the count data 
counts <- read.csv("data/switchgrass_div_rawCounts_AP13.txt", sep = "\t")
counts_filt <- select(counts, -c("HYYUB", "NASNY", "HYYUC", "NASNZ"))
rownames(counts_filt) <- counts_filt$GeneID
counts_filt <- select(counts_filt, -GeneID)

# read in and format the colData

coldata <- read.csv("data/sample_names.csv")
rownames(coldata) <- coldata$X
coldata <- select(coldata, -X)

# making a DESeq object
dds <- DESeqDataSetFromMatrix(countData = counts_filt,
                              colData = coldata,
                              design = ~ Site)


# extract the matrix of normalized values

vsd <- vst(dds, blind = FALSE)

# write a csv of the read counts-normalized data
write.csv(as.data.frame(assay(vsd)), "data/switchgrass_readCounts_normalized.csv")


# make it a dataframe -- now going to split by habitat 
t_counts <- as.data.frame(t(as.data.frame(assay(vsd))))

# add back habitat and plant ID

merge <- cbind(coldata, t_counts)

# make one dataframe for Michigan reads
MI_normalized <- filter(merge, Site == "M")

# make one dataframe for Texas reads
TX_normalized <- filter(merge, Site == "P")

# write csvs of the normalized data
write.csv(MI_normalized, "data/MI_normalized.csv")
write.csv(TX_normalized, "data/TX_normalized.csv")


# actually run DESeq (to get log fold change)
# the DESeq command does it all at once (estimating size factors, normalizing, estimating disperson)

dds <- DESeq(dds)