# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
# Define a server for the Shiny app
function(input, output) {
  
  data <-read.csv(file="bezrobotni.csv",header=TRUE,sep=";",encoding="UTF-8")
  data[,-c(1,18,19)]
  #####Tutaj ustawiaj zmienne dla wykresu
  ######W przyszlosci niech server dostaje wszystkie potrzebne rzeczy w inpucie
  ####################################################################
  NazwaX<-"Ilość"
  ZawodyDoWyboru <- data$Elementarne.grupy.zawodów
  #####################################################################
  # Fill in the spot we created for a plot
  output$PracaPlot <- renderPlot({
    TopN <- head(data[order(data[input$Kolumna], decreasing= T),], n = input$IloscZawodow)
    WybraneZawody <- input$WybraneZawody
    ziemniak <- subset(data, Elementarne.grupy.zawodów %in% WybraneZawody)
    DoWyswietlenia <- rbind(TopN,ziemniak)
    WartosciY <- DoWyswietlenia$Elementarne.grupy.zawodów
    NazwaY <- input$Kolumna
    # Plot the bar chart.
    barplot(DoWyswietlenia[,input$Kolumna]#WartosciX
            ,legend.text=TRUE
            ,args.legend=DoWyswietlenia[,input$Kolumna]
            ,names.arg = WartosciY,las=3
            ,xlab = NazwaX,ylab = NazwaY,col = "blue",
            main = input$inp
            ,border = "red")
    
  })
}