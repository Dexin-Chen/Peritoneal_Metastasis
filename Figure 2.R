fig2a <- read.table("Figure 2a.csv",sep = ",", head = T,row.names=1)

install.packages("cmprsk")
library(cmprsk)
fstatus_training <- fig2a$group
ftime_training <- fig2a$DFS
#plotting the cumulative incidence curve
#(1,1) and (2,1) indicate the cumulative peritoneal metastasis rate in low and high collagen signature patients
#(1,2) and (2,2) indicate the cumulative competing events in low and high collagen signature patients
cuminc_training <- cuminc(ftime_training,fstatus_training,fig2a$Subgroup)
plot(cuminc_training,xlim = c(0,36),ylim = c(0,0.6))

#calculating the SHR and 95% CI
crr_training <- crr(ftime_training,fstatus_training,fig2a$Subgroup)
summary(crr_training)
#------------------------------------------------------------------------------------------------------------

fig2b <- read.table("Figure 2b.csv",sep = ",", head = T,row.names=1)

fstatus_validation <- fig2b$group
ftime_validation <- fig2b$DFS

cuminc_validation <- cuminc(ftime_validation,fstatus_validation,fig2b$Subgroup)
plot(cuminc_validation,xlim = c(0,36),ylim = c(0,0.6))

crr_validation <- crr(ftime_validation,fstatus_validation,fig2b$Subgroup)
summary(crr_validation)
