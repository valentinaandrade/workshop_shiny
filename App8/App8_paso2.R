library(shiny)
library(ggplot2)
library(lattice)

ui <- fluidPage(
  titlePanel(title="Octava app de Shiny"),
  sidebarLayout(
    sidebarPanel(
      fileInput(inputId = "file", label = "Cargue sus datos"),
      checkboxInput(inputId = "header", label = "Encabezado", value = FALSE),
      radioButtons(inputId = "sep" , label= "Separador", 
                   choices = c(Coma = ",", Punto_Coma = ";", Tab = "\t", Espacio = " "),
                   
                   #choices = c(Comma = ",", Semicolon = ";", Tab = "\t", Space = " "),
                   selected = ","),
    ),
    mainPanel()
  )
)

server <- function(input, output){
  data <- reactive({
    file1 <- input$file
    if(is.null(file1)){return()}
    read.table(file = file1$datapath, sep = input$sep,
               header = input$header)})
  
  output$filedf <- renderTable({
   if(is.null(data())){return()}
    input$file})

  output$sum <- renderPrint({
    if(is.null(data())){return()}
    summary(data())})
  
  output$table <- renderTable({
    if(is.null(data())){return()}
    data()})
}

shinyApp(ui = ui, server = server)  

