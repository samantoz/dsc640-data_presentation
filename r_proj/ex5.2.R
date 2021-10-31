## Heatmap
# NBA basketball statistics for 2008
bball <- read.csv("C:\\Users\\saman\\git_repos\\dsc640-data_presentation\\data\\ex5.2\\ppg2008.csv",header=TRUE)

# Lets look at the first 5 rows
bball[1:5,]

# change the row indexes to player names
row.names(bball) <- bball$Name
# this sets the dataframe from column 2 to 20 which are numeric columns
bball <- bball[,2:20]

# The data for the heatmap should be in matrix form and not a dataframe
bball_matrix <- data.matrix(bball)

# By setting the scale argument to "column" we are letting R know to use the min and max of 
# each column to determine color gradients

bball_heatmap <- heatmap(bball_matrix, Rowv = NA,
                         Colv = NA, col = heat.colors(256), scale="column", margins = c(5,10),
                         main="NBA per game Performance in 2008",xlab="Performance Criteria",ylab = "NBA players")

## Spatial Chart
library(maps)
costcos <- read.csv("C:\\Users\\saman\\git_repos\\dsc640-data_presentation\\data\\ex5.2\\costcos-geocoded.csv",header=TRUE)

# This is the first layer
map(database="state",col="#cccccc")

# The costco layer is the second layer
symbols(costcos$Longitude, costcos$Latitude, bg="#e2373f", fg="#ffffff",
        lwd=0.5, circles=rep(1, length(costcos$Longitude)),
        inches=0.05, add=TRUE)
