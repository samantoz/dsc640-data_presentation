## Loading the dataset
stackeddata <-read.csv("unemployement-rate-1948-2010.csv")
stackeddataexp <- read.csv("expenditures.txt",sep="\t",header = TRUE)
## View the dataset structure
str(stackeddata)

# Load the required library
library(ggplot2)

# create the plot with the x and y axes
plot <- ggplot(data=stackeddata,
               aes(x=Year,
                   y=Value,
                   fill=Period),
               ylab("Years"),
               xlab("Unemployment Rate"))

# create the plot with the x and y axes
plotexp <- ggplot(data=stackeddataexp,
               aes(x=year,
                   y=expenditure,
                   fill=category))

# Stacked area chart 
# Create the geometry of the plot
plotWithGeom <- plot + geom_area(aes(colour=Period,
                                     fill=Period))

plotWithGeom <- plotWithGeom + labs(x="Years",
                                    y = "Unemployment Rate",
                                    title = "Stacked Area chart showing Unemployment Rate by Year")

# Show the stacked area plots
plotWithGeom

help("xlab")


# Density gradient
plotwithGeom2 <-plot + geom_area(color="black",
                                 size = 0.5,
                                 alpha=0.4) + scale_fill_brewer(palette = "Blues")
plotwithGeom2

# Density gradient for expenditure
plotwithGeom2exp <-plotexp + geom_area(color="black",
                                 size = 0.5,
                                 alpha=0.4) + scale_fill_brewer(palette = "Blues")

plotwithGeom2exp <- plotwithGeom2exp + labs(x="Years",
                                            y = "Expenditure",
                                            title = "Stacked Area chart showing Expenditure by Category by Year")

plotwithGeom2exp

## Installing the package and calling the package in R##
install.packages("treemap")
library(treemap)

# Creating a Treemap
# The treemap function is used to create a treemap.
View(stackeddataexp)

aggregate(expenditure ~ category, stackeddataexp, sum)
# Basic Treemap
treemap(stackeddataexp,index = c("category"),vSize ="expenditure")

# Creating a hierarchical treemap

treemap(stackeddataexp,index = c("year","category"),vSize ="expenditure")

treemap(stackeddataexp,index = c("year","category"),vSize ="expenditure", vColor="category", type="categorical")
# Adding a Title and the Category labels centered and keeping that of Sub Categories in top left
treemap(stackeddataexp,index = c("year","category"),
        vSize ="expenditure", 
        vColor="category", 
        type="categorical",
        title = "Expenditure Treemap for Categories by year",
        fontsize.labels = c(15,10), align.labels = list(c("centre","centre"),c("left","top")))
