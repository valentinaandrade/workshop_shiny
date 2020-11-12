library(shiny)

ui <- fluidPage(
  titlePanel(title="Segunda app de Shiny"),
  sidebarLayout(
    sidebarPanel(numericInput(inputId="n", 
                  "Tamaño muestra", value=10)),
    mainPanel())
)

server <- function(input, output){}

shinyApp(ui = ui, server = server)  
