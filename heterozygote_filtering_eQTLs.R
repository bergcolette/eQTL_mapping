# doing genotype-based filtering

# read in genotypes from all 18 chromosomes (Midwest)
# subgenome N
Chr01N_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr01N_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr02N_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr02N_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr03N_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr03N_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr04N_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr04N_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr05N_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr05N_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr06N_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr06N_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr07N_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr07N_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr08N_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr08N_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr09N_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr09N_Atlantic_matrix.txt", sep = "\t", header = FALSE)

# subgenome K 
Chr01K_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr01K_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr02K_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr02K_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr03K_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr03K_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr04K_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr04K_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr05K_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr05K_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr06K_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr06K_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr07K_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr07K_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr08K_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr08K_Atlantic_matrix.txt", sep = "\t", header = FALSE)
Chr09K_Atlantic <- read.csv("~/Dropbox/lowryLab/data/genotypes/Chr09K_Atlantic_matrix.txt", sep = "\t", header = FALSE)

# now counting the hets 
Atlantic_1K_hetC <- Chr01K_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_2K_hetC <- Chr02K_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_3K_hetC <- Chr03K_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_4K_hetC <- Chr04K_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_5K_hetC <- Chr05K_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_6K_hetC <- Chr06K_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_7K_hetC <- Chr07K_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_8K_hetC <- Chr08K_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_9K_hetC <- Chr09K_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()

Atlantic_1N_hetC <- Chr01N_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_2N_hetC <- Chr02N_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_3N_hetC <- Chr03N_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_4N_hetC <- Chr04N_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_5N_hetC <- Chr05N_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_6N_hetC <- Chr06N_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_7N_hetC <- Chr07N_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_8N_hetC <- Chr08N_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()
Atlantic_9N_hetC <- Chr09N_Atlantic %>% rowwise() %>% mutate(count_hets = count(c_across(V2:V191) == 1)) %>% ungroup()

Atlantic_1K_filt <- filter(Atlantic, count_hets < 172)

