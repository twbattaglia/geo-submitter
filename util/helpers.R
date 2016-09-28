# @ Thomas W. Battaglia
# Helper functions for geo-submitter

# Load additional libraries
library(shinyjs)
library(knitr)
library(dplyr)
library(highcharter)
library(NanoStringNorm)
library(ggplot2)
library(reshape2)
library(rhandsontable)
library(affy)
library(gcrma)
library(affyPara)

# For writing data to file
write_append <- function(..., filename) {
  write(x = ..., file = filename, append = TRUE)
}

# Load NCBI GLP identifiers + sort
ncbi_glp <- readRDS("util/ncbi_glp.RDS")
ncbi_glp <- sort(ncbi_glp)
