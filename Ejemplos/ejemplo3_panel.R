library(shiny)

ui <- fluidPage(
        wellPanel(
          numericInput(inputId = "n",
                       label = "Tamaño muestra",
                       value = 25),
          submitButton()),
          plotOutput(outputId="hist")
      )

server <- function(input, output)
  {
    output$hist <- renderPlot({
      hist(rnorm(input$n))
    })
}

shinyApp(ui = ui, server = server)