library(shiny)
library(tidyverse)
library(tidycensus)

# Define UI for application that draws a histogram
ui <- navbarPage(
    "Milestone 3",
    tabPanel("Final Milestone",
             mainPanel(titlePanel("Graphs of Data"),
                       imageOutput("data"),
                       imageOutput("data_2"))
    ),
    tabPanel("Model", 
             imageOutput("model"),
             p("This model looks at the average proficiency on English Language Arts tests 
               for white students within District 1 elementary and middle schools.")
             ),

    tabPanel("About", 
             titlePanel("About"),
             p("URL: https://github.com/hanarubykim/milestone-4.git"),
             h3("Data Sources"),
             p("Source: NYC DOE Demographic Snapshot (2013-2018)"),
             p("This annual school account of NYC public school student populations record the breakdown of students, by district,
             race, and an economic need index."),
             p("Source 2: NYC OpenData: Average SAT Scores for NYC Public Schools"),
             p("This source details the average SAT scores by public high school."),
             h3("Using the Sources"),
             p("I will clean and combine the datasets so that I can track correlations between school district race makeup,
             school district income makeup, and the average school performance to see if I can identify correlations."))
)

# Define server logic required to draw plot
server <- function(input, output){
    output$data <- renderImage({
        list(
            src = "data.png",
            width = 500,
            height = 500)
    })  
    
    output$data_2 <- renderImage({
        list(
            src = "data_2.png",
            width = 500,
            height = 500)
    })  
    
    output$model <- renderImage({
            list(
                src = "model.png",
                width = 500,
                height = 500)
        })  
}

# Run the application 
shinyApp(ui = ui, server = server)

