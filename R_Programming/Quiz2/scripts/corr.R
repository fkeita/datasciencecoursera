corr <- function(directory, threshold = 0) {
  
  files <- list.files(directory, full.names=TRUE)
  corrs <- vector()
  
  ##files <- paste(directory, "/", formatC(id, width = 3, flag = "0"), ".csv", sep = "")
  
  for(i in seq_along(files) ) {
    csv <- files[i]
    ##print(csv)
    mydata <- read.csv(csv, header = TRUE, sep = ",")
    
    dataset <- na.omit(mydata)
    
    len <- NROW(dataset)
    ##print(len)
    
    if(len > threshold) {
      sulfate <- dataset$sulfate
      nitrate <- dataset$nitrate
      ###print(sulfate)
      ##print(nitrate)
      
      cr <- cor(sulfate, nitrate)
      
      corrs = c(corrs,cr )
      
    } 
    
  }
  mycorr <- corrs
  ##print(mycorr)
}