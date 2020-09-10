training_data <- read.table("Table 2.csv", sep = ",", head = T,row.names=1)
training_data <- training_data[2:199,]

install.packages("cmprsk")
install.packages("aod")
library(cmprsk)
library(aod)

fstatus <- training_data$group
ftime <- training_data$DFS
##Competing-risk regression for collagen signature
Collagen_SHR<-crr(ftime,fstatus,training_data$Collagen)
summary(Collagen_SHR)
##Competing-risk regression for age
Age_SHR <- crr(ftime,fstatus,training_data$age)
summary(Age_SHR)
##Competing-risk regression for sex
Sex_SHR <- crr(ftime,fstatus,training_data$sex)
summary(Sex_SHR)
##Competing-risk regression for BMI
BMI_SHR <- crr(ftime,fstatus,training_data$BMI)
summary(BMI_SHR)
##Competing-risk regression for CEA
CEA_SHR <- crr(ftime,fstatus,training_data$CEA)
summary(CEA_SHR)
##Competing-risk regression for CA 19-9
CA199_SHR<-crr(ftime,fstatus,training_data$CA199)
summary(CA199_SHR)
##Competing-risk regression for tumor location
Body <- (training_data$location==1)+0
Cardia <- (training_data$location==2)+0
Location <- cbind(Body,Cardia)
Location_SHR <- crr(ftime,fstatus,Location)
summary(Location_SHR)
wald.test(Location_SHR$var,Location_SHR$coef,Terms=1:2)
##Competing-risk regression for tumor size
Size_SHR<-crr(ftime,fstatus,training_data$size)
summary(Size_SHR)
##Competing-risk regression for Lauren type
Lauren_SHR<-crr(ftime,fstatus,training_data$Lauren)
summary(Lauren_SHR)
##Competing-risk regression for tumor differentiation
Poor <- (training_data$differentiation==2)+1
Undifferentiated <- (training_data$differentiation==3)+1
Differentiation <- cbind(Poor,Undifferentiated)
Differentiation_SHR <- crr(ftime,fstatus,Differentiation)
summary(Differentiation_SHR)
wald.test(Differentiation_SHR$var,Differentiation_SHR$coef,Terms=1:2)
##Competing-risk regression for N stage
N1 <- (training_data$Nstage==1)+0
N2 <- (training_data$Nstage==2)+0
N3a <- (training_data$Nstage==3)+0
N3b <- (training_data$Nstage==4)+0
N <- cbind(N1,N2,N3a,N3b)
Nstage_SHR <- crr(ftime,fstatus,N)
summary(Nstage_SHR)
wald.test(Nstage_SHR$var,Nstage_SHR$coef,Terms=1:4)
##Competing-risk regression for chemotherapy
Chemo_SHR<-crr(ftime,fstatus,training_data$Chemotherapy)
summary(Chemo_SHR)

##Multivariate competing-risk regression
Covariate <- cbind(training_data$Collagen,training_data$size,Differentiation,N)
Covariate_SHR <- crr(ftime,fstatus,Covariate)

summary(Covariate_SHR)

wald.test(Covariate_SHR$var,Covariate_SHR$coef,Terms=3:4) #wald test for tumor differentiation
wald.test(Covariate_SHR$var,Covariate_SHR$coef,Terms=5:8) #wald test for N stage


