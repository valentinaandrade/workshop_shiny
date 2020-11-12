library(shiny)

ui <- fluidPage(
  titlePanel(title="Tercera app de Shiny"),
  sidebarLayout(
    sidebarPanel(numericInput(inputId = "n",
                              "Tamaño muestra", value = 10),
                 textInput(inputId = "título", "Título del boxplot", 
                           "Boxplot en R"),
                 radioButtons(inputId = "color", "Elija el color", 
                              list(Azul="Blue", Verde="Green"), "Green"),
                 submitButton("Aplicar cambios")),
    
    mainPanel(
      plotOutput(outputId = "box")
    )))


server <- function(input, output){
  output$box <- renderPlot({
    boxplot(rnorm(input$n), col="green", 
            main = "Boxplot de variables aleatorias normales",
            xlab = "Muestra")
  })
}

shinyApp(ui = ui, server = server)  
