complete <- function(directory, id = 1:332)  {
  
  files <- paste(directory, "/", formatC(id, width = 3, flag = "0"), ".csv", sep = "")
  ids <- vector()
  obs <- vector()
  
  for(i in seq_along(files) ) {
    csv <- files[i]
    
    mydata <- read.csv(csv, header = TRUE, sep = ",")
    
    dataset <- na.omit(mydata)
   
    ob <- NROW(na.omit(mydata))
    
    obs <- c(ob, obs)
    ids <- c(id[i],ids)
    
  }
  
  DF <- data.frame(ids, obs)
  print(DF)
}