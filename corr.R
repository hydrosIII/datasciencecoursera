source("complete.R")

corr <- function (directory, threshold = 0) {
  
  lista <- complete(directory, id = 1:332)
  listaframe <- as.data.frame(lista)
  frame_subset <- listaframe[which(listaframe[, "nobs"] > as.numeric(threshold)),]
  idsutiles <- frame_subset$id
  
  correlation <- numeric()
  
  
  for(i in idsutiles){
    archivoutil <- paste(directory, "/", sprintf("%03d", (i)), ".csv", sep = "")
    matrixbyid <- read.csv(archivoutil)
    correlation <- append(correlation, cor(matrixbyid[["nitrate"]], matrixbyid[["sulfate"]], use="complete"))
  }
  
  correlation
  
}