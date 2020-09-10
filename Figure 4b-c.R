install.packages("riskRegression")
install.packages("pec")

training_data <- read.table("Figure 4a-b.csv",sep = ",", head = T,row.names=1)

library(riskRegression)
library(pec)
fgr1 <- FGR(Hist(DFS,group)~Collagen+size+differentiation+Nstage,data=training_data,cause=1)
calPlot(list("Fine-Gray"=fgr1),time=,36,data=training_data,legend=FALSE, col="blue",lwd=2,xlab="Predicted peritoneal metastasis probability", 
        ylab="Observed peritoneal metastasis frequencies", 
        splitMethod="BootCv",B=100,M=100,q=4,percent=F,xlim=c(0,0.8),ylim=c(0,0.8),method="quantile")
calPlot(list("Fine-Gray"=fgr1),time=,24,data=training_data,legend=FALSE, col="red",lwd=2,xlab="Predicted peritoneal metastasis probability", 
        ylab="Observed peritoneal metastasis frequencies", 
        splitMethod="BootCv",B=100,M=100,q=4,percent=F,xlim=c(0,0.8),ylim=c(0,0.8),method="quantile",add = TRUE)
calPlot(list("Fine-Gray"=fgr1),time=,12,data=training_data,legend=FALSE, col="yellow",lwd=2,xlab="Predicted peritoneal metastasis probability", 
        ylab="Observed peritoneal metastasis frequencies", 
        splitMethod="BootCv",B=100,M=100,q=4,percent=F,xlim=c(0,0.8),ylim=c(0,0.8),method="quantile",add = TRUE)


validation_data <- read.table("Figure 4c.csv",sep = ",", head = T,row.names=1)

calPlot(list("Fine-Gray"=fgr1),time=,36,data=validation_data,legend=FALSE, col="blue",lwd=2,xlab="Predicted peritoneal metastasis probability", 
        ylab="Observed peritoneal metastasis frequencies", 
        splitMethod="BootCv",B=100,M=100,q=4,percent=F,xlim=c(0,0.8),ylim=c(0,0.8),method="quantile")
calPlot(list("Fine-Gray"=fgr1),time=,24,data=validation_data,legend=FALSE, col="red",lwd=2,xlab="Predicted peritoneal metastasis probability", 
        ylab="Observed peritoneal metastasis frequencies", 
        splitMethod="BootCv",B=100,M=100,q=4,percent=F,xlim=c(0,0.8),ylim=c(0,0.8),method="quantile",add = TRUE)
calPlot(list("Fine-Gray"=fgr1),time=,12,data=validation_data,legend=FALSE, col="yellow",lwd=2,xlab="Predicted peritoneal metastasis probability", 
        ylab="Observed peritoneal metastasis frequencies", 
        splitMethod="BootCv",B=100,M=100,q=4,percent=F,xlim=c(0,0.8),ylim=c(0,0.8),method="quantile",add = TRUE)
