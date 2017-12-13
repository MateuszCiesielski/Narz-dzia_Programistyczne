# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
data <-read.csv(file="bezrobotni.csv",header=TRUE,sep=";")
NazwyKolumn=colnames(data)
# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("Telephones by region"),
  
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
      hr(), ####co to kuhwa to hr
      helpText("Wybierz zawody dla ktorych chcesz wyswietlic stan"),
      #Selektuje ile wyswietlic top zawodow
      ##Potem beda tryby, top N bezrobotnych lub wybrane zawody
      sliderInput("IloscZawodow","Wyswietl top N:",
                  min = 0, max = 10,
                  value=5)),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("PracaPlot")  
    )
    
  )
)