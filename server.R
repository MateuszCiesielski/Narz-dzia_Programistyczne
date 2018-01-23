function(input, output) {
  
  output$DataColumn <- renderUI(
    {
      if(!is.null(input$UploadedFile))
      {
        file <- input$UploadedFile
        data <- read.csv(file$datapath,header=TRUE,sep=";",encoding="UTF-8",dec=",")
        ColumnNames <- colnames(subset(data,select = -c(1,2,18,19)))
        selectInput("Column", "Wybierz kategorię:",
                    choices=ColumnNames)
      }
    })
  
  output$Profession <- renderUI({
    if(!is.null(input$UploadedFile))
    {
      file <- input$UploadedFile
      data <- read.csv(file$datapath,header=TRUE,sep=";",encoding="UTF-8",dec=",")
      
      selectizeInput(
      'SelectedProfessions', 'Wybierz zawody dla ktorych chcesz wyswietlic stan:',
      choices=data$Elementarne.grupy.zawodów,
      multiple = TRUE
      )
    }
  })
  
  output$PracaPlot <- renderPlot(
    {
      if(!is.null(input$UploadedFile))
      {
        file <- input$UploadedFile
        data <- read.csv(file$datapath,header=TRUE,sep=";",encoding="UTF-8",dec=",")
        data[,-c(1,18,19)] #wywalanie kolumn
        
        TopN <- head(data[order(data[input$Column], decreasing= T),], n = input$ProfessionCounter)
        SelectedProfessions <- input$SelectedProfessions
        ProfessionsSubset <- subset(data, Elementarne.grupy.zawodów %in% SelectedProfessions)
        ToShow <- rbind(TopN, ProfessionsSubset)
        YValues <- ToShow$Elementarne.grupy.zawodów
        YLabel <- input$Column
        XLabel<-"Ilość"
        
        if(!is.null(ProfessionsSubset)) #TODO
        {
          barplot(ToShow[,input$Column]#WartosciX
                  ,legend.text=TRUE
                  ,args.legend=ToShow[,input$Column]
                  ,names.arg = YValues,las=3
                  ,xlab = XLabel,ylab = YLabel,col = "blue",
                  main = input$inp
                  ,border = "red")
        }
      }
    })
}