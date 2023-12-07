library(sf)
library(ggplot2)
library(viridis)
library(RColorBrewer)



dffips <- st_read( "~/exported_data/hazard_shp/states_sheldus_Geophysical.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#############################1#############################################
pdf("~/exported_data/results/fig4/r1c2_Geophysical_HMA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor( cdamag1 )), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHMA total amount($)\nfor geophysical hazards")+ 
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

pdf("~/exported_data/results/fig4/r2c2_Geophysical_SBA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nSBA total amount($)\nfor geophysical hazards")+ 
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


pdf("~/exported_data/results/fig4/r4c2_Geophysical_PA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag3)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPA total amount($)\nfor geophysical hazards")+ 
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


pdf("~/exported_data/results/fig4/r3c2_Geophysical_HA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag4)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHA total amount($)\nfor geophysical hazards")+ 
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

pdf("~/exported_data/results/fig4/r5c2_Geophysical_PDM.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPDM total amount($)\nfor geophysical hazards")+ 
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
pdf("~/exported_data/results/fig4/r1c3_Hydrological_HMA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHMA total amount($)\nfor hydrological hazards")+ 
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

pdf("~/exported_data/results/fig4/r2c3_Hydrological_SBA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nSBA total amount($)\nfor hydrological hazards")+ 
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


pdf("~/exported_data/results/fig4/r4c3_Hydrological_PA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag3)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPA total amount($)\nfor hydrological hazards")+ 
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


pdf("~/exported_data/results/fig4/r3c3_Hydrological_HA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag4)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHA total amount($)\nfor hydrological hazards")+ 
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

pdf("~/exported_data/results/fig4/r5c3_Hydrological_PDM.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag5)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPDM total amount($)\nfor hydrological hazards")+ 
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
pdf("~/exported_data/results/fig4/r1c4_Meteorology_HMA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHMA total amount($)\nfor meteorological hazards")+ 
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

pdf("~/exported_data/results/fig4/r2c4_Meteorology_SBA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nSBA total amount($)\nfor meteorological hazards")+ 
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


pdf("~/exported_data/results/fig4/r4c4_Meteorology_PA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag3)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPA total amount($)\nfor meteorological hazards")+ 
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


pdf("~/exported_data/results/fig4/r3c4_Meteorology_HA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag4)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHA total amount($)\nfor meteorological hazards")+ 
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

pdf("~/exported_data/results/fig4/r5c4_Meteorology_PDM.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag5)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPDM total amount($)\nfor meteorological hazards")+ 
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
pdf("~/exported_data/results/fig4/r1c1_Climate_HMA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHMA total amount($)\nfor climatological hazards")+ 
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

pdf("~/exported_data/results/fig4/r2c1_Climate_SBA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nSBA total amount($)\nfor climatological hazards")+ 
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


pdf("~/exported_data/results/fig4/r3c1_Climate_PA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag3)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPA total amount($)\nfor climatological hazards")+ 
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


pdf("~/exported_data/results/fig4/r4c1_Climate_HA.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag4)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHA total amount($)\nfor climatological hazards")+ 
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

pdf("~/exported_data/results/fig4/r5c1_Climate_PDM.pdf", width = 10, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(cdamag5)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "dimgray", "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("6", "4", "3", "2", "1", "0"), 
                    labels= c("Undefined", "High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPDM total amount($)\nfor climatological hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

