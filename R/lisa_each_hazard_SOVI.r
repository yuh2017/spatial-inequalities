library(sf)
library(ggplot2)
library(viridis)
library(RColorBrewer)



dffips <- st_read( "~/exported_data/hazard_shp/states_sheldus_Geophysical.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#############################1#############################################
pdf("~/exported_data/results/fig5/r1c2_Geophysical_HMA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor( csovi1 )), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HMA total amount($)\nfor geophysical hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()


##############################2############################################

pdf("~/exported_data/results/fig5/r2c2_Geophysical_SBA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and SBA total amount($)\nfor geophysical hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

##############################3############################################


pdf("~/exported_data/results/fig5/r4c2_Geophysical_PA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi3)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PA total amount($)\nfor geophysical hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

################################4##########################################


pdf("~/exported_data/results/fig5/r3c2_Geophysical_HA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi4)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HA total amount($)\nfor geophysical hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()


##################################5########################################

pdf("~/exported_data/results/fig5/r5c2_Geophysical_PDM2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PDM total amount($)\nfor geophysical hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

##################################6########################################

dffips <- st_read( "~/exported_data/hazard_shp/states_sheldus_Hydrological.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#############################1#############################################
pdf("~/exported_data/results/fig5/r1c3_Hydrological_HMA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HMA total amount($)\nfor hydrological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()


##############################2############################################

pdf("~/exported_data/results/fig5/r2c3_Hydrological_SBA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and SBA total amount($)\nfor hydrological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

##############################3############################################


pdf("~/exported_data/results/fig5/r4c3_Hydrological_PA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi3)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PA total amount($)\nfor hydrological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

################################4##########################################


pdf("~/exported_data/results/fig5/r3c3_Hydrological_HA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi4)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HA total amount($)\nfor hydrological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()


##################################5########################################

pdf("~/exported_data/results/fig5/r5c3_Hydrological_PDM2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi5)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PDM total amount($)\nfor hydrological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()



#############################1#############################################






dffips <- st_read( "~/exported_data/hazard_shp/states_sheldus_Meteorological.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#############################1#############################################
pdf("~/exported_data/results/fig5/r1c4_Meteorology_HMA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HMA total amount($)\nfor meteorological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()


##############################2############################################

pdf("~/exported_data/results/fig5/r2c4_Meteorology_SBA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and SBA total amount($)\nfor meteorological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

##############################3############################################


pdf("~/exported_data/results/fig5/r4c4_Meteorology_PA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi3)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PA total amount($)\nfor meteorological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

################################4##########################################


pdf("~/exported_data/results/fig5/r3c4_Meteorology_HA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi4)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HA total amount($)\nfor meteorological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()


##################################5########################################

pdf("~/exported_data/results/fig5/r5c4_Meteorology_PDM2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi5)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PDM total amount($)\nfor meteorological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()



#############################1#############################################
#############################1#############################################

dffips <- st_read( "~/exported_data/hazard_shp/states_sheldus_Climatological.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#############################1#############################################
pdf("~/exported_data/results/fig5/r1c1_Climate_HMA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HMA total amount($)\nfor climatological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()


##############################2############################################

pdf("~/exported_data/results/fig5/r2c1_Climate_SBA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and SBA total amount($)\nfor climatological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

##############################3############################################


pdf("~/exported_data/results/fig5/r4c1_Climate_PA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi3)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PA total amount($)\nfor climatological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

################################4##########################################


pdf("~/exported_data/results/fig5/r3c1_Climate_HA2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi4)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HA total amount($)\nfor climatological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()


##################################5########################################

pdf("~/exported_data/results/fig5/r5c1_Climate_PDM2.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(csovi5)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PDM total amount($)\nfor climatological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

