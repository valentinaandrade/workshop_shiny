library(shiny)

ui <- fluidPage(
  titlePanel(title="Séptima app de Shiny"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "data1",
                  label = "Seleccione el conjunto de datos",
                  choices = c("iris", "mtcars", "trees")),
      uiOutput("vx"),
      uiOutput("vy")
    ),
    mainPanel())
  )

server <- function(input, output){
  var <- reactive({
    switch(input$data1,
           "iris" = names(iris),
           "mtcars" = names(matcars),
           "trees" = names(trees))
  })
  output$vx <- renderUI({
    selectInput("variablex", "Seleccione la variable X",
                choices = var())
  })
  output$vy <- renderUI({
    selectInput("variabley", "Seleccione la variable Y",
                choices = var())
  })
  output$plot <- renderPlot({
    lm.out = lm(get(input$variabley)~
                  get(input$variablex), data = get(input$data1))
    plot(get(input$variabley)~
           get(input$variablex), data = get(input$data1),
         xlab = input$variablex , ylab = input$variabley,
         main = "Regresión Lineal")
    abline(lm.out, col="red")
  })
}

shinyApp(ui = ui, server = server)  
