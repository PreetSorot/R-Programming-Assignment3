outcome_data<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
rankall<-function(disease,num) {
  
  if (disease == 'heart attack') {
    colnames(outcome_data)[11] = 'Outcome'
  }else if (disease == 'heart failure') {
    colnames(outcome_data)[17]='Outcome'
  } else if (disease == 'pneumonia') {
    colnames(outcome_data)[23] = 'Outcome'
  } else stop()
  
  colnames(outcome_data)[2] = 'Names'
  
  outcome_data<-outcome_data[order(outcome_data$State, as.numeric(outcome_data$Outcome),outcome_data$Names),]
  
  statef<-outcome_data$State              ## state factor
  outcomes<-outcome_data$Names          ## outcomes vector
  final_list<-split(outcomes,statef)      ## split list of outcomes by statef
  
  hospitals<-character()
  for (i in 1:length(final_list)) {
    hospitals<-c(hospitals,final_list[[i]][num])
  }
  df<-data.frame(names(final_list),hospitals)
  return(df)
  
}