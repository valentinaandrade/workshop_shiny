library(shiny)

ui <- fluidPage(
  titlePanel(title="Quinta app de Shiny"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId= "var", "1. Selección de variable",
                  choices = c("Sepal.Length"= 1, "Sepal.Width" = 2, "Petal.Length" = 3 , "Petal.Width" = 4),
                  selected = 3, selectize = FALSE),
      sliderInput(inputId = "bin", "2. Seleccione el número de grupos del histograma",
                  min = 5, max = 25, value = 15),
      radioButtons(inputId = "colour", label = "3. Seleccione el color",
                   choices = c("black", "yellow", "red"), selected = "yellow")
    ),
    mainPanel(
      tabsetPanel(type = "tab",
        tabPanel("Panel 1",
          textOutput(outputId = "text1"),
          plotOutput(outputId = "myhist")),
        tabPanel("Panel 2",
          verbatimTextOutput("summary")         
#          tableOutput(outputId = "summary")
    )))
))

server <- function(input, output){
  output$text1 <- renderText({
    colm = as.numeric(input$var)
    paste("La variable de interés es: ", names(iris[colm]))})
  output$myhist <- renderPlot({
    colm = as.numeric(input$var)
    hist(iris[,colm], col = input$colour,
         xlim = c(0, max(iris[, colm])),
         main = "Histograma...", 
         breaks = seq(0, max(iris[,colm]),
         l = input$bin + 1), xlab = names (iris[colm]))})
#  output$summary <- renderTable({
  output$summary <- renderPrint({
            summary(iris)
  })
}

shinyApp(ui = ui, server = server)  


