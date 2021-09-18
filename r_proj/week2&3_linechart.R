library(ggplot2)
library(dplyr)
library(tidyverse)

# Read data
require(readxl)
w_pop <- read_excel("C:\\Users\\saman\\git_repos\\dsc640-data_presentation\\r_proj\\world-population.xlsm")

w_pop


# Plot as regular time series
ggplot(w_pop, aes(x=Year, y= Population/1000000000)) +
         geom_line(color="#69b3a2", size=2, alpha=0.9, linetype=1) +
         xlab("Year") +
         ylab("Population(in billions)") +
         ggtitle("Growth of World Population from 1960-2010")
       
       
# # Plot as Step Chart
# plot(w_pop$Year, w_pop$Population/1000000000, type="s", 
#      main="Growth of World Population from 1960-2010", xlab="Year"
# , ylab="Population(billions)")

list_year <- c("1960","1970","1980","1990","2000","2009")
new_df <- w_pop %>%
  filter(Year %in% list_year)

new_df

# Step Function
ggplot(new_df, aes(x=Year, y= Population/1000000000)) +
  geom_step(color="#69b3a2", size=2, alpha=0.9, linetype=1) +
  xlab("Year") +
  ylab("Population(in billions)") +
  ggtitle("Growth of World Population by decade from 1960-2010")
