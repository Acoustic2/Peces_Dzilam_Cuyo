#Base de datos 
#Quarto guide

library(vegan)
library(ggplot2)

datos <- read.csv("Peces_Dzilam.csv")

#Realizar un MDS para compocisión de especies de peces 
#MATRIZ DE DISTANCIA 
 
datos_numeros <- datos[5:19]
  
dist_datos <- vegdist(sqrt(datos_numeros), method = "bray")

mds_result <- metaMDS(dist_datos, k = 2)

# plot(mds_result)

mds_points <-as.data.frame(mds_result$points)

mds <- cbind(datos[,1:4], mds_points)

ggplot(mds, aes(x = MDS1, y = MDS2))+
  geom_point(aes(colour = Sitio, shape = Hora), size = 4)+
  theme_bw()


&#Análisis de riqueza potencial en ambos sitios 
