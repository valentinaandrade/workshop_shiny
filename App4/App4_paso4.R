library(shiny)

ui <- fluidPage(
  titlePanel(title="Cuarta app de Shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "sepallenght",
                  "Sepal.Lenght:", min = 4.3, max = 7.9,
                  value = 5.8, step= 0.1),
      
      sliderInput(inputId = "sepalwidth",
                  "Sepal.Width:", min = 2, max = 4.4,
                  value = 3, step= 0.1),
      
      sliderInput(inputId = "petallenght",
                  "Petal.Lenght:", min = 1, max = 6.9,
                  value = c(1.6, 5.1)),
      
      sliderInput(inputId = "petalwidth",
                  "Petal.Width:", min = 0.1, max = 2.5,
                  value = 1.3, step = 0.3,
                  animate = animationOptions(
                    interval = 2600, loop = TRUE))),
    mainPanel())
)

server <- function(input, output){
  output$box <- renderPlot({
    sepall <- subset(iris, Sepal.Length >= 4.3 
                     & Sepal.Length < input$sepallength,
                     select = c(Sepal.Length, Species))
    
    sepalw <- subset(iris, Sepal.Width >= 2 
                     & Sepal.Width < input$sepalwidth,
                     select = c(Sepal.Width, Species))
    
    petall <- subset(iris, Petal.Length >= input$petallength[1] 
                     & Petal.Length < input$petallength[2],
                     select = c(Petal.Length, Species))
    
    petalw <- subset(iris, Petal.Width >= 0.1
                     & Petal.Width < input$petalwidth,
                     select = c(Petal.Width, Species))
  })
}

shinyApp(ui = ui, server = server)  
