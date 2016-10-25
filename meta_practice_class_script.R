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
# LL and UL = meta-analytic confidence interval; makes sense to look at if there are no moderators; if you have moderators, it suggests there are more than one population correlation THUS then cred_UL and cred_LL is more informative
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

ex3_data <- read_csv("meta_data_ex3.csv")
View(ex3_data)

ex3_results <- meta_bare_bones(ex3_data)
ex3_results

meta_plot_funnel(ex3_results)
meta_plot_forest(ex3_results)
# forest plot here reveals that all of the ones in Canada were underestimates; US were overestimates - suggests different population correlations by country

ex3_canada = ex3_data %>% filter(country=="Canada")
ex3_usa = ex3_data %>% filter(country=="United States")

View(ex3_canada)
View(ex3_usa)

meta_bare_bones(ex3_canada)
meta_bare_bones(ex3_usa)
# notice that it appears that the moderator issue has been solved since neither have moderators right now - and credibility intervals don't even overlap (although they can hypothetically); in class he pointed out r_bar (meta-analytic correlation), per_error and credibility intervals

ex3_results_canada <- meta_bare_bones(ex3_canada)
ex3_results_usa <- meta_bare_bones(ex3_usa)

meta_plot_forest(ex3_results_canada)
meta_plot_forest(ex3_results_usa)

meta_plot_funnel(ex3_results_canada)
meta_plot_funnel(ex3_results_usa)


