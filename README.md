NaverMap
========
R functions for using Naver Map tiles

### Load the source code for using Naver Map tiles

```coffee
gitaddress <- "https://raw.githubusercontent.com/dongikjang/NaverMap/"

# load the source code
library(RCurl)

u <- paste(gitaddress, "master/getNavermap.R", sep="")
eval(parse(text = getURL(u, followlocation = TRUE, 
                         cainfo = system.file("CurlSSL", "cacert.pem", 
                                              package = "RCurl"))), 
     envir = .GlobalEnv)
```

### An example

```coffee
require(rgdal)
require(png)
require(RgoogleMaps)
require(RColorBrewer)
     
# load location of traffic counting data in Seoul
gitaddress <- "https://raw.githubusercontent.com/dongikjang/NaverMap/"
TCLoc <- getURL(paste(gitaddress, "master/TCountingLocInSeoul.csv", sep=""),
    	          cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
#write(TCLoc, file="TCountingLocInSeoul.csv")
tloc <- read.csv(textConnection(TCLoc), stringsAsFactors = FALSE,
                 fileEncoding = "UTF-8")
lon <- tloc$X5
lat <- tloc$X6

# download Naver Map tiles
dmap <- getNaverMap(lon, lat, zoom=NA)
cols <- brewer.pal(9, "Set1")
plot(dmap)
naverloc <- WGS842Naver(tloc[ , c("X5", "X6")])
points(naverloc,  pch=19, col=cols[tloc$X2])
```

![tloc](screenshots/tloc.png)