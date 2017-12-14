# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
# Define a server for the Shiny app
function(input, output) {
  
  data <-read.csv(file="bezrobotni.csv",header=TRUE,sep=";",encoding="UTF-8")

  #####Tutaj ustawiaj zmienne dla wykresu
  ######W przyszlosci niech server dostaje wszystkie potrzebne rzeczy w inpucie
  ####################################################################
 # ss = input$inp
 # WartosciX <- df$Bezrobotni.dlugotrwale.na.koniec.okresu
  NazwaY<-"Bezrobotni dlugotrwale na koniec okresu"
  NazwaX<-"Ilość"
  #####################################################################

  # Fill in the spot we created for a plot
  output$PracaPlot <- renderPlot({
    df <- head(data[order(data[input$Kolumna], decreasing= T),], n = input$IloscZawodow)
    WartosciY <- df$Elementarne.grupy.zawodow
    
    # Plot the bar chart.
    barplot(df[,input$Kolumna]#WartosciX
            ,names.arg = WartosciY,xlab = NazwaX,ylab = NazwaY,col = "blue",
            main = input$inp#"Na Na Na Bezrobocie"
            ,border = "red")
    
  })
}