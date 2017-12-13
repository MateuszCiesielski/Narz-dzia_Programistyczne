# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)



# Define a server for the Shiny app
function(input, output) {
  
  data <-read.csv(file="bezrobotni.csv",header=TRUE,sep=";")
  print(is.data.frame(data))
  print(ncol(data))
  print(nrow(data))
  ########## Sortuje calego data frame'a i wyciagam top 5 bezrobotnych zawodow, much wow###############
  df <- head(data[order(data$Bezrobotni.dlugotrwale.na.koniec.okresu, decreasing= T),], n = 5)
  # df <- head(sort(data$Bezrobotni.dlugotrwale.na.koniec.okresu,decreasing=TRUE),n=5)
  print(df)
 # str(data)
  
  ####################################################################
  WartosciX <- df$Bezrobotni.dlugotrwale.na.koniec.okresu
  WartosciY <- df$Elementarne.grupy.zawodow
  NazwaY<-"Bezrobotni dlugotrwale na koniec okresu"
  NazwaX<-"Ilosc"
  #####################################################################

  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({

    
    # Plot the bar chart.
    barplot(WartosciX,names.arg = WartosciY,xlab = NazwaX,ylab = NazwaY,col = "blue",
            main = "Na Na Na Bezrobocie",border = "red")
    
  })
}