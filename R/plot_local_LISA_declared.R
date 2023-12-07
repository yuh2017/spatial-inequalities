library(sf)
library(ggplot2)
library(viridis)
library(RColorBrewer)

dffips <- st_read( "~/exported_data/local_morans/fema_projects_localMorans_declared.shp", quiet = TRUE )
head(dffips)
dffips <- st_transform(dffips, crs = 2163)

#############################1#############################################
png("~/exported_data/results/lisa_moran1_decl.png", width = 12, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label1)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", 
                                "lightblue", "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHMA total amount($)\nfor declared hazards")+ 
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

png("~/exported_data/results/lisa_moran2_decl.png", width = 12, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label2)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nSBA total amount($)\nfor declared hazards")+ 
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


png("~/exported_data/results/lisa_moran3_decl.png", width = 12, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label3)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nHA total amount($)\nfor declared hazards")+ 
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


png("~/exported_data/results/lisa_moran4_decl.png", width = 12, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label4)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPA total amount($)\nfor declared hazards")+ 
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

png("~/exported_data/results/lisa_moran5_decl.png", width = 12, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label5)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "Total damage($) and\nPDM total amount($)\nfor declared hazards")+ 
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


png("~/exported_data/results/lisa_moran6_decl.png", width = 12, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label6)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HMA total\namount($) for\ndeclared hazards")+ 
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


png("~/exported_data/results/lisa_moran7_decl.png", width = 12, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label7)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and SBA total\namount($) for\ndeclared hazards")+ 
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


png("~/exported_data/results/lisa_moran8_decl.png", width = 12, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label8)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and HA total\namount($) for\ndeclared hazards")+ 
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


png("~/exported_data/results/lisa_moran9_decl.png", width = 12, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label9)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PA total\namount($) for\ndeclared hazards")+ 
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


png("~/exported_data/results/lisa_moran10_decl.png", width = 12, height = 7, units = 'in', res = 300)

ggplot()+
  geom_sf(data = dffips, aes(fill = factor(label10)), lwd = 0.2)+
  coord_sf(datum = "EPSG:4326") + theme_bw()+
  scale_fill_manual(values = c( "orange", "dodgerblue", "lightblue", 
                                "firebrick3","gainsboro"),
                    breaks= c("4", "3", "2", "1", "0"), 
                    labels= c("High-Low", "Low-Low", "Low-High", "High-High", "Not Significant"),
                    name = "SOVI and PDM total\namount($) for\ndeclared hazards")+ 
  labs(title = "")+
  theme(legend.position = "bottom" ) +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=16, face = "bold"), #change legend title font size
        legend.text = element_text(size= 16)) +
  guides(fill = guide_legend( nrow = 2, byrow = TRUE))

dev.off()