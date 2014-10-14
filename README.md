NaverMap
========
R functions for using Naver Map tiles


### An example

```coffee
require(rgdal)
require(png)
require(RgoogleMaps)
require(RColorBrewer)

# load location of traffic counting data in Seoul
tloc <- read.csv("TCountingLocInSeoul.csv", header = TRUE, stringsAsFactors = FALSE)
lon <- tloc$X5
lat <- tloc$X6

# download Daum Map tiles
dmap <- getNaverMap(lon, lat, zoom=NA)
cols <- brewer.pal(9, "Set1")
plot(dmap)
naverloc <- WGS842Naver(tloc[ , c("X5", "X6")])
points(naverloc,  pch=19, col=cols[tloc$X2])
```

![tloc](screenshots/tloc.png)