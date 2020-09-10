Performance_table_training <- read.table("Supplementary Figure 6a.csv", sep = ",", head = T,row.names=1)
Performance_table_validation <- read.table("Supplementary Figure 6b.csv", sep = ",", head = T,row.names=1)

install.packages("pROC")
library(pROC)
Performance_ROC_training <- roc(Performance_table_training$group,Performance_table_training$risk,ci=TRUE)
Performance_ROC_validation <- roc(Performance_table_validation$group,Performance_table_validation$risk,ci=TRUE)

plot(Performance_ROC_training,lwd=1,col="blue",legacy.axes=TRUE)
plot(Performance_ROC_validation,lwd=1,col="blue",legacy.axes=TRUE)

Performance_ROC_training
Performance_ROC_validation

#Calculation of the sensitivity, specificity, accuracy, NPV and PPV in the training and validation cohort
ci.coords(Performance_ROC_training,x="best",ret=c("sensitivity","specificity","accuracy","npv","ppv","threshold"))
ci.coords(Performance_ROC_validation,x=0.3913,ret=c("sensitivity","specificity","accuracy","npv","ppv","threshold"))



