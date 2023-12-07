library(sf)
library(ggplot2)
library(viridis)
library(RColorBrewer)

dffips <- st_read( "~/exported_data/local_morans/df_localMoran_all.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#############################1#############################################
pdf("~/exported_data/results/fig3/r1c1_damage_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and total\nassistance amount($)\nfor all hazards")+ 
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


pdf("~/exported_data/results/fig3/r3c1_SOVI_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and total\nassistance amount($)\nfor all hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()
##################################################################

dffips <- st_read( "~/exported_data/local_morans/df_localMoran_declared.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

##############################2############################################

pdf("~/exported_data/results/fig3i/r1c1_damage_decl.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and total\nassistance amount($)\nfor declared hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

#################################8#########################################


pdf("~/exported_data/results/fig3i/r3c1_SOVI_decl.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and total\nassistance amount($)\nfor declared hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()
