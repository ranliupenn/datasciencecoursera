complete <- function(directory, id = 1:332) {

  files_full <- list.files(directory, full.names=TRUE)
  nobs<- vector()
  
  for (i in id) {
  nobs<- c(nobs, sum(complete.cases(read.csv(files_full[i]))))
  }
  
  data.frame(id, nobs)
 }


complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
