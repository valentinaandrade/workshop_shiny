library(shiny)

ui <- fluidPage(
      tags$h1("Workshop Reportes Dinámicos con Shiny"),
      tags$hr(),
      tags$br(),
      tags$p(strong("María José García")),
      tags$p(em("Pontificia Universidad Católica de Chile")),
      tags$a(href="http://mat.uc.cl/", "Facultad Matemáticas UC")
    )
server <- function(input, output){}

shinyApp(ui = ui, server = server)  