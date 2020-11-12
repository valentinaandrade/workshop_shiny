library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "n", label = "Tamaño muestra" , value = 25, min = 1, max = 100),
                plotOutput("hist")
                )
server <- function(input, output)
{
  output$hist <- renderPlot({
    hist(rnorm(input$n))
})
}

shinyApp(ui = ui, server = server)  
 