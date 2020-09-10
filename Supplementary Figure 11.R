install.packages("ggplot2")
install.packages("ggpubr")

BMI_training <- read.table("Supplementary Figure 11a.csv", sep = ",", head = T,row.names=1)
BMI_validation <- read.table("Supplementary Figure 11b.csv", sep = ",", head = T,row.names=1)

library(ggplot2)
library(ggpubr)
ggviolin(BMI_training, x = "BMI", y = "Collagen", fill = "BMI",
         palette = "npg",
         add = "boxplot",add.params = list(fill = "white"))

ggviolin(BMI_validation, x = "BMI", y = "Collagen", fill = "BMI",
         palette = "npg",
         add = "boxplot",add.params = list(fill = "white"))
