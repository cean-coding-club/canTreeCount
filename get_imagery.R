#########################
# Organise spatial data #
#########################

## Clear environment and set up working dir and datestamp
rm(list = ls())
currentDate <- Sys.Date() # Add current date to environment for output of file names with date
options(scipen = 99) #prevent display in scientific notation

## Find and download some local spatial data
# Load useful packages
pkgs <- c("dplyr", "tmap", "tmaptools", "terra", "sf", "GISTools", "ggspatial", "raster")
if (!all(sapply(pkgs, require, character.only = TRUE))) {
  install.packages(pkgs[!sapply(pkgs, require, character.only = TRUE)], dependencies = TRUE)
  invisible(lapply(pkgs, library, character.only = TRUE))
}

## Might need rJava - this seems to be the easiest way to get it working
# if (!requireNamespace("remotes", quietly = TRUE)) {
#   install.packages("remotes")
# }
# remotes::install_github("e-kotov/rJavaEnv")
# rJavaEnv::java_quick_install(version = 21)

# Rectangular polygon that delineates our study area
study_area <- as(extent(c(115.89, 115.9, -32.01, -31.997)), "SpatialPolygons")
crs(study_area) <- CRS("+init=epsg:4326")

# Define an area of interest (aoi)
aoi <- as(extent(c(115.88, 115.91, -32.011, -31.996)), "SpatialPolygons")
crs(aoi) <- CRS("+init=epsg:4326")

# Let's plot the study area and the area of interest together
plot(aoi, border = "blue", lty = 2)
plot(study_area, add = T, lty = 2, border = "red", col = adjustcolor("red", alpha.f = 0.2))
axis(1)
axis(2)

# Download satellite data for the aoi (control resolution of the data using the
# "zoom" argument. The higher the number, the better the resolution but the
# longer the download will take)
sat <- read_osm(aoi, type = "bing", zoom = 17)

# Check what we downloaded
class(sat)

# Reproject the data to the correct CRS using the "nearest neighbor" (ngb) method
sat <- rast(sat)

# Visualize the satellite image using R's base plot
plotRGB(sat, r = 1, g = 2, b = 3, axes = F)
plot(study_area, add = T, lty = 2, border = "red", col = adjustcolor("red", alpha.f = 0.2))

# Visualise the raster layer using tmap package
tm_shape(sat) +
  tm_rgb() +
  tm_compass(
    position   = c("left", "bottom"),
    text.color = "white",
    color.dark = "white") +
  tm_scalebar(position = c("right", "bottom"),
              text.color = "white") +
  tm_graticules(lines = F)




