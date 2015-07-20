complete <- function(directory, id = 1:332)
{
  
  lista <- list.files(directory, full.names=TRUE) 
  dat <- data.frame()      
  
  tmp <- lapply(lista, read.csv)
  dat <- do.call(rbind, tmp)
  
  ### crea el vector de ids.
  nobs <- numeric(length = length(id))
  
  for (i in seq_along(id)) {
    dat_subset <- dat[which(dat[, "ID"] == id[i]),]
    nobs[i] <- sum(complete.cases(dat_subset))
    
  }
  
  idsmatrix <-cbind(id, nobs)
  return(as.data.frame(idsmatrix))
  
  
}




  

  
  

