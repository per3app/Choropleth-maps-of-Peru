#
rm(list=ls())
cd<-setwd('d:/geomar/modulos/programacion/R/Choroplethr-with-R')

#shape package
library(sp)
library(maptools)

#visualization package
library(ggplot2)

#mapa - regiones del Peru
file<-'d:/geomar/modulos/programacion/R/Choroplethr-with-R/Peru/Regiones'
regional<-'Base Regional.shp'

reg_peru<-paste(file,regional,sep = '/')
regiones<-readShapeSpatial(reg_peru)

regperu<-fortify(regiones,region = 'NOMBDEP',na.rm=TRUE)

#grafico usando la geometria poligono
map<-ggplot(data = regperu,aes(x=long,y=lat,group=group))
peru<-geom_polygon(aes(fill=id))


#mapa de las regiones del peru

map_peru<-map+peru
ggsave('regiones_peru.png',width = 25,height = 15,units = 'cm')

