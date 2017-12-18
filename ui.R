
# Use a fluid Bootstrap layout
fluidPage(
 # dashboardSiderbar(),
  
  # Give the page a title
  titlePanel("Costam costam praca i bezrobocie"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    # Define the sidebar with one input
    sidebarPanel(
      fileInput("file1","Wybierz plik CSV"),
      hr(),
      
      ## Pierwszy argument to nazwa ""zmiennej"" do ktorej sie odwolamy w serverze
      ## przez input$Kolumna
      ##Druga wyswietla sie na ekranie, po prostu nazwa
      ##Inputu nie mozesz pobierac tylko w funkcji "renderplot" 
      ##lub innej funkcji reagujacej dynamicznie na zmiany(???)
      uiOutput("WybierajkaKolumn"),
      hr(),##to tylko linia pozioma miedzy inputami
      #Selektuje ile wyswietlic top zawodow
      helpText("Czy wyswietlic top N zawodow w danej kategorii?"),
      checkboxInput("CzyPokazacTopN", "Wyswietl"),
      conditionalPanel(
        condition="input.CzyPokazacTopN == true",
        sliderInput("IloscZawodow","Wyswietl top N:",
                    min = 0, max = 10,
                    value=0)
      ),
      helpText("Wybierz zawody dla ktorych chcesz wyswietlic stan"),
  #    selectizeInput(
  #      'WybraneZawody', '2. Multi-select', choices = output$Zawody, multiple = TRUE
  #    )
      uiOutput("WybierajkaZawodow")
      
    ),
    # Create a spot for the barplot
    mainPanel(
      plotOutput("PracaPlot")  
    )
  )
)