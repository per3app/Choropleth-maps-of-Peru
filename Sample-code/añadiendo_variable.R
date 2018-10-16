#
rm(list=ls())
cd<-setwd('d:/geomar/modulos/programacion/R/Choroplethr-with-R')

#shape package
library(rgdal)

#visualization package
library(ggplot2)

#mapa - regiones del Peru
file<-'d:/geomar/modulos/programacion/R/Choroplethr-with-R/Peru/Regiones'
shape<-'Base Regional'

regiones<-readOGR(dsn = file,layer = shape,stringsAsFactors = FALSE)
DF_regiones<-fortify(regiones,region = 'NOMBDEP')

#importando data de muestra
pob_muestra<-read.csv('poblacion.csv',header = TRUE)

#preparando data para cloropletas
map<-ggplot(data = DF_regiones,aes(x=long,y=lat,group=group))+geom_path()

#al visualizar la pob. de muestra
#observamos que los nombres de columnas no coinciden
#por ende los cambiamos para aplicar 'merge'
names(pob_muestra)<-c('id','pob')

#despues de cambiar los nombres, unimos ambas DF
DF_regiones<-merge(DF_regiones,pob_muestra,by='id')

#visualización
map+geom_polygon(aes(fill=pob))

#visualización con + detalles
map+geom_polygon(aes(fill=pob),color='gray',size=0.1)

#visualización con cambio en la escala del gradiente
pol<-geom_polygon(aes(fill=pob),color='gray',size=0.1)
grad<-scale_fill_gradient(high = '#e34a33',low = '#fee8c8',guide = 'colorbar')
map+pol+grad

#theme_light : fondo blanco y en grilla
#theme_void : libre de ejes

#removiendo eje X e y
rx<-theme(axis.title.x = element_blank(),axis.ticks.x = element_blank(),axis.text.x = element_blank())
ry<-theme(axis.title.x = element_blank(),axis.ticks.y = element_blank(),axis.text.y = element_blank())

#visualización con traslacion de la leyenda
posleg<-theme(legend.justification = c(0,0),legend.position = c(0,0))
