# Jackie Roger
# May 18, 2020

# Credit for how to load multiple tsvs:
# https://stackoverflow.com/questions/30242065/trying-to-merge-multiple-csv-files-in-r

library(tidyverse)

wd <- "/Users/jacquelynroger/Documents/research/treehouse/projects/outlier_lead_accuracy/bulk_processing/"
setwd(wd)

# Load data

samples <- list.files(path=paste0(wd, "results/"))
first <- TRUE
for (s in samples) {
  curr_wd <- paste0(wd, "results/", s, "/")
  setwd(curr_wd)
  leads <- list.files(path=curr_wd) %>%
    lapply(read_tsv) %>%
    bind_rows
  if (first == TRUE) {
    results_all <- leads
    first <- FALSE
  } else {
    results_all <- bind_rows(results_all, leads)
  }
}

names(results_all) <- gsub(" ", "_", names(results_all))

# Plot results

plot1 <- ggplot(results_all, aes(Expression, Mean_Accuracy)) +
  geom_point()

plot1