
# Use a fluid Bootstrap layout
fluidPage(
 # dashboardSiderbar(),
  
  # Give the page a title
  titlePanel("Costam costam praca i bezrobocie"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    # Define the sidebar with one input
    sidebarPanel(
      fileInput("UploadedFile","Wybierz plik CSV"),
      hr(),
      ## Pierwszy argument to nazwa ""zmiennej"" do ktorej sie odwolamy w serverze
      ## przez input$Kolumna
      ##Druga wyswietla sie na ekranie, po prostu nazwa
      ##Inputu nie mozesz pobierac tylko w funkcji "renderplot" 
      ##lub innej funkcji reagujacej dynamicznie na zmiany(???)
      uiOutput("DataColumn"),
      helpText("Wybierz zawody dla ktorych chcesz wyswietlic stan:"),
      uiOutput("ProfessionLabel"),
      uiOutput("Profession"),
      hr(),##to tylko linia pozioma miedzy inputami
      #Selektuje ile wyswietlic top zawodow
      helpText("Czy wyswietlic top N zawodow w danej kategorii?"),
      checkboxInput("CzyPokazacTopN", "Wyswietl"),
      conditionalPanel(
        condition="input.CzyPokazacTopN == true",
        sliderInput("IloscZawodow","Wyswietl top N:",
                    min = 0, max = 10,
                    value=0)
      )
    ),
    # Create a spot for the barplot
    mainPanel(
      plotOutput("PracaPlot")  
    )
  )
)