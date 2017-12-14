
data <-read.csv(file="bezrobotni.csv",header=TRUE,sep=";",encoding="UTF-8")
NazwyKolumn=colnames(data)
# Use a fluid Bootstrap layout
fluidPage(
 # dashboardSiderbar(),
  
  # Give the page a title
  titlePanel("Costam costam praca i bezrobocie"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    # Define the sidebar with one input
    sidebarPanel(
      
      ## Pierwszy argument to nazwa ""zmiennej"" do ktorej sie odwolamy w serverze
      ## przez input$Kolumna
      ##Druga wyswietla sie na ekranie, po prostu nazwa
      ##Inputu nie mozesz pobierac tylko w funkcji "renderplot" 
      ##lub innej funkcji reagujacej dynamicznie na zmiany(???)
      selectInput("Kolumna","Inp:",
                  choices=NazwyKolumn),
      hr(),##to tylko linia pozioma miedzy inputami
      #Selektuje ile wyswietlic top zawodow
      ##Potem beda tryby, top N bezrobotnych lub wybrane zawody
      helpText("Czy wyswietlic top N zawodow w danej kategorii?"),
      checkboxInput("CzyPokazacTopN", "Wyswietl"),
      conditionalPanel(
        condition="input.CzyPokazacTopN == true",
        sliderInput("IloscZawodow","Wyswietl top N:",
                    min = 0, max = 10,
                    value=5)
      ),
      helpText("Wybierz zawody dla ktorych chcesz wyswietlic stan"),
      selectizeInput(
        'WybraneZawody', '2. Multi-select', choices = data$Elementarne.grupy.zawodów, multiple = TRUE
      )
      
    ),
    # Create a spot for the barplot
    mainPanel(
      plotOutput("PracaPlot")  
    )
  )
)