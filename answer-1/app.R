# Answer to App #3
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(palmerpenguins)
library(ggplot2)
library(tidyr)
library(dplyr)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Palmer Penguins Data Exploration"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("species", 'Species', unique(penguins$species),
                        selected="Adelie"),
            selectInput("x_column", 'X Column', colnames(penguins)[3:6], selected=colnames(penguins)[3]),
            selectInput("y_column", "Y Column", colnames(penguins)[3:6], selected=colnames(penguins)[4])
        ),
        # Show a scatterplot of the selected input
        mainPanel(
            plotOutput("scatterPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    # 'reactive' function to filter for the species selected using 'input$species'
    selectedSpecies <- reactive({
        penguins %>% dplyr::filter(species==input$species)
    })
    
    # 'render' function to plot the scatterplot using reactive object 'selectedSpecies'
    output$scatterPlot <- renderPlot({
        ggplot(selectedSpecies(), aes_string(x=input$x_column, y=input$y_column)) + 
            geom_point() + labs(x=input$x_column, y=input$y_column)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
