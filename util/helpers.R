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


# Fix upload file names
# from https://github.com/daattali/advanced-shiny/blob/master/upload-file-names/app.R
fixUploadedFilesNames <- function(x) {
  if (is.null(x)) {
    return()
  }
  
  oldNames = x$datapath
  newNames = file.path(dirname(x$datapath),
                       x$name)
  file.rename(from = oldNames, to = newNames)
  x$datapath <- newNames
  x
}