Performance_table_training_clinic <- read.table("Supplementary Figure 8a.csv", sep = ",", head = T,row.names=1)
Performance_table_validation_clinic <- read.table("Supplementary Figure 8b.csv", sep = ",", head = T,row.names=1)


library(pROC)
Performance_ROC_training_clinic <- roc(Performance_table_training_clinic$group,Performance_table_training_clinic$risk,ci=TRUE)
Performance_ROC_validation_clinic <- roc(Performance_table_validation_clinic$group,Performance_table_validation_clinic$risk,ci=TRUE)

plot(Performance_ROC_training_clinic,lwd=1,col="red",legacy.axes=TRUE)
plot(Performance_ROC_validation_clinic,lwd=1,col="red",legacy.axes=TRUE)

Performance_ROC_training_clinic
Performance_ROC_validation_clinic
