# plot the result! `

ggplot(Gulf_TX_eQTLs_filt,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  scale_color_viridis() + 
  ggtitle("Gulf eQTLs, TX")

hist(summarize_Gulf_MI$n)

filter(summarize_Gulf_MI, n > 25)
summarize_Gulf_MI
IQR(summarize_Gulf_MI$n)

# now trying the same thing but with the other pop / habitat combos 
# Midwest TX 
ggplot(filter(Gulf_MI_eQTLs, FDR < 0.1),
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  scale_color_viridis() + 
  ggtitle("Gulf eQTLs, TX")

# first getting the list of genes and how many eQTLs they each have
summarize_Gulf_MI <- filter(Gulf_MI_eQTLs,
                                         FDR < 0.1) %>% 
  group_by(geneid) %>% 
  summarise(n = n())


# reading in normalized gene expresion for the pop 
norm_geneExp <- read.table("~/Dropbox/LowryLab/data/expression/genes_MI_Gulf.csv",
                           sep=",",
                           header = TRUE, 
                           row.names = 1)

# testing for normal distribution in all genes 
normality_test <- sapply(as.data.frame(t(norm_geneExp)), function(x) shapiro.test(x)$p.value)

norm <- as.data.frame(normality_test)
norm$geneid <- rownames(norm)

# merge the normality tests for each gene with the df that has # of QTLs for each gene 
transQTLs_norm <- merge(summarize_Gulf_MI, norm, id.vars=c("geneid"))

# calculating variances with the transposed raw dist 
row_variances <- apply(genes_MI_Gulf, MARGIN = 1, FUN = var, na.rm=TRUE)
genes_MI_Gulf$var <- row_variances 

# filter by variance 
varFilt <- filter(genes_MI_Gulf, var > 0)
vardat <- (dplyr::select(varFilt, var))
vardat$geneid <- rownames(varFilt)

# checking the relationship between raw data normality & ultimate # of QTLs 
normality_test_raw <- sapply(as.data.frame(t(varFilt)),
                             function(x) shapiro.test(x)$p.value)


normRaw <- as.data.frame(normality_test_raw)

normRaw$geneid <- rownames(normRaw)

# now merging the raw norm scores with the final norm scores and the final QTL count
transQTLs_norm_all <- merge(transQTLs_norm, normRaw,
                            id.vars=c("geneid"))

ggplot(as.data.frame(transQTLs_norm_all),
       aes(x = -log10(normality_test_raw),
             y = n)) + geom_point() + geom_abline() + ggtitle("Gulf_MI")




# plotting the eQTLs
ggplot(filter(normExp_Atlantic_MI_eQTLs, FDR < 0.1),
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = -log10(p.value))) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  scale_color_viridis() + 
  ggtitle("Atlantic eQTLs, filtered by normality MI")


# first getting the list of genes and how many eQTLs they each have
summarize_Atlantic_MI_normFilt <- filter(normExp_Atlantic_MI_eQTLs,
                                         FDR < 0.1) %>% 
  group_by(geneid) %>% 
  summarise(n = n())


# goal: check whether non-normality (even after quantile normalization) 
# is still correlated with a large # of QTLs 

# reading in normalized gene expresion for the pop 
norm_geneExp <- read.table("~/Dropbox/LowryLab/data/expression/genes_MI_Atlantic.csv",
                           sep=",",
                           header = TRUE, 
                           row.names = 1)

# testing for normal distribution in all genes 
normality_test <- sapply(as.data.frame(t(norm_geneExp)), function(x) shapiro.test(x)$p.value)

# merge the normality tests for each gene with the df that has # of QTLs for each gene 
transQTLs_norm <- merge(summarize_Atlantic_MI, norm, id.vars=c("geneid"))

# split by normal / abnormal 
normies <- filter(transQTLs_norm, normality_test > 0.05)
abnormies <- filter(transQTLs_norm, normality_test <= 0.05)

# label
abnormies$dist <- "not normal"
normies$dist <- "normal"

# add back together
formatted <- rbind(normies, abnormies)

# plot relationship between normal-ness and number of QTLs 
ggplot(formatted, aes(y = n,
                      x = dist)) +
  geom_boxplot() 

# linear regression of normal-ness and number of eQTLs 
summary(lm(n~normality_test, transQTLs_norm))


# calculating variances with the transposed raw dist 
row_variances <- apply(genes_MI_Atlantic, MARGIN = 1, FUN = var, na.rm=TRUE)

genes_MI_Atlantic$var <- row_variances 

# filter by variance 
varFilt <- filter(genes_MI_Atlantic, var > 0)
vardat <- (dplyr::select(varFilt, var))
vardat$geneid <- rownames(varFilt)

# checking the transformed distribution 
hist(as.data.frame(t(norm_geneExp))$Pavir.1KG278700)

# checking the relationship between raw data normality & ultimate # of QTLs 
normality_test_raw <- sapply(as.data.frame(t(varFilt)),
                             function(x) shapiro.test(x)$p.value)

# now merging the raw norm scores with the final norm scores and the final QTL count

transQTLs_norm_all <- merge(transQTLs_norm, normRaw, id.vars=c("geneid"))

transQTLs_norm_all <- merge(transQTLs_norm_all, vardat, id.vars=c("geneid"))

normRaw <- as.data.frame(t(as.data.frame(normality_test_raw)))

normRaw$geneid <- rownames(normRaw)

ggplot(transQTLs_norm_all,
       aes(x = var,
           y = n)) + geom_point() + geom_abline() +
  xlim(0, 400000)

hist(transQTLs_norm_all$var)

summary(lm(-log10(V1) ~ n, transQTLs_norm_all))

# filtering the eQTLs to JUST those with a truly normal distribution 
normExp_Atlantic_MI_eQTLs <- 
  filter(Atlantic_MI_eQTLs,
         gene %in% normies$geneid)

# now exploring the relationship between population structure and # of QTLs (it has to be SOMETHING, right?)
Atlantic_eigen <- read.csv("/Users/coletteberg/Dropbox/LowryLab/data/genotypes/Atlantic_allChroms.eigenvec", sep="\t")

# labeling by population cluster within Atlantic
Atlantic_eigen_topLeft <- filter(Atlantic_eigen, PC1 < -0.05, PC2 > 0.05)
Atlantic_eigen_topLeft$pop <- "topLeft"

Atlantic_eigen_right <- filter(Atlantic_eigen, PC1 > 0.025, PC2 > -0.05)
Atlantic_eigen_right$pop <- "right"

Atlantic_eigen_middle <- filter(Atlantic_eigen, PC1 < 0.025, PC2 < 0.05)
Atlantic_eigen_middle$pop <- "middle"

# adding together the labels 
Atlantic_labeled <- rbind(Atlantic_eigen_topLeft,
                          Atlantic_eigen_right,
                          Atlantic_eigen_middle)


# checking whether the weirdo genes are associated with population structure

# column-binding PC files to the normalized gene expression files 
eigen_plus_expression <- cbind(Atlantic_labeled, as.data.frame((t(norm_geneExp))))

# exploring the eigenvalues of the kinship matrices for each population 
ggplot(Atlantic_eigen, aes(x = PC1, y = PC2)) +
  geom_point()

ggplot(Gulf_eigen, aes(x = PC1, y = PC2)) +
  geom_point()

ggplot(Midwest_eigen, aes(x = PC1, y = PC2)) +
  geom_point()

ggplot(Atlantic_labeled, 
       aes(x = PC1, y = PC2, col = pop)) +
  geom_point()

