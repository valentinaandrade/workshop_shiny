library(shiny)

ui <- fluidPage(
  titlePanel(title="Séptima app de Shiny"),
  sidebarLayout(
  sidebarPanel(
    selectInput(inputId = "data1",
                label = "Seleccione el conjunto de datos",
                choices = c("iris", "mtcars", "trees"))),
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
}

shinyApp(ui = ui, server = server)  
