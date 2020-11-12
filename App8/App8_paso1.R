library(shiny)
library(ggplot2)
library(lattice)

ui <- fluidPage(
  titlePanel(title="Octava app de Shiny"),
  sidebarLayout(
    sidebarPanel(
      fileInput(inputId = "file", label = "Cargue sus datos"),
      checkboxInput(inputId = "header", label = "Encabezado", value = FALSE),
      radioButtons(inputId = "sep" , label= "Separador", 
                   choices = c(Coma = ",", Punto_Coma = ";", Tab = "\t", Espacio = " "),
                   selected = ","),
    ),
    mainPanel()
  )
)
server <- function(input, output){}

shinyApp(ui = ui, server = server)  
