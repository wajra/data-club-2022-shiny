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
      textOutput("sentence"),
      # We are using some HTML elements below. You can include them to include
      # static text and some basic styling to the web app
      # Line breaker
      br(),
      # Heading 3
      h3("Understanding how Shiny works.."),
      # Paragraph
      p("Shiny input and output elements are reactive. An output element will get updated
        by the server as soon as the input element changes.")
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

# Exercise

# Most of us are slow typers. So it might actually be annoying if the element starts 
# updating before we are done typing. So how do we delay updating the output element
# until we are done typing.

# Check 'answer-2'
