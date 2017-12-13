# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define a server for the Shiny app
function(input, output) {
  
  data <-read.csv(file="bezrobotni.csv",header=TRUE,sep=";")
  print(is.data.frame(data))
  print(ncol(data))
  print(nrow(data))
 # print(data$V1)
  str(data)
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Render a barplot
    H <- data$Kod
    M <- data$Elementarne.grupy.zawodow
    
    # Give the chart file a name.
    
    # Plot the bar chart.
    barplot(H,names.arg = M,xlab = "Month",ylab = "Revenue",col = "blue",
            main = "Revenue chart",border = "red")
    
  })
}