library(shiny)

ui <- fluidPage(
  titlePanel(title="Cuarta app de Shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "sepallenght",
                  "Sepal.Lenght:", min = 4.3, max = 7.9,
                  value = 5.8, step= 0.1),
      
      sliderInput(inputId = "sepalwidth",
                  "Sepal.Width:", min = 2, max = 4.4,
                  value = 3, step= 0.1),
      
      sliderInput(inputId = "petallenght",
                  "Petal.Lenght:", min = 1, max = 6.9,
                  value = c(1.6, 5.1)),
      
      sliderInput(inputId = "petalwidth",
                  "Petal.Width:", min = 0.1, max = 2.5,
                  value = 1.3, step = 0.3,
                  animate = animationOptions(
                    interval = 2600, loop = TRUE))),
    mainPanel())
)

server <- function(input, output){}

shinyApp(ui = ui, server = server)  
