#Base de datos 
#Quarto guide

datos <- read.csv("Peces_Dzilam.csv")

#Realizar un MDS para compocisión de especies de peces 
#MATRIZ DE DISTANCIA 
 
datos_numeros <- datos[5:15]
  
dist_datos <- dist(datos_numeros)

mds_result <- isoMDS(dist_datos, k = 2)

plot(mds_result[, 1], mds_result[, 2], 
     xlab = "Dimensión 1", ylab = "Dimensión 2", main = "MDS No Métrico")

 


#Análisis de riqueza potencial en ambos sitios 
