library(sf)
library(ggplot2)
library(viridis)
library(RColorBrewer)

scalFun <- function(x) sprintf("%.0f" , x)

dffips <- st_read( "~/exported_data/hazard_shp/states_sheldus_Geophysical.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#dffips$totalDamag = dffips$totalDamag + 1
#dffips$totalAssis = dffips$totalAssis + 1

png("~/exported_data/results/Geophysical_damage.png", width = 10, height = 7, units = 'in', res = 300)
ggplot()+
  geom_sf(data = dffips, aes(fill = totalDamag ), lwd = 0.2)+
  scale_fill_viridis( trans = "log", labels = function(x)sprintf("%0.2e",x),
                      name = "Total Damage($)\nfor Geophysical Hazards", option = "D") +
  #scale_y_continuous( trans = "log", labels = scales::percent,  ) +
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  #scale_fill_manual(values = c( "gray", "green", "yellow", "orange", "red"),
  #                  breaks = c( "0", "1.50e2", "1.50e2", "3.26e6", "4.85e8" ),
  #                  name = "Total Damage Amount($)\nfor Geophysical Hazards")+ 
  labs(title = "")+
  theme(legend.position = c( 0.12, 0.15 )  ) +
  theme( legend.title = element_text(size=10, face = "bold"), #change legend title font size
         legend.text = element_text(size= 10)) 
# guides(fill = guide_legend( nrow = 1))
dev.off()

pdf("~/exported_data/results/Geophysical_Assistan.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = totalAssis ), lwd = 0.2)+
  scale_fill_viridis( trans = "log", labels = function(x)sprintf("%0.2e",x),
                      name = "Total Assistance($)\nfor Geophysical Hazards", option = "D") +
  #scale_y_continuous( trans = "log", labels = scales::percent,  ) +
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  #scale_fill_manual(values = c( "gray", "green", "yellow", "orange", "red"),
  #                  breaks = c( "0", "1.50e2", "1.50e2", "3.26e6", "4.85e8" ),
  #                  name = "Total Damage Amount($)\nfor Geophysical Hazards")+ 
  labs(title = "")+
  theme(legend.position = c( 0.12, 0.15 )  ) +
  theme( legend.title = element_text(size=10, face = "bold"), #change legend title font size
         legend.text = element_text(size= 10)) 
# guides(fill = guide_legend( nrow = 1))

dev.off()


#################################################################################################################

dffips <- st_read( "~/exported_data/hazard_shp/states_sheldus_Hydrological.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#############################1#############################################
png("~/exported_data/results/Hydrological_damage.png", width = 10, height = 7, units = 'in', res = 300)
ggplot()+
  geom_sf(data = dffips, aes(fill = totalDamag ), lwd = 0.2)+
  scale_fill_viridis( trans = "log", labels = function(x)sprintf("%0.2e",x),
                      name = "Total Damage($)\nfor Hydrological Hazards", option = "D") +
  #scale_y_continuous( trans = "log", labels = scales::percent,  ) +
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  #scale_fill_manual(values = c( "gray", "green", "yellow", "orange", "red"),
  #                  breaks = c( "0", "1.50e2", "1.50e2", "3.26e6", "4.85e8" ),
  #                  name = "Total Damage Amount($)\nfor Geophysical Hazards")+ 
  labs(title = "")+
  theme(legend.position = c( 0.12, 0.15 )  ) +
  theme( legend.title = element_text(size=10, face = "bold"), #change legend title font size
         legend.text = element_text(size= 10)) 
# guides(fill = guide_legend( nrow = 1))
dev.off()


##############################2############################################

png("~/exported_data/results/Hydrological_assist.png", width = 10, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = totalAssis ), lwd = 0.2)+
  scale_fill_viridis( trans = "log", labels = function(x)sprintf("%0.2e",x),
                      name = "Total Assistance($)\nfor Hydrological Hazards", option = "D") +
  #scale_y_continuous( trans = "log", labels = scales::percent,  ) +
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  #scale_fill_manual(values = c( "gray", "green", "yellow", "orange", "red"),
  #                  breaks = c( "0", "1.50e2", "1.50e2", "3.26e6", "4.85e8" ),
  #                  name = "Total Damage Amount($)\nfor Geophysical Hazards")+ 
  labs(title = "")+
  theme(legend.position = c( 0.12, 0.15 )  ) +
  theme( legend.title = element_text(size=10, face = "bold"), #change legend title font size
         legend.text = element_text(size= 10)) 
# guides(fill = guide_legend( nrow = 1))

dev.off()



#############################1#############################################

dffips <- st_read( "~/exported_data/hazard_shp/states_sheldus_Meteorological.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#############################1#############################################
png("~/exported_data/results/Meteorological_damage.png", width = 10, height = 7, units = 'in', res = 300)
ggplot()+
  geom_sf(data = dffips, aes(fill = totalDamag ), lwd = 0.2)+
  scale_fill_viridis( trans = "log", labels = function(x)sprintf("%0.2e",x),
                      name = "Total Damage($)\nfor Meteorological Hazards", option = "D") +
  #scale_y_continuous( trans = "log", labels = scales::percent,  ) +
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  #scale_fill_manual(values = c( "gray", "green", "yellow", "orange", "red"),
  #                  breaks = c( "0", "1.50e2", "1.50e2", "3.26e6", "4.85e8" ),
  #                  name = "Total Damage Amount($)\nfor Geophysical Hazards")+ 
  labs(title = "")+
  theme(legend.position = c( 0.12, 0.15 )  ) +
  theme( legend.title = element_text(size=10, face = "bold"), #change legend title font size
         legend.text = element_text(size= 10)) 
# guides(fill = guide_legend( nrow = 1))
dev.off()


##############################2############################################

png("~/exported_data/results/Meteorological_assist.png", width = 10, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = totalAssis ), lwd = 0.2)+
  scale_fill_viridis( trans = "log", labels = function(x)sprintf("%0.2e",x),
                      name = "Total Assistance($)\nfor Meteorological Hazards", option = "D") +
  #scale_y_continuous( trans = "log", labels = scales::percent,  ) +
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  #scale_fill_manual(values = c( "gray", "green", "yellow", "orange", "red"),
  #                  breaks = c( "0", "1.50e2", "1.50e2", "3.26e6", "4.85e8" ),
  #                  name = "Total Damage Amount($)\nfor Geophysical Hazards")+ 
  labs(title = "")+
  theme(legend.position = c( 0.12, 0.15 )  ) +
  theme( legend.title = element_text(size=10, face = "bold"), #change legend title font size
         legend.text = element_text(size= 10)) 
# guides(fill = guide_legend( nrow = 1))

dev.off()



#############################1#############################################
#############################1#############################################

dffips <- st_read( "~/exported_data/hazard_shp/states_sheldus_Climatological.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#############################1#############################################
#############################1#############################################
png("~/exported_data/results/Climatological_damage.png", width = 10, height = 7, units = 'in', res = 300)
ggplot()+
  geom_sf(data = dffips, aes(fill = totalDamag ), lwd = 0.2)+
  scale_fill_viridis( trans = "log", labels = function(x)sprintf("%0.2e",x),
                      name = "Total Damage($)\nfor Climatological Hazards", option = "D") +
  #scale_y_continuous( trans = "log", labels = scales::percent,  ) +
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  #scale_fill_manual(values = c( "gray", "green", "yellow", "orange", "red"),
  #                  breaks = c( "0", "1.50e2", "1.50e2", "3.26e6", "4.85e8" ),
  #                  name = "Total Damage Amount($)\nfor Geophysical Hazards")+ 
  labs(title = "")+
  theme(legend.position = c( 0.12, 0.15 )  ) +
  theme( legend.title = element_text(size=10, face = "bold"), #change legend title font size
         legend.text = element_text(size= 10)) 
# guides(fill = guide_legend( nrow = 1))
dev.off()


##############################2############################################

png("~/exported_data/results/Climatological_assist.png", width = 10, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = totalAssis ), lwd = 0.2)+
  scale_fill_viridis( trans = "log", labels = function(x)sprintf("%0.2e",x),
                      name = "Total Assistance($)\nfor Climatological Hazards", option = "D") +
   #scale_y_continuous( trans = "log", labels = scales::percent,  ) +
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  #scale_fill_manual(values = c( "gray", "green", "yellow", "orange", "red"),
  #                  breaks = c( "0", "1.50e2", "1.50e2", "3.26e6", "4.85e8" ),
  #                  name = "Total Damage Amount($)\nfor Geophysical Hazards")+ 
  labs(title = "")+
  theme(legend.position = c( 0.12, 0.15 )  ) +
  theme( legend.title = element_text(size=10, face = "bold"), #change legend title font size
         legend.text = element_text(size= 10)) 
# guides(fill = guide_legend( nrow = 1))

dev.off()
