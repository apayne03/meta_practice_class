devtools::install_github("dstanley4/metaPsychometric")
devtools::install_github("dstanley4/apaTables")

library(tidyverse)

ex1_data <- read_csv("meta_data_ex1.csv")

# see variable labels
glimpse(ex1_data)

# see first few lines of data
ex1_data

library(metaPsychometric)
?metaPsychometric 
# click index to find out what the commands are that I can use in the package
ex1_results <- meta_bare_bones(ex1_data)
ex1_results

# credibility interval (usually 80%) - estimated range of population correlations
# r_bar = r (correlation)
# variance of 1000 studies = var_obs (standard weighted variance)
# variability expected due to random sampling = var_exp
# per_error = var_ex/var_obs > 75% means no moderators (<75% means there's moderators)
# LL and UL = meta-analytic confidence interval; makes sense to look at if there are no moderators; if you have moderators, it suggests there are more than one population correlation
# cred_LL and cred_UL = 80% credibility interval = suggest no moderators

meta_plot_funnel(ex1_results)
# notice how larger sample size = more narrow; more wide (more variability) when smaller sample size

meta_plot_funnel(ex1_results)
meta_plot_funnel(ex1_results, show_null_dist = TRUE)

ex2_data <- read_csv("meta_data_ex2.csv")
ex2_results <- meta_bare_bones(ex2_data)
meta_plot_funnel(ex2_results)
View(ex2_data)
ex2_results

meta_plot_forest(ex2_results)
