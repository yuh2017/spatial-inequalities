library(sf)
library(ggplot2)
library(viridis)
library(RColorBrewer)

dffips <- st_read( "~/exported_data/local_morans/fema_projects_localMorans_all.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#############################1#############################################
pdf("~/exported_data/results/fig3/r1c2_damage_hma_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHMA total amount($)\nfor all hazards")+ 
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

pdf("~/exported_data/results/fig3/r1c3_damage_sba_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nSBA total amount($)\nfor all hazards")+ 
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


pdf("~/exported_data/results/fig3/r2c1_damage_HA_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label3)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHA total amount($)\nfor all hazards")+ 
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


pdf("~/exported_data/results/fig3/r2c2_damage_pa_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label4)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPA total amount($)\nfor all hazards")+ 
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

pdf("~/exported_data/results/fig3/r2c3_damage_pdm_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label5)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPDM total amount($)\nfor all hazards")+ 
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


pdf("~/exported_data/results/fig3/r3c2_sovi_hma_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label6)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HMA total\namount($) for\nall hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()

#################################7#########################################


pdf("~/exported_data/results/fig3/r3c3_sovi_sba_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label7)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and SBA total\namount($) for\nall hazards")+ 
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


pdf("~/exported_data/results/fig3/r4c1_sovi_ha_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label8)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HA total\namount($) for\nall hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()


#################################9#########################################


pdf("~/exported_data/results/fig3/r4c2_sovi_pa_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label9)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PA total\namount($) for\nall hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()


#################################10#########################################


pdf("~/exported_data/results/fig3/r4c3_sovi_pdm_all.pdf", width = 12, height = 7)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label10)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PDM total\namount($) for\nall hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()
