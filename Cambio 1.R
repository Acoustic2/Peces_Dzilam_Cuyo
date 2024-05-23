#Base de datos 
#Quarto guide

library(vegan)
library(ggplot2)
library(dplyr)

datos <- read.csv("Peces_Dzilam.csv")

#Realizar un MDS para compocisión de especies de peces 
#MATRIZ DE DISTANCIA 
 
datos_numeros <- datos[6:20]
  
dist_datos <- vegdist(sqrt(datos_numeros), method = "bray")

mds_result <- metaMDS(dist_datos, k = 2)

# plot(mds_result)

mds_points <-as.data.frame(mds_result$points)

mds <- cbind(datos[,1:5], mds_points)

ggplot(mds, aes(x = MDS1, y = MDS2))+
  geom_point(aes(colour = Sitio, shape = Hora, size = Abundancia))+
  theme_bw()

#Análisis de riqueza potencial en ambos sitios 

library(vegan)
library(betapart)


datos_beta <- read.csv("Beta.csv")
data.sp<-Beta_div_art[,2:14]
data.sp<-as.data.frame(data.sp)

beta.m<-beta.multi(data.sp, index.family="jaccard")
beta.c<-betapart.core(data.sp)
beta.multi(beta.c, index.family="jaccard")
beta.m.sor<-beta.multi(data.sp, index.family="sorensen")
beta.c.sor<-betapart.core(data.sp)
beta.multi(beta.c.sor, index.family="sorensen")

