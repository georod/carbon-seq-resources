# Data exploration for thesis

## 2021-05-14
## Peter R.

### Aim:
# Create a figure with the data I have gathered so far

setwd("~/../github/carbon-seq-resources/R_code")

#===============================
# Libraries
#===============================
library("readxl")
library("ggplot2")


#===============================
# Read data
#===============================

# open Excel sheet
ex1 <- read_excel("~/PhD/resnet/data/gis/data_catalogue_v2.xlsx", sheet = 2)
# save Excel sheet as CSV
write.csv(ex1,"data_catalogue_v1.csv", row.names = FALSE)


d1 <- read.csv("./data_catalogue_v1.csv",header = TRUE, sep=',', quote="\"")
#str(d1)

## Forests 
d2 <- d1[d1$habitat!='wetlands' & d1$use=='primary' & !is.na(d1$date_start),]

path1 <- c("../images/") 


#ggplot(d2) + geom_segment(aes(x=date_start,xend=ifelse(date_start==date_end, (date_end+0.5), date_end), y=short_name, yend=short_name, color=extent),size=10) + labs(x="Year") + labs(y = "") + ggtitle("Forest related data sets")

## Save as PNG
png(paste0(path1,"forest_data_sets1.png"), width = 960, height = 720,
    units = "px", pointsize = 12, bg = "white", res = 120,
    restoreConsole = TRUE)
ggplot(d2) + geom_segment(aes(x=date_start,xend=ifelse(date_start==date_end, (date_end+0.5), date_end), y=short_name, yend=short_name, color=extent),size=2) + labs(x="Year") + labs(y = "") + coord_cartesian(xlim = c(1980, 2030)) + ggtitle("Selected forest related data sets") + labs(caption = "*More relevant data sets are available \n **Only data for 2015 are publicly available.", size=6)
dev.off()


