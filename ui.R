library(shiny)
library(shinythemes)

# Training set
over <- read.csv(text = getURL("https://github.com/saadlamjadli/app/blob/main/over.csv") )

pageWithSidebar(                
                # Page header
                headerPanel("lymphocyte prediction/ Laboratoire d'immunologie"),
                
                # Input values
                sidebarPanel(
                  HTML("<h3>Input parameters</h3>"),
                  selectInput("SEXE", label = "SEXE:", 
                              choices = list("homme" = "1", "femme" = "2"), 
                              selected = "1"),
                  sliderInput("AGE", label = "age :",
                              min = 0, max = 100,
                              value = 0),
                  selectInput("STADE", label = "STADE:", 
                              choices = list("1" = "1", "2" = "2", "3"="3"), 
                              selected = "0"),
                  sliderInput("hb", label = "hemoglobine:",
                              min = 0, max = 18,
                              value = 0),
                  sliderInput("vgm", label = "volume globulaire moyen:",
                              min = 0, max = 120,
                              value = 0),
                  sliderInput("gr",label =  "globule rouge:",
                              min = 0, max = 5,
                              value = 0),
                  sliderInput("plq", label = "plaquette:",
                              min = 0, max = 500,
                              value = 0),
                  sliderInput("ht", "hematocrite:",
                              min = 0, max = 80,
                              value = 0),
                  selectInput("tlc12", label = "lymphocyte:", 
                              choices = list("<1200" = "0", ">=1200" = "1"), 
                              selected = "0"),
                  
                  actionButton("submitbutton", "Submit", class = "btn btn-primary")
                ),
                
                mainPanel(
                  tags$label(h3('Status/Output')), # Status/Output Text Box
                  verbatimTextOutput('contents'),
                  tableOutput('tabledata') # Prediction results table
                  
                )
)

