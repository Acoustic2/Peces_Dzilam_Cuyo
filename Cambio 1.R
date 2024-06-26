#Análisis de riqueza potencial en ambos sitios 

library(vegan)
library(ggplot2)
library(dplyr)

datos <- read.csv("Peces_Dzilam.csv")

#Realizar un MDS para compocisión de especies de peces 

datos_numeros<- datos[6:20]

dist_datos <- vegdist(sqrt(datos_numeros), method = "bray")
mds_result <- metaMDS(dist_datos, k = 2, trymax = 100)

mds_result$stress

mds_points <-as.data.frame(mds_result$points)

mds <- cbind(datos[,1:5], mds_points)

ggplot(mds, aes(x = MDS1, y = MDS2))+
  geom_point(aes(colour = Sitio, shape = Hora, size = Abundancia))+
  geom_text(aes(x = -0.5, y = 0.8, label = "Estres: 0.11" ))+
  theme_bw()



  



#Análisis de riqueza potencial en ambos sitios 

library(vegan)
library("betapart")
install.packages("betapart")

datos_beta <- read.csv("Beta.csv")
data.sp<-datos_beta[,1:14]
data.sp<-as.data.frame(data.sp)

beta.m<-beta.multi(data.sp, index.family="jaccard")
beta.c<-betapart.core(data.sp)
beta.multi(beta.c, index.family="jaccard")

beta.m.sor<-beta.multi(data.sp, index.family="sorensen")
beta.c.sor<-betapart.core(data.sp)
beta.multi(beta.c.sor, index.family="sorensen")

data_text <- "
MC,MCL,R_OJO,RAYA,PGLOBO,R_CUERPO,R_AMARILLO,M_UROP,ANCHOA,R_ROJAS,AGUJA,T.griseus,CAFE,CROJA,Localidad
1,1,1,1,1,1,1,1,1,1,0,0,1,1,Dzilam
0,0,0,0,0,0,0,0,1,0,1,1,0,0,El_Cuyo
"
datos_beta <- read.table(textConnection(data_text), header = TRUE, sep = ",")


#Curva de acumulación de especies 

gamma <- specpool(x = datos_numeros, pool = datos$Sitio)

SAC_dz <- specaccum(datos_numeros[1:40,])
plot(SAC_dz)
sdz <- SAC_dz$richness

SAC_cu <- specaccum(datos_numeros[41:80,])
scu <- SAC_cu$richness
plot(SAC_cu)

SAC <- data.frame(
  "Esfuerzo" = c(1:40,1:40),
  "S" = c(sdz,scu),
  "Localidad" = c(rep("Dzilam",40),rep("El Cuyo", 40)))

ggplot(SAC, aes(x = Esfuerzo, y = S, colour = Localidad))+
  geom_line(linewidth = 2)+
  scale_y_continuous(breaks = seq(1, 25, 1))+
  theme_bw()
