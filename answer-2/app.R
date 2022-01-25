# Answer for App #2
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
    titlePanel("Delayed Parakeet App"),
    
    # Sidebar with an input for Text
    sidebarLayout(
        sidebarPanel(
            textInput("text_1","Say Something", value="Hello Data Club!!"),
            # This is a major difference from the app in 'app-example-1'
            # We introduce an actionButton
            actionButton("click_button","Click Me!!")
        ),
        
        # Show what I typed in
        mainPanel(
            textOutput("sentence")
        )
    )
    
)

# Define server logic required to print what I typed in
server <- function(input, output) {
    
    # 'eventReactive' is useful to delay updating a value until I click a button
    input_text <- eventReactive(input$click_button, {
        input$text_1
    })
    
    output$sentence <- renderText({
        input_text()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
