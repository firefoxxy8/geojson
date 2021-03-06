% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as.geojson.R, R/sp_to_geojson.R
\docType{methods}
\name{as.geojson}
\alias{as.geojson}
\alias{as.geojson,json-method}
\alias{as.geojson,geojson-method}
\alias{as.geojson,character-method}
\alias{as.geojson,SpatialPointsDataFrame-method}
\alias{as.geojson,SpatialPoints-method}
\alias{as.geojson,SpatialLinesDataFrame-method}
\alias{as.geojson,SpatialLines-method}
\alias{as.geojson,SpatialPolygonsDataFrame-method}
\alias{as.geojson,SpatialPolygons-method}
\title{Geojson class}
\usage{
as.geojson(x)

\S4method{as.geojson}{json}(x)

\S4method{as.geojson}{geojson}(x)

\S4method{as.geojson}{character}(x)

\S4method{as.geojson}{SpatialPointsDataFrame}(x)

\S4method{as.geojson}{SpatialPoints}(x)

\S4method{as.geojson}{SpatialLinesDataFrame}(x)

\S4method{as.geojson}{SpatialLines}(x)

\S4method{as.geojson}{SpatialPolygonsDataFrame}(x)

\S4method{as.geojson}{SpatialPolygons}(x)
}
\arguments{
\item{x}{input, an object of class character, json, SpatialPoints,
SpatialPointsDataFrame, SpatialLines, SpatialLinesDataFrame,
SpatialPolygons, or SpatialPolygonsDataFrame}
}
\value{
an object of class geojson/json
}
\description{
Geojson class
}
\details{
The \code{print.geojson} method prints the geojson geometry
type, the bounding box, number of features (if applicable), and the
geometries and their lengths
}
\examples{
# character
as.geojson(geojson_data$featurecollection_point)
as.geojson(geojson_data$polygons_average)
as.geojson(geojson_data$polygons_aggregate)
as.geojson(geojson_data$points_count)

# sp classes

## SpatialPoints
library(sp)
x <- c(1,2,3,4,5)
y <- c(3,2,5,1,4)
s <- SpatialPoints(cbind(x,y))
as.geojson(s)

## SpatialPointsDataFrame
s <- SpatialPointsDataFrame(cbind(x,y), mtcars[1:5,])
as.geojson(s)

## SpatialLines
L1 <- Line(cbind(c(1,2,3), c(3,2,2)))
L2 <- Line(cbind(c(1.05,2.05,3.05), c(3.05,2.05,2.05)))
L3 <- Line(cbind(c(1,2,3),c(1,1.5,1)))
Ls1 <- Lines(list(L1), ID = "a")
Ls2 <- Lines(list(L2, L3), ID = "b")
sl1 <- SpatialLines(list(Ls1))
as.geojson(sl1)

## SpatialLinesDataFrame
sl12 <- SpatialLines(list(Ls1, Ls2))
dat <- data.frame(X = c("Blue", "Green"),
                  Y = c("Train", "Plane"),
                  Z = c("Road", "River"), row.names = c("a", "b"))
sldf <- SpatialLinesDataFrame(sl12, dat)
as.geojson(sldf)

## SpatialPolygons
poly1 <- Polygons(list(Polygon(cbind(c(-100,-90,-85,-100),
   c(40,50,45,40)))), "1")
poly2 <- Polygons(list(Polygon(cbind(c(-90,-80,-75,-90),
   c(30,40,35,30)))), "2")
sp_poly <- SpatialPolygons(list(poly1, poly2), 1:2)
as.geojson(sp_poly)

## SpatialPolygonsDataFrame
sp_polydf <- as(sp_poly, "SpatialPolygonsDataFrame")
as.geojson(sp_polydf)

## sf objects
if (requireNamespace('sf')) {
  nc <- sf::st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)
  as.geojson(nc)
}

}
