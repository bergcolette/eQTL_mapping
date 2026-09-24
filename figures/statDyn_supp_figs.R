
ggplot(Gulf_statDyn, aes(x = folded,
                         fill = category)) + 
         geom_histogram() +
  facet_grid(type~category,
             scales = "free") +
  theme_bw() +
  scale_fill_manual(values = c("red",
                               "dodgerblue",
                               "black")) +
  ggtitle("Site Frequency Spectrum, static vs. dynamic, Gulf population")
       


ggplot(Midwest_statDyn, aes(x = folded,
                         fill = category)) + 
  geom_histogram() +
  facet_grid(type~category,
             scales = "free") +
  theme_bw() +
  scale_fill_manual(values = c("red",
                               "dodgerblue",
                               "black")) +
  ggtitle("Site Frequency Spectrum, static vs. dynamic, Midwest population")

ggplot(Atlantic_statDyn, aes(x = folded,
                            fill = category)) + 
  geom_histogram() +
  facet_grid(type~category,
             scales = "free") +
  theme_bw() +
  scale_fill_manual(values = c("red",
                               "dodgerblue",
                               "black")) +
  ggtitle("Site Frequency Spectrum, static vs. dynamic, Atlantic population")
