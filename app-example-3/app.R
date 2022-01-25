# App #3
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
                        selected="Adelie")
        ),
        # Show a scatterplot of the selected input
        mainPanel(
           plotOutput("scatterPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    selectedSpecies <- reactive({
        penguins %>% dplyr::filter(species==input$species)
    })
    
    output$scatterPlot <- renderPlot({
        correlation <- round(cor(selectedSpecies()$bill_length_mm, selectedSpecies()$bill_depth_mm, method=c("pearson"), use="complete.obs"),2)
        ggplot(selectedSpecies(), aes(x=bill_length_mm, y=bill_depth_mm)) + 
            xlim(30,50) + ylim(10,25) +
            geom_point() + labs(x="Bill Length (mm)", y="Bill Depth (mm)") +
            annotate("text",label=paste("r=",correlation),x=48, y=24, size=8)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

# Adding some more context to the 


# Exercise
# There are variables in the 'palmerpenguins' other than bill length and bill depth
# It would be interesting to get the other variables as options to show in the dashboard
# Let's give it a try

# Answer is in 'answer-1'