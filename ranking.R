outcome_data<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
rankhospital<-function(state,outcome,rank) {
  states<-names(split(outcome_data,outcome_data$State))
  
  for (i in 1:length(states)) {
    if (state == states[i]) {
      index<-i
    }
  }
  target <- data.frame(split(outcome_data,outcome_data$State)[index])
  outcomes<-c('heart attack','heart failure','pneumonia')
  if (outcome == outcomes[1]) {
    colnames(target)[11] = 'This'
  } else if(outcome == outcomes[2]) {
    colnames(target)[17] = 'This'
  } else {
    colnames(target)[23] = 'This'
  }
  target$This<-as.numeric(target$This)
  colnames(target)[2] <- 'Name'
  targetsort<-target[order(target$This,target$Name),]
  if (class(rank) == 'numeric') {
  print(targetsort[rank,][,2])
  } else {
          x<-data.frame(targetsort$Name,targetsort$This)
          View(x)
  }
}