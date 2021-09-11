
require(readxl)
df <- read_excel("hotdog-contest-winners.xlsx")
df

# create the data frame
df_hotdog <- data.frame(
  year=df['Year'],
  value=df['Dogs eaten'],
  hue = df['Country']
)

df_hotdog$Dogs.eaten

barplot(height=df_hotdog$Dogs.eaten, year=df_hotdog$Year, 
        col=rgb(0.8,0.1,0.1,0.6),
        xlab="Year", 
        ylab="Dogs Eaten", 
        main="Hot Dogs Eaten by Year (R Plot)"
)

install.packages('ggplot2')
library(ggplot2)

head(df_hotdog)
head(df)

b <- ggplot(df_hotdog, aes(x = Year, y = Dogs.eaten, color = Country))

b + geom_bar(stat="identity") + theme_minimal()
