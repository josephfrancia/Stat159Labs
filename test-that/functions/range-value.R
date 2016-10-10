range_value <- function(x, na.rm=TRUE){
  if(na.rm==TRUE){
    x=as.vector(na.omit(x)) 
    max(x) - min(x)
  }
  else{
  max(x) - min(x)
    }
}