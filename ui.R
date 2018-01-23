
# Use a fluid Bootstrap layout
fluidPage(theme="style.css",
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
      uiOutput("Profession"),
      hr(),##to tylko linia pozioma miedzy inputami
      #Selektuje ile wyswietlic top zawodow
      checkboxInput("ShowTopN", "Wyswietl top N zawodow w danej kategorii"),
      conditionalPanel(
        condition="input.ShowTopN == true",
        sliderInput("ProfessionCounter","Wyswietl top N:",
                    min = 0, max = 10,
                    value=0)
      ),
      downloadButton('downloadPlot', 'Export Plot as PNG')
    ),
    # Create a spot for the barplot
    mainPanel(
      plotOutput("PracaPlot")
    )
  )
)