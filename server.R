function(input, output) {
  
  output$DataColumn <- renderUI(
    {
      if(!is.null(input$UploadedFile))
      {
        file <- input$UploadedFile
        data <- read.csv(file$datapath,header=TRUE,sep=";",encoding="UTF-8",dec=",")
        data <- subset(data, select = -c(1,2,9,10,18,19))
        colnames(data) <- c("Bezrobotni ogółem - napływ", "Bezrobotni ogółem - odpływ", "Bezrobotni ogółem - stan", "Bezrobotni długotrwale - stan", "Napływ ofert", "Napływ ofert - Internet", "Odsetek CBOP (%)", "Odsetek miejsc aktywizacji zawodowej (%)", "Liczba bezrobotnych miesięcznie", "Liczba ofert miesięcznie", "Wskaźnik dostępności ofert pracy", "Wskaźnik długotrwałego bezrobocia", "Wskaźnik płynności bezrobotnych", "Wskaźnik sumy bezrobotnych i ofert pracy")
        ColumnNames <- colnames(data)
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
        data <- subset(data, select = -c(1,9,10,18,19))
        colnames(data) <- c("Zawody", "Bezrobotni ogółem - napływ", "Bezrobotni ogółem - odpływ", "Bezrobotni ogółem - stan", "Bezrobotni długotrwale - stan", "Napływ ofert", "Napływ ofert - Internet", "Odsetek CBOP (%)", "Odsetek miejsc aktywizacji zawodowej (%)", "Liczba bezrobotnych miesięcznie", "Liczba ofert miesięcznie", "Wskaźnik dostępności ofert pracy", "Wskaźnik długotrwałego bezrobocia", "Wskaźnik płynności bezrobotnych", "Wskaźnik sumy bezrobotnych i ofert pracy")
        TopN <- head(data[order(data[input$Column], decreasing= T),], n = input$ProfessionCounter)
        SelectedProfessions <- input$SelectedProfessions
        ProfessionsSubset <- subset(data, Zawody %in% SelectedProfessions)
        ToShow <- rbind(TopN, ProfessionsSubset)
        YValues <- ToShow$Zawody
        YLabel <- input$Column
        #XLabel<-"Ilość"
        
        if(!is.null(ProfessionsSubset)) #TODO
        {
          barplot(ToShow[,input$Column]#WartosciX
                  ,legend.text=TRUE
                  ,args.legend=ToShow[,input$Column]
                  ,names.arg = YValues,las=3
                  ,ylab = YLabel,col = "blue",
                  main = input$inp
                  ,border = "red")
        }
      }
    })
}