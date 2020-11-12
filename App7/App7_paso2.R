library(shiny)

ui <- fluidPage(
  titlePanel(title="Séptima app de Shiny"),
  sidebarLayout(
  sidebarPanel(
    selectInput(inputId = "data1",
                label = "Seleccione el conjunto de datos",
                choices = c("iris", "mtcars", "trees"))),
  mainPanel())
  )

server <- function(input, output){}

shinyApp(ui = ui, server = server)  
