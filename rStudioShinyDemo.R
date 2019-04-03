library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
    plotOutput("hist")
)

# save output to output object, use render function to make output,
# and have output dependent on input, reactivity will work. 
# server function assembles input values into outputs 

server <- function(input, output, session) {
  output$hist <- renderPlot ({ 
    hist(rnorm(input$num))
    })



shinyApp(ui, server)


