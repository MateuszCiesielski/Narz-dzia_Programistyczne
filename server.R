function(input, output) {
  
  
  output$WybierajkaZawodow<- renderUI({
    if(!is.null(input$file1))
    {
      file<-input$file1
      data <- read.csv(file$datapath,header=TRUE,sep=";",encoding="UTF-8",dec=",")

      selectizeInput(
      'WybraneZawody', '2. Multi-select',
      choices=data$Elementarne.grupy.zawodów,
      multiple = TRUE
      )
    }
  })
  
  output$WybierajkaKolumn<- renderUI(
  {
   if(!is.null(input$file1))
   {
     file<-input$file1
    data<-read.csv(file$datapath,header=TRUE,sep=";",encoding="UTF-8",dec=",")
    NazwyKolumn<-colnames(subset(data,select = -c(1,2,18,19)))
    selectInput("Kolumna","Inp:",
                choices=NazwyKolumn)
   }
  })
  
  output$PracaPlot <- renderPlot({
    
    if(!is.null(input$file1))
    {
      
    file <- input$file1
    data <-read.csv(file$datapath,header=TRUE,sep=";",encoding="UTF-8",dec=",")
    data[,-c(1,18,19)] #wywalanie kolumn
    
    TopN <- head(data[order(data[input$Kolumna], decreasing= T),], n = input$IloscZawodow)
    WybraneZawody <- input$WybraneZawody
    ziemniak <- subset(data, Elementarne.grupy.zawodów %in% WybraneZawody)
    DoWyswietlenia <- rbind(TopN,ziemniak)
    WartosciY <- DoWyswietlenia$Elementarne.grupy.zawodów
    NazwaY <- input$Kolumna
    NazwaX<-"Ilość"
    
    barplot(DoWyswietlenia[,input$Kolumna]#WartosciX
              ,legend.text=TRUE
              ,args.legend=DoWyswietlenia[,input$Kolumna]
              ,names.arg = WartosciY,las=3
              ,xlab = NazwaX,ylab = NazwaY,col = "blue",
              main = input$inp
              ,border = "red")
    }
    else
    {
      barplot.default()
    }
    
    
  })
}