# App #2
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for an application that simply repeats what we type in
ui <- fluidPage(
  # Application title
  titlePanel("Parakeet App (It repeats what I say!!!)"),
  
  # Sidebar with an input for Text
  sidebarLayout(
    sidebarPanel(
      textInput("text_1","Say Something", value="Hello Data Club!!")
    ),
    
    # Show what I typed in
    mainPanel(
      textOutput("sentence")
    )
  )

)

# Define server logic required to print what I typed in
server <- function(input, output) {
  output$sentence <- renderText({
    input$text_1
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
