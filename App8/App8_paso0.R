library(shiny)
#library(ggplot2)
#library(lattice)

ui <- fluidPage(
  titlePanel(title="Octava app de Shiny"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel()
  )
)
server <- function(input, output){}

shinyApp(ui = ui, server = server)  
