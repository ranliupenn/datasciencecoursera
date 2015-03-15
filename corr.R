
source("complete.R")

corr <- function(directory, threshold = 0) {
  files_full <- list.files(directory, full.names=TRUE)
  com<- complete(directory, id=1:332)
  com_new<- subset(com, nobs>threshold)
  id_new<- com_new$id
  cor_vec<- vector()
  for (i in id_new){
    data_new<- read.csv(files_full[i])
    cor_new<- cor(data_new$nitrate, data_new$sulfate, use="complete.obs")
    cor_vec<- c(cor_vec, cor_new)
  }
  return(cor_vec)
}
  
cr <- corr("specdata", 150)
head(cr)

