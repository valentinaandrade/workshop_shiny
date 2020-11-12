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
                         # tableOutput(outputId = "summary")
                  )))
  ))

server <- function(input, output){}

shinyApp(ui = ui, server = server)  


