library(knitr)

library(tidyverse)

base_dir <- "/Users/hbeale/downloads/accuracy_data/"
data_dirs <- list.files(base_dir)

render_report <- function(data_dir, base_dir){
  file <- "/Users/hbeale/Documents/Dropbox/ucsc/projects/gitCode/outlier_lead_accuracy/calculate_outlier_accuracy_v7_parameterized.Rmd"
  rmarkdown::render(file, params = list(
    this_data_dir = file.path(base_dir, data_dir)
  ), envir = new.env(),
  output_file = paste0(data_dir, ".html")
  )
}

lapply(data_dirs, render_report, base_dir)
