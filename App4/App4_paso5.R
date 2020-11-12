library(shiny)

ui <- fluidPage(
  titlePanel(title="Cuarta app de Shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "sepallength",
                  "Sepal.Lenght:", min = 4.3, max = 7.9,
                  value = 5.8, step= 0.1),
      
      sliderInput(inputId = "sepalwidth",
                  "Sepal.Width:", min = 2, max = 4.4,
                  value = 3, step= 0.1),
      
      sliderInput(inputId = "petallength",
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
    
    test <- ggplot(sepall , aes(x = Species, y = Sepal.Length))
                    + geom_boxplot() + theme_bw()
    
    testb <- ggplot(sepalw , aes(x = Species, y = Sepal.Width))
    + geom_boxplot() + theme_bw()

    testc <- ggplot(petall , aes(x = Species, y = Petal.Length))
    + geom_boxplot() + theme_bw()
    
    testd <- ggplot(petalw , aes(x = Species, y = Petal.Width))
    + geom_boxplot() + theme_bw()
    
    grid.arrange(test, testb, testc, testd, nrow = 1)
    
    })
}

shinyApp(ui = ui, server = server)  
