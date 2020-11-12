library(shiny)

ui <- fluidPage(
  titlePanel(title="Sexta app de Shiny"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId= "var", "1. Selección de variable",
                  choices = c("Sepal.Length"= 1, "Sepal.Width" = 2, "Petal.Length" = 3 , "Petal.Width" = 4),
                  selected = 3, selectize = FALSE),
      sliderInput(inputId = "bin", "2. Seleccione el número de grupos del histograma",
                  min = 5, max = 25, value = 15),
      radioButtons(inputId = "colour", label = "3. Seleccione el color",
                   choices = c("black", "yellow", "red"), selected = "yellow"),
      splitLayout(
        radioButtons(inputId="plotext",
         label = "4. Ext, gráfico", choices = c("png", "pdf"),
         selected = "png"),
        radioButtons(inputId="tableext",
         label = "5. Ext. tabla", choices = c("csv", "txt"),
         selected = "csv")
      )
    ),
    mainPanel(
      tabsetPanel(type = "tab",
        tabPanel("Panel 1",
          textOutput(outputId = "text1"),
          plotOutput(outputId = "myhist")),
        tabPanel("Panel 2",
          verbatimTextOutput("summary")         
    )))
))

server <- function(input, output){
  colm <- reactive({
    as.numeric(input$var)
  })
  output$text1 <- renderText({
    paste("La variable de interés es: ", names(iris[colm()]))})
  output$myhist <- renderPlot({
    hist(iris[,colm()], col = input$colour,
         xlim = c(0, max(iris[, colm()])),
         main = "Histograma...", 
         breaks = seq(0, max(iris[,colm()]),
         l = input$bin + 1), xlab = names (iris[colm()]))})
  output$summary <- renderPrint({
            summary(iris)
    })
  output$downplot <- downloadHandler(
    filename = function(){
      paste("iris_hist", input$plotext, sep = ".")},
    content = function(file){
      if(input$plotext == "png")
        png(file)
      else
        pdf(file)
      hist(iris[,colm()])
      dev.off()}
  )
}

shinyApp(ui = ui, server = server)  


