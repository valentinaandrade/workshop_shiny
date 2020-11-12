library(shiny)

ui <- fluidPage(
  titlePanel(title="Mi primera app de Shiny"),
  sidebarLayout(
  sidebarPanel("Panel lateral"),
  mainPanel("Panel principal")
  ))

server <- function(input, output){}

shinyApp(ui = ui, server = server)  
