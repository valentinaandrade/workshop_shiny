library(shiny)

ui <- fluidPage(
  titlePanel(title="Segunda app de Shiny"),
  sidebarLayout(
  sidebarPanel(),
  mainPanel())
  )

server <- function(input, output){}

shinyApp(ui = ui, server = server)  
