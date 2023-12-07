library(GWmodel)
library(spdep)
library(rgdal)
library(spdep)
library(raster)
library(lmtest)
library(tigris)
library(reshape2)
library(tidyr)
library(sf)


sf::st_read('~/exported_data/exported_data/social_df0.shp') -> dffips0

sf::st_crs(dffips0) <- 4326;
dffips0 <- st_transform(dffips0, crs = 2163)



#################################################################################




#Input Data
datagtwr = read.csv( "~/exported_data/exported_data/social_df0.csv" ) 
head(datagtwr)
#Spatial Exploration
indo <-readOGR(dsn='~/exported_data/exported_data',
               layer='county_boundary')


datagtwr.sort <- datagtwr
datagtwr.sort <- datagtwr.sort[order(datagtwr.sort$Year),]


#datagtwr_melt <- melt( datagtwr, id.vars=c("STCOFIPS", "fips", "logPOP", "logBUIVAL", 
#                    "SOVI_SCORE", "logDamage", "logAssist", "logHMAA", "logPAA", 
#                    "logPDMA", "logHAA", "logSBAA" ))


jawa <- geo_join(spatial_data= indo, 
                 data_frame= datagtwr.sort %>% sf::as_Spatial(), 
                 by_sp="fips", 
                 by_df="fips", how = "inner")


jawa$Year2001<- datagtwr.sort[1:3108, 11]
jawa$Year2002<- datagtwr.sort[3109:6216, 11]
jawa$Year2003<- datagtwr.sort[6217:9324, 11]
jawa$Year2004<- datagtwr.sort[9325:12432, 11]
jawa$Year2005<- datagtwr.sort[12433:15540, 11]

jawa$Year2006<- datagtwr.sort[15541:18648, 11]
jawa$Year2007<- datagtwr.sort[18649:21756, 11]
jawa$Year2008<- datagtwr.sort[21757:24864, 11]
jawa$Year2009<- datagtwr.sort[24865:27972, 11]

jawa$Year2010<- datagtwr.sort [27973:31080, 11]
jawa$Year2011<- datagtwr.sort[31081:34188, 11]
jawa$Year2012<- datagtwr.sort[34189:37296, 11]
jawa$Year2013<- datagtwr.sort[37297:40404, 11]

jawa$Year2014<- datagtwr.sort[40405:43512, 11]
jawa$Year2015<- datagtwr.sort[43513:46620, 11]
jawa$Year2016<- datagtwr.sort[46621:49728, 11]
jawa$Year2017<- datagtwr.sort[49729:52836, 11]

jawa$Year2018<- datagtwr.sort[52837:55944, 11]
jawa$Year2019<- datagtwr.sort[55945:59052, 11]
jawa$Year2020<- datagtwr.sort[59053:62160, 11]
jawa$Year2021<- datagtwr.sort[62161:65268, 11]


#png("~/exported_data/results/plotoutputs.png", width = 5, height = 15, units = 'in', res = 300)
#colfunc<-colorRampPalette(c("#379237","green","yellow","orange","red"))
#color<-colfunc(5)
#spplot(jawa,c("Year2018","Year2019","Year2020"), layout = c(1,3),
#       as.table = TRUE,col.regions=color,cuts=4)
#dev.off()



#uji asumsi keragaman spasial
reg=lm( logAssist ~ logPOP + logBUIVAL + logDamage + SOVI_SCORE ,data=datagtwr)
summary(reg)
bptest(reg)


#Transformation to spasial data
data.sp.gtwr = jawa
coordinates(jawa) = 10:11 #lat long
class(data.sp.gtwr)
head(data.sp.gtwr)

################################################################################

USDM <- gw.dist( coordinates( dffips0 %>% sf::as_Spatial() )  )

#Bandwidth
band.gtwr = GWmodel::bw.gtwr( logAssist ~ logPOP + logBUILDVA + logDamage  , 
                   data = dffips0 %>% sf::as_Spatial(),
                   obs.tv = dffips0$YearClass,
                   approach = 'AICc', kernel = 'gaussian', longlat = F, 
                   adaptive = T, st.dMat = USDM )



#Estimation Model
model2=gtwr(logAssist ~ logPOP + logBUILDVA + logDamage  , 
            data = dffips0 %>% sf::as_Spatial(),
            obs.tv = dffips0$YearClass,
            st.bw = band.gtwr, kernel="gaussian", longlat = F, 
            adaptive = T, st.dMat = USDM)
model2
model2$SDF


