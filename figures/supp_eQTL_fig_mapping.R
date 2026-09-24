library(gridExtra)

summary(lm(betaTX ~ betaMI, Atlantic_subLabeled))

ggplot(all_subLabeled,
       aes(x = betaTX,
           y = betaMI)) +
  geom_point(size = 0.5) +
  facet_wrap(~pop) +
  theme_bw() +
  ggtitle("eQTL effects in MI and TX")

betaTX <- ggplot(all_subLabeled,
       aes(y = abs(betaTX),
           x = type)) +
  facet_wrap(~pop) +
  geom_boxplot(outlier.size = 0,
               outlier.shape = NA) +
  theme_bw() +
  ylab("eQTL effect, Texas") +
  ggtitle("eQTL effect comparisons, Texas") +
  ylim(0, 0.004)

betaMI <- ggplot(all_subLabeled,
                 aes(y = abs(betaMI),
                     x = type)) +
  facet_wrap(~pop) +
  geom_boxplot(outlier.size = 0,
               outlier.shape = NA) +
  theme_bw() +
  ylab("eQTL effect, Texas") +
  ggtitle("eQTL effect comparisons, Michigan") +
  ylim(0, 0.004)

grid.arrange(betaTX,
             betaMI)


  theme_bw() +
  theme(legend.position = "bottom")

ggplot(all_subLabeled,
       aes(x = genome_Chrom,
           fill = eQTL_genome)) +
  facet_wrap(~pop,
             scales = "free_y",
             nrow = 3,
             strip.position = "left") +
  geom_bar() +
  theme_bw() +
  theme(legend.position = "bottom")

ggplot(Atlantic_subLabeled,
       aes(x = betaTX,
           y = betaMI)) +
  geom_point() +
  theme_bw() +
  theme(axis.text = element_text(size = 18),
        axis.title = element_text(size = 24),
        title = element_text(size = 24)) +
  ggtitle("Atlantic eQTL effects across sites") +
  ylab("eQTL effects (Michigan)") +
  xlab("eQTL effects (Texas)")

ggplot(filter(Gulf_subLabeled,
              type == "trans"),
       aes(y = subMatch)) +
  geom_bar() +
  theme_bw() +
  theme(axis.text = element_text(size = 18),
        axis.title = element_text(size = 24),
        title = element_text(size = 24))

ggplot(Gulf_subLabeled,
       aes(x = type,
           y = abs(betaTX))) + 
  geom_boxplot(outlier.size = 0,
               outlier.shape = NA) +
  theme_bw() +
  theme(axis.text.y = element_text(size = 18),
        axis.text.x = element_text(size = 22),
        axis.title = element_text(size = 24),
        title = element_text(size = 24)) +
  ylab("eQTL effect (TX)") +
  ylim(0, 0.003)

ggplot(filter(Atlantic_hot,
              genome_Chrom == "Chr03N" | 
                genome_Chrom =="Chr08N"),
       aes(x = genome_bp,
           y = n,
           col = presence)) +
  geom_point() + 
  facet_wrap(~genome_Chrom,
             scales = "free") +
  geom_smooth(method = "loess",
            span = 0.1,
            se = FALSE)

# Midwest eQTLs
ggplot(Atlantic_GxE,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000)) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        #legend.position = "none",
        panel.grid = element_blank()) +
  geom_point(size = 0.6) +
  ggtitle("Atlantic GxE eQTL") +
  #scale_color_manual(values=c("dodgerblue",
       #                       "black",
                   #           "red")) +
  xlab("Genome Position") + 
  ylab("Gene Position")

Atlantic_GxE$chr <-
   factor(Atlantic_GxE$chr,
             levels = c("Chr09N",
                        "Chr09K",
                        "Chr08N",
                        "Chr08K",
                        "Chr07N",
                        "Chr07K",
                        "Chr06N",
                        "Chr06K",
                        "Chr05N",
                        "Chr05K",
                        "Chr04N",
                        "Chr04K",
                        "Chr03N",
                        "Chr03K",
                        "Chr02N",
                        "Chr02K",
                        "Chr01N",
                        "Chr01K"))
v


# Atlantic eQTLs
ggplot(Atlantic_presence_labeled,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000,
           col = presence)) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        #legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  ggtitle("Atlantic eQTLs") +
  scale_color_manual(values=c("dodgerblue",
                              "black",
                              "red")) +
  xlab("Genome Position") + 
  ylab("Gene Position")

# GxE Midwest eQTLs
ggplot(Midwest_GxE_eQTLs_filt,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000)) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        #legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  ggtitle("Midwest GxE eQTLs") +
  xlab("Genome Position") + 
  ylab("Gene Position")

# GxE Atlantic eQTLs
ggplot(Atlantic_GxE_eQTLs_filt,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000)) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        #legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  ggtitle("Atlantic GxE eQTLs") +
  xlab("Genome Position") + 
  ylab("Gene Position")

# GxE Gulf eQTLs
ggplot(Gulf_GxE_eQTLs_filt,
       aes(y = as.numeric(s1)/1000000,
           x = as.numeric(genome_bp)/1000000)) + #alpha = -log10(p.value))) +
  facet_grid(chr ~ genome_Chrom,
             scale = "free",
             space = "free") + 
  theme_bw() +
  theme(strip.background = element_rect(fill="white"),
        panel.spacing = unit(0, "lines"),
        #legend.position = "none",
        panel.grid = element_blank()) +
  geom_point() +
  ggtitle("Gulf GxE eQTLs") +
  xlab("Genome Position") + 
  ylab("Gene Position")

nrow(filter(Gulf_GxE_eQTLs_filt, type == "cis"))
nrow(filter(Gulf_GxE_eQTLs_filt, type == "trans"))


