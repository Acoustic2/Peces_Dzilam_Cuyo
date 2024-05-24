#Beta diversidad, art?culo

library(readxl)
library(vegan)
library(betapart)

Beta_div_art <- read_excel("Beta div. art.xlsx")
View(Beta_div_art)

data.sp<-Beta_div_art[,1:28]
data.sp<-as.data.frame(data.sp)

beta.m<-beta.multi(data.sp, index.family="jaccard")
beta.c<-betapart.core(data.sp)
beta.multi(beta.c, index.family="jaccard")

#Resultado

#$beta.JTU
#[1] 0.9356436

#$beta.JNE
#[1] 0.02308659

#$beta.JAC
#[1] 0.9587302

beta.m.sor<-beta.multi(data.sp, index.family="sorensen")
beta.c.sor<-betapart.core(data.sp)
beta.multi(beta.c.sor, index.family="sorensen")
