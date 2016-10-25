library(tidyverse)
library(metaPsychometric)

ex4_data <- read_csv("meta_data_ex4.csv")

# we're correcting every study individually and then we do a meta-analysis on the corrected correlations

# bare bones just means it's not corrected
meta_bare_bones(ex4_data)
meta_corrected(ex4_data)

ex4_canada <- ex4_data %>% filter(country=="Canada")
ex4_usa <- ex4_data %>% filter(country=="United States")

meta_corrected(ex4_canada)
meta_corrected(ex4_usa)

# weaker relationship in canada than the usa, but both correlations are moderate/moderately-strong; also cred_LL/UL do not even overlap in this case

# corrections are more helpful in a meta-analysis, than looking at in a single study

# correcting will result in less biased, but more variable (vs observed, which will be biased but more tightly clustered)

# Previously correcting for random error / measurement error??? (DC!); Another thing you can correct for is range-restriction (think of example with memory task for kids and IQ; all children vs picking children only in the gifted program will give very differrent correlations)
# yet another is indirect range-restriction; can correct for number of points on scale (5 vs 7 etc - correct for attentuation); all kinds of things you can correct for in a meta-analysis = better estimate of true population correlation

