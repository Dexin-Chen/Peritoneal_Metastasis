Performance_table_comparison <- read.table("Supplementary Figure 9.csv", sep = ",", head = T,row.names=1)

library(pROC)
Performance_ROC_collagen <- roc(Performance_table_comparison$group,Performance_table_comparison$risk_collagen,ci=TRUE)
Performance_ROC_clinic <- roc(Performance_table_comparison$group,Performance_table_comparison$risk_clinic,ci=TRUE)


#ROC curves comparison
roc.test(Performance_ROC_collagen,Performance_ROC_clinic)

plot(Performance_ROC_collagen,lwd=1,col="blue",legacy.axes=TRUE)
plot(Performance_ROC_clinic,lwd=1,col="red",legacy.axes=TRUE,add=TRUE)

#Calculation of the sensitivity, specificity, accuracy, npv and ppv in the total cohort
ci.coords(Performance_ROC_collagen,x=0.3913,ret=c("sensitivity","specificity","accuracy","npv","ppv","threshold"))

