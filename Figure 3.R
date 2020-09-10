install.packages("survminer")
library(survminer)

survival_training <- read.table("Figure 3a-b.csv",sep = ",", head = T,row.names=1)

training_DFS <- survfit(Surv(DFS,DFSstatus)~Sub,data=survival_training)
training_OS <- survfit(Surv(OS,OSstatus)~Sub,data=survival_training)

# 1 indicates the low collagen signature and 2 indicates the high collagen signature
ggsurvplot(training_DFS,survival_training,size=1,palette = "jco",risk.table = TRUE,conf.int.fill=FALSE,
           break.x.by=5,break.y.by=0.2,xlim=c(0,36),axes.offset=T)
ggsurvplot(training_OS,survival_training,size=1,palette = "jco",risk.table = TRUE,conf.int.fill=FALSE,
           break.x.by=5,break.y.by=0.2,xlim=c(0,36),axes.offset=T)

survival_validation <- read.table("Figure 3c-d.csv",sep = ",", head = T,row.names=1)

validation_DFS <- survfit(Surv(DFS,DFSstatus)~Sub,data=survival_validation)
validation_OS <- survfit(Surv(OS,OSstatus)~Sub,data=survival_validation)

ggsurvplot(validation_DFS,survival_validation,size=1,palette = "jco",risk.table = TRUE,conf.int.fill=FALSE,
           break.x.by=5,break.y.by=0.2,xlim=c(0,36),axes.offset=T)
ggsurvplot(validation_OS,survival_validation,size=1,palette = "jco",risk.table = TRUE,conf.int.fill=FALSE,
           break.x.by=5,break.y.by=0.2,xlim=c(0,36),axes.offset=T)


