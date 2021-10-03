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
                   fill=category),
               ylab("Years"),
               xlab("Expenditure on various Categories"))

# Stacked area chart 
# Create the geometry of the plot
plotWithGeom <- plot + geom_area(aes(colour=Period,
                                     fill=Period))

# Show the stacked area plots
plotWithGeom

# Density gradient
plotwithGeom2 <-plot + geom_area(color="black",
                                 size = 0.5,
                                 alpha=0.4) + scale_fill_brewer(palette = "Blues")
plotwithGeom2

# Density gradient for expenditure
plotwithGeom2exp <-plotexp + geom_area(color="black",
                                 size = 0.5,
                                 alpha=0.4) + scale_fill_brewer(palette = "Blues")
plotwithGeom2exp

