
library(dplyr)
library(ggplot2)
library(stringr)
library(reshape2)

# read in orthogroups output
Orthogroups <- read.csv("/Users/coletteberg/Dropbox/LowryLab/Orthogroups.tsv",
                        sep="\t")
# filter
View(filter(Orthogroups, 
       AP13_K_subgenome != "",
       AP13_N_subgenome != ""))

# starting with the 1:1 orthologues because the many to many / many to one are too messy 
one_ones <- as.data.frame(filter(Orthogroups, AP13_K_subgenome != "",
       AP13_N_subgenome != "")[5280:24244,])

# cleaning up the gene names
# K subgenome column
one_ones$AP13_K_subgenome <- gsub(".1.p", "", one_ones$AP13_K_subgenome)
one_ones$AP13_K_subgenome <- gsub(".2.p", "", one_ones$AP13_K_subgenome)
one_ones$AP13_K_subgenome <- gsub(".3.p", "", one_ones$AP13_K_subgenome)
one_ones$AP13_K_subgenome <- gsub(".4.p", "", one_ones$AP13_K_subgenome)
one_ones$AP13_K_subgenome <- gsub(".5.p", "", one_ones$AP13_K_subgenome)
one_ones$AP13_K_subgenome <- gsub(".6.p", "", one_ones$AP13_K_subgenome)
one_ones$AP13_K_subgenome <- gsub(".7.p", "", one_ones$AP13_K_subgenome)
one_ones$AP13_K_subgenome <- gsub(".8.p", "", one_ones$AP13_K_subgenome)
one_ones$AP13_K_subgenome <- gsub(".9.p", "", one_ones$AP13_K_subgenome)
one_ones$AP13_K_subgenome <- gsub(".10.p", "", one_ones$AP13_K_subgenome)

# N subgenome column
one_ones$AP13_N_subgenome <- gsub(".1.p", "", one_ones$AP13_N_subgenome)
one_ones$AP13_N_subgenome <- gsub(".2.p", "", one_ones$AP13_N_subgenome)
one_ones$AP13_N_subgenome <- gsub(".3.p", "", one_ones$AP13_N_subgenome)
one_ones$AP13_N_subgenome <- gsub(".4.p", "", one_ones$AP13_N_subgenome)
one_ones$AP13_N_subgenome <- gsub(".5.p", "", one_ones$AP13_N_subgenome)
one_ones$AP13_N_subgenome <- gsub(".6.p", "", one_ones$AP13_N_subgenome)
one_ones$AP13_N_subgenome <- gsub(".7.p", "", one_ones$AP13_N_subgenome)
one_ones$AP13_N_subgenome <- gsub(".8.p", "", one_ones$AP13_N_subgenome)
one_ones$AP13_N_subgenome <- gsub(".9.p", "", one_ones$AP13_N_subgenome)
one_ones$AP13_N_subgenome <- gsub(".10.p", "", one_ones$AP13_N_subgenome)

# now label them by chromosome
labeled_oneones <- mutate(one_ones, N_chrom = str_split_fixed(one_ones$AP13_N_subgenome, "G", 2)[,1])
labeled_one1s <- mutate(labeled_oneones, K_chrom = str_split_fixed(one_ones$AP13_K_subgenome, "G", 2)[,1])

# remove n. / k designation to just retain the genes on homeologous chromosomes
labeled_one1s$N_chrom <- gsub("N", "", labeled_one1s$N_chrom)
labeled_one1s$K_chrom <- gsub("K", "", labeled_one1s$K_chrom)

# get list of homeologous genes 
homeologues <- (filter(labeled_one1s, N_chrom == K_chrom))

# about half of all genes have a streightforward homeologue (35,000)
# writing that to a .csv to save
write.csv(homeologues, "~/Dropbox/LowryLab/homeologues_one_one.csv")

# now deal with the genes that are many-to-many or many-to-one
many <- as.data.frame(filter(Orthogroups, AP13_K_subgenome != "",
                                 AP13_N_subgenome != "")[1:5280,])

# I think do deal with the many I will 
# 1) string-split the first (k subgenome) column 
# 2) melt and keep the second column comma'd 
# 3) string split the second column 
# 4) melt the second column 
# 5) do the same kind of labeling and cleaning as for the one-one files 
#6) delete duplicates if there are any 
# 7) only keep pairs on different subgenomes and homeologous chromosomes (this may take some finagling / multi-steps)

# grabbing the first 5200ish rows 

many_orthos <- (as.data.frame(filter(Orthogroups, AP13_K_subgenome != "",
                     AP13_N_subgenome != "")[1:5280,]))


# splitting K subgenome genes 
K_split <- as.data.frame(str_split_fixed(many_orthos$AP13_K_subgenome, ",", 22))

# melt to make it long
long_K <- melt(as.data.frame(cbind(many_orthos$Orthogroup, K_split)), id.vars='many_orthos$Orthogroup')
long_K <- filter(long_K, value !="")

# splitting N subgenome genes 
N_split <- as.data.frame(str_split_fixed(many_orthos$AP13_N_subgenome, ",", 27))

