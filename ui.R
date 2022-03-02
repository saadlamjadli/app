library(shiny)

# Training set
TrainSet <- read.csv("training.csv", header = TRUE)

pageWithSidebar(
                  
                  # Page header
                  headerPanel("lymphocyte prediction/ Laboratoire d'immunologie"),
                  
                  # Input values
                  sidebarPanel(
                    HTML("<h3>Input parameters</h3>"),
                    
                    selectInput("STADE", label = "STADE:", 
                                choices = list("1" = "1", "2" = "2", "3"="3"), 
                                selected = "1"),
                    sliderInput("hb", "hemoglobine:",
                                min = 0, max = 18,
                                value = 0),
                    sliderInput("vgm", "volume globulaire moyen:",
                                min = 0, max = 120,
                                value = 0),
                    sliderInput("plq", "plaquette:",
                                min = 0, max = 400,
                                value = 0),
                    sliderInput("ht", "hematocrite:",
                                min = 0, max = 80,
                                value = 0),
                    selectInput("tlc12", label = "lymphocyte:", 
                                choices = list("<1200" = "<1200", ">1200" = ">1200"), 
                                selected = "0"),
                    
                    actionButton("submitbutton", "Submit", class = "btn btn-primary")
                  ),
                  
                  mainPanel(
                    tags$label(h3('Status/Output')), # Status/Output Text Box
                    verbatimTextOutput('contents'),
                    tableOutput('table') # Prediction results table
                    
                  )
  )
