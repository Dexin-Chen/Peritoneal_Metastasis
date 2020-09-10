install.packages("ggthemes")
install.packages("ggplot2")


library(ggthemes)
library(ggplot2)
distribution_training <- read.table("Supplementary Figure 4a.csv",sep = ",",head = TRUE)
distribution_validation <- read.table("Supplementary Figure 4b.csv",sep = ",",head = TRUE)
ggplot(data=distribution_training,mapping=aes(x=Number,y=Collagen,fill=Subgroup,group=Subgroup)) +
  scale_y_continuous(breaks=seq(-1.4, 1.4, 0.4)) +
  geom_bar(stat="identity",width=0.8) +
  labs(x="",y="Collagen signature") +
  theme(panel.background=element_rect(fill="transparent",colour=NA),panel.grid.minor=element_blank(),
        panel.grid.major=element_blank(),plot.background=element_rect(fill="transparent",colour=NA)) +
  guides(fill=guide_legend(title=NULL)) +
  theme(legend.justification=c(1,1),legend.position=c(1,1)) +
  scale_fill_manual(values=c("#56B4E9","#F0E442")) +
  scale_x_discrete(breaks=NULL)

ggplot(data=distribution_validation,mapping=aes(x=Number,y=Collagen,fill=Subgroup,group=Subgroup)) +
  scale_y_continuous(breaks=seq(-1, 1, 0.2)) +
  geom_bar(stat="identity",width=0.8) +
  labs(x="",y="Collagen signature") +
  theme(panel.background=element_rect(fill="transparent",colour=NA),panel.grid.minor=element_blank(),
        panel.grid.major=element_blank(),plot.background=element_rect(fill="transparent",colour=NA)) +
  guides(fill=guide_legend(title=NULL)) +
  theme(legend.justification=c(1,1),legend.position=c(1,1)) +
  scale_fill_manual(values=c("#56B4E9","#F0E442")) +
  scale_x_discrete(breaks=NULL)
