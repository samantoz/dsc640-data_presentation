# install.packages('ggplot2')

library(ggplot2)
library(dplyr)
library(tidyverse)

require(readxl)
df <- read_excel("hotdog-contest-winners.xlsx",
                 col_names=c('year','winner','dogsEaten','country','newRecord'),
                 skip = 1,
                 col_types = c("numeric","text","numeric","text","numeric")
                 )

df
glimpse(df)

# create the data frame
df_hotdog <- data.frame(
  year=df['year'],
  value=df['dogsEaten'],
  hue = df['country']
)

glimpse(df_hotdog)
df_hotdog$dogsEaten
# bar plot
ggplot(df_hotdog, aes(fill=country, y= dogsEaten, x=year)) +
  geom_bar(position="dodge", stat="identity") +
  xlab("Year") +
  ylab("# of dogs eaten") +
  ggtitle("Hot Dogs eaten by Year/Country in R")

# Stacked Bar
# create the data frame
df_hotdog <- data.frame(
  record=as.factor(df$newRecord),
  value=df$dogsEaten,
  country = df$country
)

df_hotdog

df_hotdog %>%
  group_by(record,country) %>%
  summarize(Total_Eaten = sum(value,na.rm = TRUE))
  

ggplot(df_hotdog, aes(x = country, y=value, fill=record)) + 
  geom_bar(stat="identity") +
  ggtitle("Hot Dogs eaten by Country\n (showing new record counts) in R")

# create the temporary data frame
df_hotdog <- data.frame(
  value=df['dogsEaten'],
  hue = df['country']
)

df_summ <- df_hotdog %>% 
  group_by(country) %>% 
  summarise(hotdogs = sum(dogsEaten))
  
glimpse(df_summ)

# Pie chart
# pct <- round(100*df_summ$hotdogs/sum(df_summ$hotdogs))

# pie(df_summ$hotdogs, 
#     labels = paste(df_summ$country, sep = " ", pct, "%"),
#     main = "Country wise breakup of pct of Total Hotdogs eaten")

ggplot(data = df_summ, aes(x = "", y = hotdogs, fill = country)) + 
  geom_bar(stat = "identity", width=1,color="white") + 
  coord_polar("y", start=0) +
  theme_void() +
  geom_text(aes(y = hotdogs, label = hotdogs), color = "black", size=2) +
  ggtitle("Hot Dogs eaten by Country in R")

#Doughnut chart
df_summ
# compute percentage
df_summ$fraction = df_summ$hotdogs/ sum(df_summ$hotdogs)
# Compute the cumulative percentages (top of each rectangle)
df_summ$ymax = cumsum(df_summ$fraction)
# Compute the bottom of each rectangle
df_summ$ymin = c(0, head(df_summ$ymax, n=-1))


ggplot(data = df_summ, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill = country)) + 
  geom_rect() + 
  coord_polar(theta="y") +
  xlim(c(2,4)) +
  ggtitle("% of Hot Dogs eaten by Country in R")
