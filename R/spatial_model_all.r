
library(tseries)   # For timeseries analysis
library(lmtest) 
library(sf)
library(spdep)
library(GWmodel)
#######################################################################################################################################

sf::st_read('~/exported_data/exported_data/states_sheldus_all.shp') -> dffips1
sf::st_crs(dffips1) <- 4326;
dffips1 <- st_transform(dffips1, crs = 2163)

dffips1 $ totassist  <- dffips1 $HMAprojAmo  + dffips1 $PAprojectA + dffips1 $PDMprojAmo + dffips1 $HAtotal + dffips1 $SBAapprove
dffips1 $ totdamage  <- dffips1 $CropDmg  + dffips1 $PropertyDm 
#dffips1 $ HazarCountAll  <- dffips$HazardCoun2

# Check data
head(dffips1); 
str(dffips1);
names(dffips1)

# Simple plot to confirm

#plot(dffips1['DamageSOVI'], graticule= sf::st_crs(4326), main='Total hma Amount', breaks="jenks", axes=TRUE)

#######################################################################################################################################
##########GWR model################################################################################################################
library(GWmodel)

#dffips1 $ SBALoan  <- dffips1 $ApprovLoan  + dffips1 $ApprovLo_1
#dffips1 $ HAtotal  <- dffips1 $HAOAproved  + dffips1 $HARAproved

dffipsx <- dffips1[ , c("POPULATION", "BUILDVALUE", "AGRIVALUE",  "SOVI_SCORE",
            "HazardCoun", "HMAprojAmo", "CropDmg", "PropertyDm", 
            "PAprojectA", "POPULATION", 
            "BUILDVALUE",  "AGRIVALUE", 
            "PDMprojAmo", "HAtotal",
            "SBAapprove",  "totassist")]


deter_signigicance  <- function(x, y){ x*y / abs(x*y) }
scale_values        <- function(x){(x-min(x))/(max(x) - min(x))}

#dffips1$CropDmg     <- log( dffips1$CropDmg + 1) 
dffips1$totdamage2  <- log( dffips1$totdamage + 1) 
dffips1$HazardCoun2 <- scale_values( dffips1$HazardCoun )


dffips1$SOVI_SCORE2  <- scale_values(dffips1$SOVI_SCORE )

dffips1$SOVI2  <- dffips1$SOVI_SCORE

#dffips1$DamageSOVI <- log( dffips1$totdamage2*dffips1$SOVI_SCORE + 1)
dffips1$POPULATION2  <- scale_values(  dffips1$POPULATION  )
dffips1$BUILDVALUE2  <- log( dffips1$BUILDVALUE + 1) 
dffips1$AGRIVALUE2   <- log( dffips1$AGRIVALUE + 1) 

dffips1$totassist2    <- log( dffips1$totassist + 1) 

#dffips1NoNA <- dffips1 %>% tidyr::drop_na()
# Estimate an optimal bandwidth
#######################################################################################################################################

# Create a simple linear regression on unemployed population
olsRslt <- lm(totassist2 ~ POPULATION2 + BUILDVALUE2+ totdamage2  + HazardCoun2 + SOVI2,
              data = dffips1 )
summary(olsRslt)
#######################################################################################################################################

bwVal1 <- GWmodel::bw.gwr(totassist2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + SOVI2 ,
                          data = dffips1 %>% sf::as_Spatial(), 
                          approach = 'AICc', kernel = 'exponential', 
                          adaptive = TRUE, p = 1, 
                          parallel.method = "omp",
                          parallel.arg = 30)



# Perform a basic GWR
gwr.res1 <- gwr.basic( totassist2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + SOVI2 ,
                        data = dffips1 %>% sf::as_Spatial(),  
                        bw = bwVal1, kernel = "exponential", 
                        adaptive = TRUE, p = 1, 
                        parallel.method = "omp",
                        parallel.arg = 30) 
# Show the results

#######################################################################################################################################

# The gwr.res$SDF is a Spatial*DataFrame that contain all the coefficients estimated 
# at each sptial feature. We can simply map it out as a sp object
names(gwr.res1$SDF)

#######################################################################################################################################
######################################
dffips1$coef <- gwr.res1$SDF$totdamage2
dffips1$HCcoef <- gwr.res1$SDF$HazardCoun2
dffips1$DSVcoef <- gwr.res1$SDF$SOVI2
dffips1$lR2 <- gwr.res1$SDF$Local_R2
dffips1$resid <- gwr.res1$SDF$residual



