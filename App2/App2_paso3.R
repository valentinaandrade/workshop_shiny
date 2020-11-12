library(shiny)

ui <- fluidPage(
  titlePanel(title="Segunda app de Shiny"),
  sidebarLayout(
    sidebarPanel(numericInput(inputId="n", 
                  "Tamaño muestra", value=10)),
    mainPanel())
)

server <- function(input, output){
  output$box <- renderPlot({
    boxplot(rnorm(input$n), col="blue", 
            main = "Boxplot de variables aleatorias normales",
            xlab = "Muestra")
  })
}

shinyApp(ui = ui, server = server)  
