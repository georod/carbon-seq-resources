# Data exploration for thesis

## 2021-05-04
## Peter R.

### Aim:
# Create a figure with the data I have gathered so far

setwd("/home/peter/Documents/georod/carbon-seq-resources/R_code")

## libraries

library(ggplot2)

d1 <- read.csv("./data_catalogue_v1.csv",header = TRUE, sep=',', quote="\"")
str(d1)

## Forests 
d2 <- d1[d1$habitat!='wetlands' & d1$use=='primary' & !is.na(d1$date_start),]

path1 <- c("../images/") 


ggplot(d2) + geom_segment(aes(x=date_start,xend=ifelse(date_start==date_end, (date_end+0.5), date_end), y=short_name, yend=short_name, color=extent),size=10) + labs(x="Year") + labs(y = "") + ggtitle("Forest related data sets")

png(paste0(path1,"forest_data_sets1.png"))
ggplot(d2) + geom_segment(aes(x=date_start,xend=ifelse(date_start==date_end, (date_end+0.5), date_end), y=short_name, yend=short_name, color=extent),size=10) + labs(x="Year") + labs(y = "") + ggtitle("Forest related data sets")
dev.off()
