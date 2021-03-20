library(shiny)
library(tidyverse)
library(tidycensus)
source("plot.R")

# Define UI for application that draws a histogram
ui <- navbarPage(
    "Milestone 3",
    tabPanel("Final Milestone",
             mainPanel(plotOutput("data"),
                       plotOutput("data_2"))
    ),
    tabPanel("About", 
             titlePanel("About"),
             p("URL: https://github.com/hanarubykim/milestone-4.git"),
             h3("Data Sources"),
             p("Source 1: NYC DOE Demographic Snapshot (2013-2018)"),
             p("This annual school account of NYC public school student populations record the breakdown of students, by district,
             race, and an economic need index."),
             p("Source 2: NYC OpenData: Average SAT Scores for NYC Public Schools"),
             p("This source details the average SAT scores by public high school."),
             h3("Using the Sources"),
             p("I will clean and combine the datasets so that I can track correlations between school district race makeup,
             school district income makeup, and the average school performance to see if I can identify correlations.")))

# Define server logic required to draw plot
server <- function(input, output){
    output$data <- renderPlot({
        data
    })
    output$data_2 <- renderPlot({
        data_2
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

