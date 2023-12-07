
library(tseries)   # For timeseries analysis
library(lmtest) 
library(sf)
library(spdep)
library(GWmodel)
library(ggplot2)
library(viridis)
library(RColorBrewer)

library(rgdal)
library(sp)
library(ggmap)
#######################################################################################################################################
sf::st_read('~/buyouts/outputs/ParcelGC_LUC_sce1.shp') -> parcel2
#datasf = readOGR('~/buyouts/outputs/ParcelGC_LUC_sce1.shp')

sf::st_crs(parcel2) <- 4326;
parcel2 <- st_transform(parcel2, crs = 2163)


# Check data
head(parcel2); 
str(parcel2);
names(parcel2)
#######################################################################################################################################

pal <- brewer.pal( 5, "YlGn" )
png("~/buyouts/figs/ParkDist.png", width = 6, height = 4, units = 'in', res = 300)
plot(parcel2['ParkDist'], graticule= sf::st_crs(4326), lwd = 0.1,
     main='Distance to the nearest park', breaks="quantile", nbreaks = 5, 
     axes=TRUE, pal = pal)
dev.off()

#######################################################################################################################################
pal <- brewer.pal( 5, "Greens" )
png("~/buyouts/figs/BeachDist.png", width = 11, height = 9, units = 'in', res = 300)
plot(parcel2['BeachDist'], graticule= sf::st_crs(4326), lwd = 0.1,
     main='Distance to Beaches', breaks="quantile", nbreaks = 5, 
     axes=TRUE, pal = pal)
dev.off()

#######################################################################################################################################
pal <- brewer.pal( 5, "Purples" )

png("~/buyouts/figs/SchoolDist.png", width = 11, height = 9, units = 'in', res = 300)
plot(parcel2['SchoolDist'], graticule= sf::st_crs(4326), lwd = 0.1,
     main='Distance to Schools', breaks="quantile", nbreaks = 5, 
     axes=TRUE, pal = pal)
dev.off()
#######################################################################################################################################
pal <- brewer.pal( 5, "Greens" )
png("~/buyouts/figs/CoastDist.png", width = 11, height = 9, units = 'in', res = 300)
plot(parcel2['CoastDist'], graticule= sf::st_crs(4326), lwd = 0.1,
     main='Distance to the Coast', breaks="quantile", nbreaks = 5, 
     axes=TRUE, pal = pal)
dev.off()

#######################################################################################################################################
pal <- brewer.pal( 5, "OrRd" )
png("~/buyouts/figs/WetlantDist.png", width = 11, height = 9, units = 'in', res = 300)
plot(parcel2['WetlatDist'], graticule= sf::st_crs(4326), lwd = 0.1,
     main='Distance to Wetlands', breaks="quantile", nbreaks = 5, 
     axes=TRUE, pal = pal)
dev.off()

#######################################################################################################################################

png("~/buyouts/figs/slope.png", width = 11, height = 9, units = 'in', res = 300)

ggplot()+
  geom_sf(data = parcel2, aes( fill = slope_mhw ), lwd = 0.05)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_distiller( palette = "BuGn", breaks="quantile", direction = 1 )+ 
  theme(legend.position = c(0.8, 0.2) ) +
  theme(legend.title = element_text(size= 20, face = "bold"), #change legend title font size
        legend.text = element_text(size=  20)) +
  guides(fill = guide_legend( title = "Slope(degree)"))

dev.off()

#######################################################################################################################################
png("~/buyouts/figs/DEMmhw.png", width = 11, height = 9, units = 'in', res = 300)

ggplot()+
  geom_sf(data = parcel2, aes( fill = DEM ), lwd = 0.05)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_distiller( palette = "Blues", breaks="quantile", direction = 1 )+ 
  theme(legend.position = c(0.8, 0.2) ) +
  theme(legend.title = element_text(size= 20, face = "bold"), #change legend title font size
        legend.text = element_text(size=  20)) +
  guides(fill = guide_legend( title = "Ground elevation(feet)"))

dev.off()
#######################################################################################################################################
#############################1###########################################################################################################
png("~/buyouts/figs/WetlantDist2.png", width = 11, height = 9, units = 'in', res = 300)

ggplot()+
  geom_sf(data = parcel2, aes( fill = WetlatDist ), lwd = 0.05)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_distiller( palette = "OrRd", direction = 1 )+ 
  theme(legend.position = c(0.8, 0.2) ) +
  theme(legend.title = element_text(size= 20, face = "bold"), #change legend title font size
        legend.text = element_text(size=  20)) +
  guides(fill = guide_legend( title = "Distance to Wetlands(m)"))

dev.off()
#######################################################################################################################################

