library(shiny)

ui <- fluidPage(
  titlePanel(title="Séptima app de Shiny"),
  sidebarLayout(
  sidebarPanel(),
  mainPanel())
  )

server <- function(input, output){}

shinyApp(ui = ui, server = server)  
