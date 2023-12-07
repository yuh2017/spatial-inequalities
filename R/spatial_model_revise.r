
library(tseries)   # For timeseries analysis
library(lmtest) 
library(sf)
library(spdep)
library(GWmodel)
#######################################################################################################################################
sf::st_read('~/exported_data/exported_data/states_sheldus_all.shp') -> dffips
sf::st_crs(dffips) <- 4326;
dffips <- st_transform(dffips, crs = 2163)
# Check data
head(dffips); 
str(dffips);
names(dffips)
# Simple plot to confirm
#plot(dffips['HazardCoun2'], graticule= sf::st_crs(4326), main='Total Hazard Count', breaks="jenks", axes=TRUE)

#######################################################################################################################################
##########GWR model################################################################################################################
library(GWmodel)

#dffips $ SBALoan  <- dffips $ApprovLoan  + dffips $ApprovLo_1
#dffips $ HAtotal  <- dffips $HAOAproved  + dffips $HARAproved
dffips $ totassist  <- dffips $HMAprojAmo  + dffips $PAprojectA + dffips $PDMprojAmo + dffips $HAtotal + dffips $SBAapprove
dffips $ totdamage  <- dffips $CropDmg  + dffips $PropertyDm 

dffips[ , c("HMAprojAmo", "PropertyDm", 
            "PAprojectA", "PDMprojAmo", 
            "HAtotal",
            "SBAapprove",  "totassist")]

deter_signigicance <- function(x, y){ 
  a <-x*y / abs(x*y) 
  b <- ifelse( a < 0, 0.5, 1 )
  return(b)
  }
scale_values <- function(x){(x-min(x))/(max(x) - min(x))}

dffips$HazardCoun2 <- scale_values( dffips$HazardCoun )
dffips$HMAprojAmo <- log( dffips$HMAprojAmo + 1)  
dffips$CropDmg    <- log( dffips$CropDmg + 1) 

dffips$totdamage2 <- log( dffips$totdamage + 1) 
dffips$SOVI_SCORE <- scale_values( dffips$SOVI_SCORE )
dffips$DamageSOVI <- dffips$SOVI_SCORE 

dffips$PropertyDm <- log( dffips$PropertyDm + 1) 
dffips$PAprojectA <- log( dffips$PAprojectA + 1) 
dffips$POPULATION <- scale_values(  dffips$POPULATION  ) 
dffips$BUILDVALUE <- log( dffips$BUILDVALUE + 1) 
dffips$AGRIVALUE  <- log( dffips$AGRIVALUE + 1) 

dffips$PDMprojAmo <- log( dffips$PDMprojAmo + 1) 
dffips$SBALoan    <- log( dffips$SBAapprove + 1) 
dffips$HAtotal    <- log( dffips$HAtotal + 1) 
dffips$totassist2 <- log( dffips$totassist + 1) 

#dffipsNoNA <- dffips %>% tidyr::drop_na()
# Estimate an optimal bandwidth
#######################################################################################################################################

# Create a simple linear regression on unemployed population
olsRslt1 <- lm(totassist2 ~ POPULATION + BUILDVALUE+ totdamage2 + HazardCoun2 + SOVI_SCORE,
              data = dffips )
summary(olsRslt1)
####################

bwVal0 <- GWmodel::bw.gwr(totassist2 ~ POPULATION + BUILDVALUE+ totdamage2 + HazardCoun2 + DamageSOVI ,
                          data = dffips %>% sf::as_Spatial(), 
                          approach = 'AICc', kernel = 'exponential', 
                          adaptive = TRUE, p = 1, 
                          parallel.method = "omp",
                          parallel.arg = 30)



# Perform a basic GWR
gwr.res0 <- gwr.basic(totassist2 ~ POPULATION + BUILDVALUE+ totdamage2 + HazardCoun2 + DamageSOVI,
                        data = dffips %>% sf::as_Spatial(),  
                        bw = bwVal0, kernel = "exponential", 
                        adaptive = TRUE, p = 1, 
                        parallel.method = "omp",
                        parallel.arg = 30) 
# Show the results

#######################################################################################################################################

# The gwr.res$SDF is a Spatial*DataFrame that contain all the coefficients estimated 
# at each sptial feature. We can simply map it out as a sp object
names(gwr.res0$SDF)


#######################################################################################################################################

dffips$coef <- gwr.res0$SDF$totdamage2
dffips$se <- gwr.res0$SDF$totdamage2_SE

dffips$HCcoef <- gwr.res0$SDF$HazardCoun2
dffips$HCse <- gwr.res0$SDF$HazardCoun2_SE

dffips$DSVcoef <- gwr.res0$SDF$DamageSOVI
dffips$DSVse <- gwr.res0$SDF$DamageSOVI_SE


dffips$lR2 <- gwr.res0$SDF$Local_R2

dffips$resid <- gwr.res0$SDF$residual


write_sf(dffips, '~/exported_data/results/df_hazard_GWRresults.shp')

########

#######################################################################################################################################
png("~/exported_data/results/gwr_re/All_damag_coef3.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips['coef'], graticule= sf::st_crs(4326), 
     main='Coefficients for Total Damage(TD) in All Disasters', 
     #lwd = dffips$sig,
     breaks="jenks", axes=TRUE)
dev.off()


png("~/exported_data/results/gwr_re/All_residual.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips['resid'], graticule= sf::st_crs(4326), 
     main='Model Residual in All Disasters', 
     #lwd = dffips$sig2,
     breaks="jenks", axes=TRUE)
dev.off()


png("~/exported_data/results/gwr_re/All_SVI_coef3.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips['DSVcoef'], graticule= sf::st_crs(4326), 
     main='Coefficients for Social Vulnerability(SOVI) in All Disasters', 
     #lwd = dffips$sig3,
     breaks="jenks", axes=TRUE)
dev.off()


png("~/exported_data/results/gwr_re/All_R3.png", width = 11, height = 6, units = 'in', res = 300)
plot(dffips['lR2'], graticule= sf::st_crs(4326), 
     main= 'Local R'^{2}~'for All Disasters', 
     breaks="jenks", axes=TRUE)
dev.off()


#######################################################################################################################################
#######################################################################################################################################

