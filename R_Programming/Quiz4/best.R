best <- function(state, outcome) {
  
  my_data <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors=FALSE)
  states = my_data[,7]
  
  validstates <- unique(my_data[,7])
  if(!state %in% validstates) {
    message("state not defined")
    print(state)
    stop("Invalid State")
  }
  
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23) 
  colname <- outcomes[outcome]
  
  data.state <- my_data[my_data$State==state,]
  
  idx <- which.min(as.double(data.state[,colname]))
  data.state[idx,"Hospital.Name"]
  print(data.state[idx,"Hospital.Name"])
  
}