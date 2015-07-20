
pollutantmean <- function(directory, pollutant, id = 1:332 )
{
  ## tomamos el approach de solo tomar los archivos que se van a usar.
  ## creamos el vector
  totalvectorpollutant <- vector(mode="numeric", length=0)
  
  for(i in id){
    archivoutil <- paste(directory, "/", sprintf("%03d", (i)), ".csv", sep = "")
    matrixbyid <- read.csv(archivoutil)
    
    vectorpollutant <- matrixbyid[[pollutant]]
    
    ## poblamos el vector
    totalvectorpollutant <- append(totalvectorpollutant, vectorpollutant)
  }
  
  ## sacamos media.
  
  mean(totalvectorpollutant, na.rm = T)
}

