pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  cols <- vector()
  
  files <- paste(directory, "/", formatC(id, width = 3, flag = "0"), ".csv", sep = "")
  
  for(i in seq_along(files) ) {
    csv <- files[i]
    print(csv)
    mydata <- read.csv(csv, header = TRUE, sep = ",")
    
    mycol <- mydata[[pollutant]]
    cols <- c(mycol,cols)
  
  }
  mymean <- mean(cols, na.rm = TRUE)
  print(mymean)
}