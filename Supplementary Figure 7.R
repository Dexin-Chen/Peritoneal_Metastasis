install.packages("survival")
install.packages("cmprsk")

#Decision curve analysis
source("stdca.R")  
library(survival)
library(cmprsk)
total_cohort <- read.table("Supplementary Figure 7.csv", sep = ",", head = T,row.names=1)
training_cohort <- total_cohort[1:198,]
Srv <- Surv(training_cohort$DFS, training_cohort$DFSstatus)

##The model is developed in the training cohort, and then applied in all patients
coxmod_collagen <- coxph(Srv ~ Collagen+size+differentiation+Nstage, data=training_cohort)

total_cohort$collagen_36 <- c(1- (summary(survfit(coxmod_collagen,newdata=total_cohort), times=36)$surv))

dcr_total_collagen <- stdca(data=total_cohort, outcome="group", ttoutcome="DFS", timepoint=36, 
                            predictors="collagen_36", cmprsk=TRUE, smooth=TRUE, xstop=0.8)

plot(dcr_total_collagen$net.benefit$none,xlim=c(0, 80), ylim=c(-0.05, 0.38), 
     xlab="Threshold probability (%)", ylab="Net benefit",type="l", lwd=2,col="black") 
lines(dcr_total_collagen$net.benefit$all, type="l", lwd=2,col="red") 
lines(dcr_total_collagen$net.benefit$collagen_36, type="l",lwd=2,col="blue")

