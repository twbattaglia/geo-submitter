


# @ Thomas W. Battaglia

# Utility Functions
write_append <- function(...) write(x = ..., file = fullsoftname, append = TRUE)

# Gather Series Information
seriesInfo <- read.delim("pulsePAT/seriesInfo.txt")

# Gather Sample Information
sampleInfo <- read.delim("pulsePAT/sampleInfo.txt")


# Write output file
fullsoftname = "soft.txt"

# Import RCC data
rcc_import <- import_rcc("pulsePAT/pulsePAT_RCC//")
row.names(rcc_import) <- rcc_import$Name

# Normalize data
rcc <- NanoStringNorm(
  x = rcc_import,
  anno = NA,
  CodeCount = 'sum',
  Background = 'mean',
  SampleContent = 'housekeeping.sum',
  round.values = FALSE,
  take.log = FALSE,
  return.matrix.of.endogenous.probes = TRUE, 
  verbose = F
)

#rcc <- subset(rcc, select = c(-1:-3))


# Write the series information @ the top
sapply(colnames(seriesInfo), simplify = T, function(x) {
  if(x == "SERIES"){
    write_append(paste0("^SERIES = ", seriesInfo$SERIES))
  } else if(x == "Series_contributor"){
    seriesContributor <- strsplit(x = as.character(seriesInfo$Series_contributor), 
                                  split = ";", 
                                  fixed = T)[[1]]
    write_append(paste0("!Series_contributor = ", seriesContributor))
  } else if(x == "Series_sample_id"){
    seriesSampleID <- strsplit(x = as.character(seriesInfo$Series_sample_id), 
                               split = ";", 
                               fixed = T)[[1]]
    write_append(paste0("!Series_sample_id = ", seriesSampleID))
    
  } else{
    write_append(paste0("!", x, " = ", seriesInfo[[x]]))
  }
})


# For each sample, write each column-value to a file
for (i in 1:nrow(sampleInfo)){
  
  # Subset table to only show current sample info
  sampleInfo_sub <- sampleInfo[i, ]
  
  # Current working sample title and write for ^SAMPLE
  sampleTitle <- sampleInfo_sub$Sample_title
  
  # Iterate over each column the table and write the sample info
  sapply(colnames(sampleInfo_sub), function(x) {
    if(x == "SAMPLE"){
      write_append(paste0("^", x, " = ", sampleInfo_sub$SAMPLE))
    } else if(x == "Sample_characteristics_ch1"){
      sampleCharacteristic <- strsplit(x = as.character(sampleInfo_sub$Sample_characteristics), 
                                       split = ";", 
                                       fixed = T)[[1]]
      write_append(paste0("!Sample_characteristics_ch1 = ", sampleCharacteristic))
      
    } else {
      write_append(paste0("!", x, " = ", sampleInfo_sub[[x]]))
    }
  })
  
  # Subset the expression values
  expressionInfo_sub <- subset(rcc, select = i)
  
  # Iterate over each row and write the expression values
  write_append("#ID_REF =")
  write_append(paste0("#VALUE = ", "Normalized expression counts"))
  write_append("!Sample_table_begin")
  write_append(paste("ID_REF", "VALUE", sep = "\t"))
  write.table(as.matrix(expressionInfo_sub), 
              file = fullsoftname, 
              append = TRUE, 
              quote = FALSE, 
              row.names = TRUE, 
              col.names = FALSE, 
              sep = "\t")
  write_append("!Sample_table_end")
}


