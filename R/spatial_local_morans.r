
library(tseries)   # For timeseries analysis
library(lmtest) 
library(sf)
library(spdep)
library(GWmodel)
library(ggplot2)
library(plotly)
library(dplyr)
#######################################################################################################################################

sf::st_read('~/exported_data/local_morans/df_localMorans.shp') -> dffips

sf::st_crs(dffips) <- 4326;
dffips<- st_transform(dffips, crs = 2163)

dffips2 <- dffips %>% st_drop_geometry()

dffips2$colors <- ifelse( dffips2$label2 == 0, "grey",
                  ifelse( dffips2$label2 == 1, "red", 
                  ifelse( dffips2$label2 == 2, "lightblue",
                  ifelse( dffips2$label2 == 3, "orange", "blue") )))

dffips3 <- dffips %>% left_join( dffips2[c("fips", "colors")], by = c( "fips" = "fips" )  )



plot(dffips3['label2'], graticule= sf::st_crs(4326), 
     main='', col = dffips3['colors'],
     #lwd = dffips$sig3, 
     axes=TRUE)
