## Loading the dataset
path <- 'C:\\Users\\saman\\git_repos\\dsc640-data_presentation\\data\\ex4.2'
filename <- 'crimerates-by-state-2005.csv'
## src <- paste(path, filename, sep="\\")

crime_rate <-read.csv(paste(path, filename, sep="\\"))

crime_rate

# Load the required library
library(ggplot2)

# Scatter Plot
plot <- ggplot(data=crime_rate,
               aes(x=state,
                   y=robbery))

plotWithGeom <- plot + geom_point()

plotWithGeom <- plotWithGeom + labs(
  title="Robbery per State in the US",
  subtitle="          (in 2005)",
  x="States",
  y="# of Robberies"
) + theme_bw(base_size = 15) + theme(axis.text.x=element_text(angle=45,hjust=1))

plotWithGeom

# Density Plot
plot <- ggplot(data=crime_rate,
               aes(x=murder))

plotWithGeom <- plot + geom_density()

plotWithGeom <- plotWithGeom + labs(
  title="Murder per State in the US",
  subtitle="          (in 2005)",
  x="Murder Rate"
) + theme_bw(base_size = 15)

plotWithGeom
