library(shinythemes)
# Define UI for app that draws a histogram ----
ui <- fluidPage(theme=shinytheme("superhero"),
  # App title ----
  titlePanel("Nice app!"),
  h4("Welcome in our app!", style = "font-family:'times';color:grey;"),
  img(src="image.png"),
  h5("Some widgets:", style ="color:grey"),
  h5("Histogram:", style = "color:grey"),
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    # Sidebar panel for inputs ----
    sidebarPanel(
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
    )
  )
)
#+END_SRC
