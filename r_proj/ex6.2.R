## 1 histogram, 1 box plot, 1 bullet chart, and 1 additional chart of your choice 
## (can be an existing chart type we've already done, but it must be done in a new way 
## or it can be an entirely new chart type) using R

# Crime rate in the US
crime <- read.csv("C:\\Users\\saman\\git_repos\\dsc640-data_presentation\\data\\ex6.2\\crimeratesbystate-formatted.csv",header=TRUE)
# Education data

# Lets look at the first 5 rows
education <- read.csv("C:\\Users\\saman\\git_repos\\dsc640-data_presentation\\data\\ex6.2\\education.csv",header=TRUE)

education[1:5,]

# Extra plot
# Looking at the scores for various states
ed.dis <- dist(education[,2:7])
ed.mds <- cmdscale(ed.dis)

x <- ed.mds[,1]
y <- ed.mds[,2]

plot(x,y, type="n")
text(x, y, labels=education$state)

# Histogram
hist(crime$burglary, prob=F, ylim=c(0,15), 
     main="Histogram of Burglary rate by State in the USA", xlab="burglary",ylab = "# of States", las=1)

# Boxplot
boxplot(crime$burglary, crime$robbery, col="yellow",
        main="Boxplot showing burglary and robbery")

# Bullet Chart
bullet_chart(dataframe = education)

