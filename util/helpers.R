library(shinyjs)
library(knitr)
library(dplyr)

library(affy)
library(gcrma)

# Larger Text Area Input
textareaInput <- function(inputId, label, value="", placeholder="", rows=5){
  tagList(
    div(strong(label), style="margin-top: 5px;"),
    tags$style(type="text/css", "textarea {width:100%; margin-top: 5px;}"),
    tags$textarea(id = inputId, placeholder = placeholder, rows = rows, value))
}

# For writing data to file
write_append <- function(..., filename) {
  write(x = ..., file = filename, append = TRUE)
}