# melt to make it long 
long_N <- melt(as.data.frame(cbind(many_orthos$Orthogroup, N_split)), id.vars='many_orthos$Orthogroup')
long_N <- filter(long_N, value != "")

# put them together
long_NK <- as.data.frame(rbind(long_K, long_N))

# clean up the gene names 
long_NK$value <- gsub(".1.p", "", long_NK$value)
long_NK$value <- gsub(".2.p", "", long_NK$value)
long_NK$value <- gsub(".3.p", "", long_NK$value)
long_NK$value <- gsub(".4.p", "", long_NK$value)
long_NK$value <- gsub(".5.p", "", long_NK$value)
long_NK$value <- gsub(".6.p", "", long_NK$value)
long_NK$value <- gsub(".7.p", "", long_NK$value)
long_NK$value <- gsub(".8.p", "", long_NK$value)
long_NK$value <- gsub(".9.p", "", long_NK$value)
long_NK$value <- gsub(".10.p", "", long_NK$value)
long_NK$value <- gsub(".11.p", "", long_NK$value)
long_NK$value <- gsub(".12.p", "", long_NK$value)
long_NK$value <- gsub(".13.p", "", long_NK$value)
long_NK$value <- gsub(".14.p", "", long_NK$value)
long_NK$value <- gsub(".15.p", "", long_NK$value)
long_NK$value <- gsub(".16.p", "", long_NK$value)
long_NK$value <- gsub(".17.p", "", long_NK$value)
long_NK$value <- gsub(".18.p", "", long_NK$value)
long_NK$value <- gsub(".19.p", "", long_NK$value)
long_NK$value <- gsub(".20.p", "", long_NK$value)
long_NK$value <- gsub(".21.p", "", long_NK$value)
long_NK$value <- gsub(".22.p", "", long_NK$value)
long_NK$value <- gsub(".23.p", "", long_NK$value)
long_NK$value <- gsub(".24.p", "", long_NK$value)
long_NK$value <- gsub(".25.p", "", long_NK$value)
long_NK$value <- gsub(".26.p", "", long_NK$value)
long_NK$value <- gsub(".27.p", "", long_NK$value)

# next I'm adding label columns with subgenome and chromosome number
long_NK_lab <- mutate(long_NK, chrom = str_split_fixed(long_NK$value, "G", 2)[,1])

# taking out the space from the chrom names 
long_NK_lab$chrom <- gsub(" ", "", long_NK_lab$chrom)


# split and label by subgenome
long_Nlab <- filter(long_NK_lab, chrom == "Pavir.1N" |
                      chrom == "Pavir.2N" |
                      chrom == "Pavir.3N" |
                      chrom == "Pavir.4N" |
                      chrom == "Pavir.5N" |
                      chrom == "Pavir.6N" |
                      chrom == "Pavir.7N" |
                      chrom == "Pavir.8N" |
                      chrom == "Pavir.9N")

long_Nlab$subgenome <- "N"

long_Klab <- filter(long_NK_lab, chrom == "Pavir.1K" |
                      chrom == "Pavir.2K" |
                      chrom == "Pavir.3K" |
                      chrom == "Pavir.4K" |
                      chrom == "Pavir.5K" |
                      chrom == "Pavir.6K" |
                      chrom == "Pavir.7K" |
                      chrom == "Pavir.8K" |
                      chrom == "Pavir.9K")

long_Klab$subgenome <- "K"

# remove n. / k designation to just retain the genes on homeologous chromosomes
long_Nlab$chrom <- gsub("N", "", long_Nlab$chrom)
long_Klab$chrom <- gsub("K", "", long_Klab$chrom)

# put them both together

both <- rbind(long_Klab,
      long_Nlab)

#inner join all the cleaned up orthos  
manyMany <- inner_join(long_Klab, long_Nlab, by = 'many_orthos$Orthogroup',
           relationship = "many-to-many")

# clean up the dataframe
manyMany <- select(manyMany, -variable.x, -variable.y)
man_clean <- manyMany %>% rename(Orthogroup = 'many_orthos$Orthogroup')

# filter to homeologous genes 
filter(man_clean, chrom.x == chrom.y,
       subgenome.x != subgenome.y)

homeologues$type <- "one_one"
head(homeologues)

man_clean$type <- "many_many"
man_clean <- man_clean %>% rename(AP13_K_subgenome = value.x)
man_clean <- man_clean %>% rename(AP13_N_subgenome = value.y)

homeo_many <- select(man_clean, Orthogroup, AP13_K_subgenome, AP13_N_subgenome, type)
homeologues <- select(homeologues, Orthogroup, AP13_K_subgenome, AP13_N_subgenome, type)

head(homeo_many)
head(homeologues)

all_homeo <- rbind(homeo_many, 
                   homeologues)

write.csv(all_homeo, "~/Dropbox/LowryLab/homeologues_all.csv")

# next steps 
# re-visit modules 
# check that you've properly combined similar modules 
# look at each homeologue pair, look up which module each gene is in, document whether they are in the same module or different modules 
# re-visit the e-QTLs to figure out the shadow band situation 
