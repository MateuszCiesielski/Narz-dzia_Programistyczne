# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define a server for the Shiny app
function(input, output) {
  
  data <-read.csv(file="bezrobotni.csv",header=TRUE,sep=";")
  print(is.data.frame(data))
  print(ncol(data))
  print(nrow(data))
  df = head(data[order(data$Bezrobotni.dlugotrwale.na.koniec.okresu, decreasing= T),], n = 5)
  # df <- head(sort(data$Bezrobotni.dlugotrwale.na.koniec.okresu,decreasing=TRUE),n=5)
  print(df)
 # str(data)

  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Render a barplot
    H <- df$Bezrobotni.dlugotrwale.na.koniec.okresu
    M <- df$Elementarne.grupy.zawodow
    
    # Give the chart file a name.
    
    # Plot the bar chart.
    barplot(H,names.arg = M,xlab = "Month",ylab = "Revenue",col = "blue",
            main = "Revenue chart",border = "red")
    
  })
}