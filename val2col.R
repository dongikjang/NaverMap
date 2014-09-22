val2col <- function(z, zlim, col = heat.colors(12), breaks){
  if(!missing(breaks)){
    if(length(breaks) != (length(col)+1)){stop("must have one more break than colour")}
  }
  if(missing(breaks) & !missing(zlim)){
    #breaks <- seq(zlim[1], zlim[2], length.out=(length(col)+1)) 
    breaks <- seq(zlim[1], zlim[2], length.out=(length(col))) 
  }
  if(missing(breaks) & missing(zlim)){
    zlim <- range(z, na.rm=TRUE)
    breaks <- seq(zlim[1], zlim[2], length.out=(length(col))) 
    #breaks <- seq(zlim[1], zlim[2], length.out=(length(col)+1)) 
  }
  colorlevels <- col[((as.vector(z)-breaks[1])/(range(breaks)[2]-range(breaks)[1]))*(length(breaks)-1)+1] # assign colors to heights for each point
  colorlevels
}