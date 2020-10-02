#Sites to manually download images
# https://earthexplorer.usgs.gov/
# https://scihub.copernicus.eu/dhus/#/home

#API from copernicus and USGS
# https://github.com/16EAGLE/getSpatialData

#command line to download the getSpatialData library 
devtools::install_github("16EAGLE/getSpatialData")

#command line to download the other required libraries
install.packages("sf")
install.packages("raster")
install.packages("rgdal")
install.packages("stringr")
install.packages("maptools")
install.packages("maps")

#Required Libraries 
library(sf)
library(raster)
library(rgdal)
library(getSpatialData)
library(stringr)
library(maptools)
library(maps)




#The way of Sign in USGS and Copernicus database
login_USGS("YourUsername")
login_CopHub("YourUsername")

#But you can also assign your user and password to a variable like that
user <- c("YourUsername");user
password <- c("YourPassword");password
login_CopHub(user, password)
login_USGS(user, password)



#Define the area of the study field

set_aoi() #Calling the API and the map editor

## loading and seting the geometry

Bound <- read_sf('d:/Users/Admin/Desktop/Filepathtoyourbound/filename.shp');Bound
Bound = st_as_sf(Bound);Bound
# define to the AOI your boundary geometry
set_aoi(st_geometry(Bound))
view_aoi() #abre o AOI no viewer

#set the folder that you want to save the files
set_archive("d:/Users/Admin/Desktop/FilePathToStoreTheData")

## The getSentinel_query will research looking for the images available
##on the AOI, that fits in your parameters.

#looking for sentinel 1 and sentinel 2 data, with date range filter active.
records2 = getSentinel_query(time_range = c("2006-01-01", "2019-08-31"), 
                             platform = "Sentinel-1"); records2
records = getSentinel_query(time_range = c("2006-01-01", "2019-08-31"), 
                            platform = "Sentinel-2");records



#looking for the help menu of this function
?getSentinel_query

## How to filter the data
 colnames(records) #will show us all the atributes that can be used as filter 
 unique(records$cloudcoverpercentage) #will show us the values from this specific parameter, but without duplicated values.

 


#A example of how filter your dataframe for cloud covering for those who want to go a bit further

# creating a empty dataframe to store new data
 recordes_flt <- data.frame()
#requesting the number of columns of the dataframe from copernicus data frame 
 ncol(records)

# naming the columns by numbers  
 colnames(records) <- 1:43
# running the loop, setting the cloudn cover percentage as 0
 for (i in 1:nrow(records)) {
   texto <- records[i,43]
   
     recordes_flt <- rbind(recordes_flt,records[i,]) 
   }
   print(i)
records_filtered = recordes_flt[as.numeric(recordes_flt$cloudcoverpercentage) == 0, ];records_filtered
## initial results
View(records)

## filtered results
View(records_filtered)
# returning the right names to the columns
colnames(records_filtered) <- c("title","url","url.alt","url.icon","summary","beginposition","endposition","ingestiondate","orbitnumber","relativeorbitnumber","cloudcoverpercentage","highprobacloudspercentage","mediumprobacloudspercentage","snowicepercentage","vegetationpercentage","waterpercentage","notvegetatedpercentage","unclassifiedpercentage","gmlfootprint","format","instrumentshortname","instrumentname","footprint","s2datatakeid","platformidentifier","orbitdirection","platformserialidentifier","processingbaseline","processinglevel","producttype","platformname","size","filename","level1cpdiidentifier","identifier","uuid","datatakesensingstart","sensoroperationalmode","tileid","hv_order_tileid","granuleidentifier","datastripidentifier","gnss" )
#the final results with correct names
View(records_filtered)



#I created that lines 'cause sometimes our download just stops out of nowhere
#So with that we will be able to update our Request of images and restart from where we have stopped

#assing our dataframe to a new variable
records_filtered <- records2;records_filtered

#searching for the images that we successfully downloaded
adquirido <- list.files("G:/Meu Drive/OSU/SENTINEL_CHICKASHA/get_data/Sentinel-2", full.names = F);adquirido

#Deleting the ".zip" character extension in order to run the next command line correctly
adquirido <- gsub(".zip","",adquirido);adquirido

#filtering the data that are different in the first image request from those who you already successfully downloaded
records_filtered<-records_filtered[!(records_filtered$title %in% adquirido), ];records_filtered

#--------------------------------------------------------------------------------------------------------------------------#

## Download the dataset for the filepath set in set_archive
datasets <- getSentinel_data(records_filtered)
datasets <- getSentinel_data(records)
datasets <- getSentinel_data(records2)
