library(ggplot2)
library(dplyr)
x<-read.csv("city_temperature.csv")
dim(x)
# Filter the dataset to include only the years from 2015 to 2020
asia<- x %>%
  filter(x$Region=="Asia")
newasia<- asia %>%
  filter(asia$Year>=2015 & asia$Year<=2020)
mydata<-newasia
mydata %>%
  str()
mydata %>%
  summary()
mydata %>%
  head()
avg_temp_by_country_year <- newasia %>%
  group_by(Country, Year) %>%
  summarise(AvgTemperature = mean(AvgTemperature, na.rm = TRUE)) %>%
  distinct() 
custom_palette <- c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd",
                    "#8c564b", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf",
                    "#aec7e8", "#ffbb78", "#98df8a", "#ff9896", "#c5b0d5",
                    "#c49c94", "#f7b6d2", "#c7c7c7", "#dbdb8d", "#9edae5",
                    "#8c6d31", "#b5cf6b", "#cedb9c")