#write_sf(dffips1, '~/exported_data/results/gwr_re/df_declared_GWRresults.shp')

#######################################################################################################################################

#######################################################################################################################################
png("~/exported_data/results/gwr_re/All/all_damag_coef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['coef'], graticule= sf::st_crs(4326), main='Total Damage Coefficients for All Assistance Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/residual_all.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['resid'], graticule= sf::st_crs(4326), main='Model Residual for All Assistance Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()


png("~/exported_data/results/gwr_re/All/all_SVI_coef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['DSVcoef'], graticule= sf::st_crs(4326), main='SOVI Coefficients for All Assistance Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/all_R2.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['lR2'], graticule= sf::st_crs(4326), 
     main= expression( 'Local R'^{2}~' for All Assistance Across All Disasters' ), 
     breaks="jenks", axes=TRUE)
dev.off()
#################################################################################################
#################################################################################################
dffips1 $ totassisthma  <- dffips1 $HMAprojAmo
dffips1 $ totdamage  <- dffips1 $CropDmg  + dffips1 $PropertyDm 

dffipsx <- dffips1[ , c("POPULATION", "BUILDVALUE", "AGRIVALUE",  "SOVI_SCORE",
                        "HazardCoun", "HMAprojAmo", "CropDmg", "PropertyDm", 
                        "PAprojectA", "POPULATION", 
                        "BUILDVALUE",  "AGRIVALUE", 
                        "PDMprojAmo", "HAtotal",
                        "SBAapprove",  "totassist")]


deter_signigicance  <- function(x, y){ x*y / abs(x*y) }
scale_values        <- function(x){(x-min(x))/(max(x) - min(x))}

dffips1$totassisthma2  <- log( dffips1$totassisthma + 1) 
dffips1$HazardCoun2 <- scale_values( dffips1$HazardCoun )


dffips1$SOVI_SCORE  <- scale_values(dffips1$SOVI_SCORE )

dffips1$SOVIhma  <- dffips1$SOVI_SCORE

#dffips1$DamageSOVI <- log( dffips1$totdamage2*dffips1$SOVI_SCORE + 1)
dffips1$POPULATION2  <- scale_values(  dffips1$POPULATION  )
dffips1$BUILDVALUE2  <- log( dffips1$BUILDVALUE + 1) 
dffips1$AGRIVALUE2   <- log( dffips1$AGRIVALUE + 1) 


#dffips1NoNA <- dffips1 %>% tidyr::drop_na()
# Estimate an optimal bandwidth
#######################################################################################################################################

# Create a simple linear regression on unemployed population
olsRslt <- lm(totassisthma2 ~ POPULATION2 + BUILDVALUE2 + totdamage2  + HazardCoun2 + SOVIhma,
              data = dffips1 )
summary(olsRslt)
#######################################################################################################################################

bwVal1 <- GWmodel::bw.gwr( totassisthma2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + SOVIhma ,
                          data = dffips1 %>% sf::as_Spatial(), 
                          approach = 'AICc', kernel = 'exponential', 
                          adaptive = TRUE, p = 1, 
                          parallel.method = "omp",
                          parallel.arg = 30)



# Perform a basic GWR
gwr.res2 <- gwr.basic( totassisthma2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + SOVIhma ,
                      data = dffips1 %>% sf::as_Spatial(),  
                      bw = bwVal1, kernel = "exponential", 
                      adaptive = TRUE, p = 1, 
                      parallel.method = "omp",
                      parallel.arg = 30) 
# Show the results

#######################################################################################################################################

# The gwr.res$SDF is a Spatial*DataFrame that contain all the coefficients estimated 
# at each sptial feature. We can simply map it out as a sp object
names(gwr.res2$SDF)

#######################################################################################################################################
######################################
dffips1$coef <- gwr.res2$SDF$totdamage2
dffips1$HCcoef <- gwr.res2$SDF$HazardCoun2
dffips1$DSVcoef <- gwr.res2$SDF$SOVIhma
dffips1$lR2 <- gwr.res2$SDF$Local_R2
dffips1$resid <- gwr.res2$SDF$residual
#write_sf(dffips1, '~/exported_data/results/gwr_re/declared_GWRHMA.shp')

#######################################################################################################################################
#######################################################################################################################################
png("~/exported_data/results/gwr_re/All/all_damag_hmacoef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['coef'], graticule= sf::st_crs(4326), main='Total Damage Coefficients in the HMA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/residualhma_all.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['resid'], graticule= sf::st_crs(4326), main='Model Residual in the HMA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()


png("~/exported_data/results/gwr_re/All/all_SVI_hmacoef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['DSVcoef'], graticule= sf::st_crs(4326), main='SOVI Coefficients in the HMA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/all_hmaR2.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['lR2'], graticule= sf::st_crs(4326), 
     main= expression( 'Local R'^{2}~' in the HMA Scenario Across All Disasters' ), 
     breaks="jenks", axes=TRUE)
dev.off()

#################################################################################################
#################################################################################################

dffips1 $ totassistpa  <- dffips1 $PAprojectA 
dffips1 $ totdamage  <- dffips1 $CropDmg  + dffips1 $PropertyDm 

dffipsx <- dffips1[ , c("POPULATION", "BUILDVALUE", "AGRIVALUE",  "SOVI_SCORE",
                        "HazardCoun", "HMAprojAmo", "CropDmg", "PropertyDm", 
                        "PAprojectA", "POPULATION", 
                        "BUILDVALUE",  "AGRIVALUE", 
                        "PDMprojAmo", "HAtotal",
                        "SBAapprove",  "totassist")]


deter_signigicance  <- function(x, y){ x*y / abs(x*y) }
scale_values        <- function(x){(x-min(x))/(max(x) - min(x))}

dffips1$totdamage2  <- log( dffips1$totdamage + 1) 
dffips1$HazardCoun2 <- scale_values( dffips1$HazardCoun )


dffips1$SOVI_SCORE  <- scale_values(dffips1$SOVI_SCORE )

dffips1$SOVIpa  <- dffips1$SOVI_SCORE

#dffips1$DamageSOVI <- log( dffips1$totdamage2*dffips1$SOVI_SCORE + 1)
dffips1$POPULATION2  <- scale_values(  dffips1$POPULATION  )
dffips1$BUILDVALUE2  <- log( dffips1$BUILDVALUE + 1) 
dffips1$AGRIVALUE2   <- log( dffips1$AGRIVALUE + 1) 

dffips1$totassistpa2    <- log( dffips1$totassistpa + 1) 

#dffips1NoNA <- dffips1 %>% tidyr::drop_na()
# Estimate an optimal bandwidth
#######################################################################################################################################

# Create a simple linear regression on unemployed population
olsRslt <- lm(totassistpa2 ~ POPULATION2 + BUILDVALUE2 + totdamage2  + HazardCoun2 + SOVIpa,
              data = dffips1 )
summary(olsRslt)
#######################################################################################################################################

bwVal1 <- GWmodel::bw.gwr(totassistpa2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + SOVIpa ,
                          data = dffips1 %>% sf::as_Spatial(), 
                          approach = 'AICc', kernel = 'exponential', 
                          adaptive = TRUE, p = 1, 
                          parallel.method = "omp",
                          parallel.arg = 30)

# Perform a basic GWR
gwr.res3 <- gwr.basic(totassistpa2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + SOVIpa ,
                      data = dffips1 %>% sf::as_Spatial(),  
                      bw = bwVal1, kernel = "exponential", 
                      adaptive = TRUE, p = 1, 
                      parallel.method = "omp",
                      parallel.arg = 30) 
# Show the results

#######################################################################################################################################

# The gwr.res$SDF is a Spatial*DataFrame that contain all the coefficients estimated 
# at each sptial feature. We can simply map it out as a sp object
names(gwr.res1$SDF)

#######################################################################################################################################
######################################
dffips1$coef <- gwr.res3$SDF$totdamage2
dffips1$HCcoef <- gwr.res3$SDF$HazardCoun2
dffips1$DSVcoef <- gwr.res3$SDF$SOVIpa
dffips1$lR2 <- gwr.res3$SDF$Local_R2
dffips1$resid <- gwr.res3$SDF$residual



#write_sf(dffips1, '~/exported_data/results/gwr_re/declared_GWRpa.shp')

#######################################################################################################################################

#######################################################################################################################################
png("~/exported_data/results/gwr_re/All/all_damag_pacoef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['coef'], graticule= sf::st_crs(4326), main='Total Damage Coefficients in the PA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/residualpa_all.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['resid'], graticule= sf::st_crs(4326), main='Model Residual in the PA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()


png("~/exported_data/results/gwr_re/All/all_SVI_pacoef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['DSVcoef'], graticule= sf::st_crs(4326), main='SOVI Coefficients in the PA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/all_paR2.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['lR2'], graticule= sf::st_crs(4326), 
     main= expression( 'Local R'^{2}~' in the PA Scenario Across All Disasters' ), 
     breaks="jenks", axes=TRUE)
dev.off()

#################################################################################################
#################################################################################################

dffips1 $ totassistpdm  <- dffips1 $PDMprojAmo 
dffips1 $ totdamage  <- dffips1 $CropDmg  + dffips1 $PropertyDm 

dffipsx <- dffips1[ , c("POPULATION", "BUILDVALUE", "AGRIVALUE",  "SOVI_SCORE",
                        "HazardCoun", "HMAprojAmo", "CropDmg", "PropertyDm", 
                        "PAprojectA", "POPULATION", 
                        "BUILDVALUE",  "AGRIVALUE", 
                        "PDMprojAmo", "HAtotal",
                        "SBAapprove",  "totassist")]


deter_signigicance  <- function(x, y){ x*y / abs(x*y) }
scale_values        <- function(x){(x-min(x))/(max(x) - min(x))}

dffips1$CropDmg     <- log( dffips1$CropDmg + 1) 
dffips1$totdamage2  <- log( dffips1$totdamage + 1) 
dffips1$HazardCoun2 <- scale_values( dffips1$HazardCoun )


dffips1$SOVI_SCORE  <- scale_values(dffips1$SOVI_SCORE )

dffips1$SOVIpdm  <- dffips1$SOVI_SCORE

#dffips1$DamageSOVI <- log( dffips1$totdamage2*dffips1$SOVI_SCORE + 1)
dffips1$POPULATION2  <- scale_values(  dffips1$POPULATION  )
dffips1$BUILDVALUE2  <- log( dffips1$BUILDVALUE + 1) 
dffips1$AGRIVALUE2   <- log( dffips1$AGRIVALUE + 1) 
dffips1$totassistpdm2    <- log( dffips1$totassistpdm + 1) 

#dffips1NoNA <- dffips1 %>% tidyr::drop_na()
# Estimate an optimal bandwidth
#######################################################################################################################################

# Create a simple linear regression on unemployed population
olsRslt <- lm(totassistpdm2 ~ POPULATION2 + BUILDVALUE2 + totdamage2  + HazardCoun2 + SOVIpdm,
              data = dffips1 )
summary(olsRslt)
#######################################################################################################################################

bwVal1 <- GWmodel::bw.gwr(totassistpdm2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + SOVIpdm ,
                          data = dffips1 %>% sf::as_Spatial(), 
                          approach = 'AICc', kernel = 'exponential', 
                          adaptive = TRUE, p = 1, 
                          parallel.method = "omp",
                          parallel.arg = 30)



# Perform a basic GWR
gwr.res4 <- gwr.basic(totassistpdm2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + SOVIpdm ,
                      data = dffips1 %>% sf::as_Spatial(),  
                      bw = bwVal1, kernel = "exponential", 
                      adaptive = TRUE, p = 1, 
                      parallel.method = "omp",
                      parallel.arg = 30) 
# Show the results

#######################################################################################################################################

# The gwr.res$SDF is a Spatial*DataFrame that contain all the coefficients estimated 
# at each sptial feature. We can simply map it out as a sp object
names(gwr.res4$SDF)

#######################################################################################################################################
######################################
dffips1$coef <- gwr.res4$SDF$totdamage2
dffips1$HCcoef <- gwr.res4$SDF$HazardCoun2
dffips1$DSVcoef <- gwr.res4$SDF$SOVIpdm
dffips1$lR2 <- gwr.res4$SDF$Local_R2
dffips1$resid <- gwr.res4$SDF$residual



#write_sf(dffips1, '~/exported_data/results/gwr_re/declared_GWRpdm.shp')

#######################################################################################################################################

#######################################################################################################################################
png("~/exported_data/results/gwr_re/All/all_damag_pdmcoef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['coef'], graticule= sf::st_crs(4326), main='Total Damage Coefficients in the PDM Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/residualpdm_all.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['resid'], graticule= sf::st_crs(4326), main='Model Residual in the PDM Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()


png("~/exported_data/results/gwr_re/All/all_SVI_pdmcoef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['DSVcoef'], graticule= sf::st_crs(4326), main='SOVI Coefficients in the PDM Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/all_pdmR2.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['lR2'], graticule= sf::st_crs(4326), 
     main= expression( 'Local R'^{2}~' in the PDM Scenario Across All Disasters' ), 
     breaks="jenks", axes=TRUE)
dev.off()

#################################################################################################
#################################################################################################

dffips1 $ totassistha  <- dffips1 $HAtotal
dffips1 $ totdamage  <- dffips1 $CropDmg  + dffips1 $PropertyDm 

dffipsx <- dffips1[ , c("POPULATION", "BUILDVALUE", "AGRIVALUE",  "SOVI_SCORE",
                        "HazardCoun", "HMAprojAmo", "CropDmg", "PropertyDm", 
                        "PAprojectA", "POPULATION", 
                        "BUILDVALUE",  "AGRIVALUE", 
                        "PDMprojAmo", "HAtotal",
                        "SBAapprove",  "totassist")]


deter_signigicance  <- function(x, y){ x*y / abs(x*y) }
scale_values        <- function(x){(x-min(x))/(max(x) - min(x))}

dffips1$CropDmg     <- log( dffips1$CropDmg + 1) 
dffips1$totdamage2  <- log( dffips1$totdamage + 1) 
dffips1$HazardCoun2 <- scale_values( dffips1$HazardCoun )


dffips1$SOVI_SCORE  <- scale_values(dffips1$SOVI_SCORE )

dffips1$DamageSOVI  <- dffips1$SOVI_SCORE

#dffips1$DamageSOVI <- log( dffips1$totdamage2*dffips1$SOVI_SCORE + 1)
dffips1$POPULATION2  <- scale_values(  dffips1$POPULATION  )
dffips1$BUILDVALUE2  <- log( dffips1$BUILDVALUE + 1) 
dffips1$AGRIVALUE2   <- log( dffips1$AGRIVALUE + 1) 

dffips1$totassistha2    <- log( dffips1$totassistha + 1) 

#dffips1NoNA <- dffips1 %>% tidyr::drop_na()
# Estimate an optimal bandwidth
#######################################################################################################################################

# Create a simple linear regression on unemployed population
olsRslt <- lm(totassistha2 ~ POPULATION2 + BUILDVALUE2 + totdamage2  + HazardCoun2 + DamageSOVI,
              data = dffips1 )
summary(olsRslt)
#######################################################################################################################################

bwVal1 <- GWmodel::bw.gwr(totassistha2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + DamageSOVI ,
                          data = dffips1 %>% sf::as_Spatial(), 
                          approach = 'AICc', kernel = 'exponential', 
                          adaptive = TRUE, p = 1, 
                          parallel.method = "omp",
                          parallel.arg = 30)



# Perform a basic GWR
gwr.res5 <- gwr.basic(totassistha2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + DamageSOVI ,
                      data = dffips1 %>% sf::as_Spatial(),  
                      bw = bwVal1, kernel = "exponential", 
                      adaptive = TRUE, p = 1, 
                      parallel.method = "omp",
                      parallel.arg = 30) 
# Show the results

#######################################################################################################################################

# The gwr.res$SDF is a Spatial*DataFrame that contain all the coefficients estimated 
# at each sptial feature. We can simply map it out as a sp object
names(gwr.res5$SDF)

#######################################################################################################################################
######################################
dffips1$coef <- gwr.res5$SDF$totdamage2
dffips1$HCcoef <- gwr.res5$SDF$HazardCoun2
dffips1$DSVcoef <- gwr.res5$SDF$DamageSOVI
dffips1$lR2 <- gwr.res5$SDF$Local_R2
dffips1$resid <- gwr.res5$SDF$residual



#write_sf(dffips1, '~/exported_data/results/gwr_re/declared_GWRha.shp')

#######################################################################################################################################

#######################################################################################################################################
png("~/exported_data/results/gwr_re/All/all_damag_hacoef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['coef'], graticule= sf::st_crs(4326), 
     main='Total Damage Coefficients in the HA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/residualha_all.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['resid'], graticule= sf::st_crs(4326), 
     main='Model Residual in the HA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()


png("~/exported_data/results/gwr_re/All/all_SVI_hacoef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['DSVcoef'], graticule= sf::st_crs(4326), 
     main='SOVI Coefficients in the HA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/all_haR2.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['lR2'], graticule= sf::st_crs(4326), 
     main= expression( 'Local R'^{2}~' in the HA Scenario Across All Disasters' ), 
     breaks="jenks", axes=TRUE)
dev.off()

#################################################################################################
#################################################################################################

dffips1 $ totassistsba  <- dffips1 $SBAapprove
dffips1 $ totdamage  <- dffips1 $CropDmg  + dffips1 $PropertyDm 

dffipsx <- dffips1[ , c("POPULATION", "BUILDVALUE", "AGRIVALUE",  "SOVI_SCORE",
                        "HazardCoun", "HMAprojAmo", "CropDmg", "PropertyDm", 
                        "PAprojectA", "POPULATION", 
                        "BUILDVALUE",  "AGRIVALUE", 
                        "PDMprojAmo", "HAtotal",
                        "SBAapprove",  "totassist")]


deter_signigicance  <- function(x, y){ x*y / abs(x*y) }
scale_values        <- function(x){(x-min(x))/(max(x) - min(x))}

dffips1$CropDmg     <- log( dffips1$CropDmg + 1) 
dffips1$totdamage2  <- log( dffips1$totdamage + 1) 
dffips1$HazardCoun2 <- scale_values( dffips1$HazardCoun )


dffips1$SOVI_SCORE  <- scale_values(dffips1$SOVI_SCORE )

dffips1$DamageSOVI  <- dffips1$SOVI_SCORE

#dffips1$DamageSOVI <- log( dffips1$totdamage2*dffips1$SOVI_SCORE + 1)
dffips1$POPULATION2  <- scale_values(  dffips1$POPULATION  )
dffips1$BUILDVALUE2  <- log( dffips1$BUILDVALUE + 1) 
dffips1$AGRIVALUE2   <- log( dffips1$AGRIVALUE + 1) 

dffips1$totassistsba2    <- log( dffips1$totassistsba + 1) 

#dffips1NoNA <- dffips1 %>% tidyr::drop_na()
# Estimate an optimal bandwidth
#######################################################################################################################################

# Create a simple linear regression on unemployed population
olsRslt <- lm(totassistsba2 ~ POPULATION2 + BUILDVALUE2 + totdamage2  + HazardCoun2 + DamageSOVI,
              data = dffips1 )
summary(olsRslt)
#######################################################################################################################################

bwVal1 <- GWmodel::bw.gwr(totassistsba2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + DamageSOVI ,
                          data = dffips1 %>% sf::as_Spatial(), 
                          approach = 'AICc', kernel = 'exponential', 
                          adaptive = TRUE, p = 1, 
                          parallel.method = "omp",
                          parallel.arg = 30)



# Perform a basic GWR
gwr.res6 <- gwr.basic(totassistsba2 ~ POPULATION2 + BUILDVALUE2 + totdamage2+ HazardCoun2 + DamageSOVI ,
                      data = dffips1 %>% sf::as_Spatial(),  
                      bw = bwVal1, kernel = "exponential", 
                      adaptive = TRUE, p = 1, 
                      parallel.method = "omp",
                      parallel.arg = 30) 
# Show the results

#######################################################################################################################################

# The gwr.res$SDF is a Spatial*DataFrame that contain all the coefficients estimated 
# at each sptial feature. We can simply map it out as a sp object
names(gwr.res6$SDF)

#######################################################################################################################################
######################################
dffips1$coef <- gwr.res6$SDF$totdamage2
dffips1$HCcoef <- gwr.res6$SDF$HazardCoun2
dffips1$DSVcoef <- gwr.res6$SDF$DamageSOVI
dffips1$lR2 <- gwr.res6$SDF$Local_R2
dffips1$resid <- gwr.res6$SDF$residual
#write_sf(dffips1, '~/exported_data/results/gwr_re/declared_GWRsba.shp')

#######################################################################################################################################

#######################################################################################################################################
png("~/exported_data/results/gwr_re/All/all_damag_sbacoef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['coef'], graticule= sf::st_crs(4326), 
     main='Total Damage Coefficients in the SBA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/residualsba_all.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['resid'], graticule= sf::st_crs(4326), 
     main='Model Residual in the SBA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()


png("~/exported_data/results/gwr_re/All/all_SVI_sbacoef.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['DSVcoef'], graticule= sf::st_crs(4326), 
     main='SOVI Coefficients in the SBA Scenario Across All Disasters', breaks="jenks", axes=TRUE)
dev.off()

png("~/exported_data/results/gwr_re/All/all_sbaR2.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips1['lR2'], graticule= sf::st_crs(4326), 
     main= expression( 'Local R'^{2}~' in the SBA Scenario Across All Disasters' ), 
     breaks="jenks", axes=TRUE)
dev.off()

