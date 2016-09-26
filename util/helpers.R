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

# For writing data to file
write_append <- function(..., filename) {
  write(x = ..., file = filename, append = TRUE)
}
