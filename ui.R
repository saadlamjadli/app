library(shiny)
library(shinythemes)
library(data.table)
library(RCurl)
library(randomForest)


# Training set
over <- read.csv("over.csv", header = TRUE)

pageWithSidebar(                
                # Page header
                headerPanel("Prédiction du nombre de lymphocytes CD4/ Laboratoire d'immunologie"),
                
                # Input values
                sidebarPanel(
                  HTML("<h3>Paramètres d'entrée</h3>"),
                  selectInput("SEXE", label = "GENRE:", 
                              choices = list("Homme" = "1", "Femme" = "2"), 
                              selected = "1"),
                  sliderInput("AGE", label = "AGE :",
                              min = 0, max = 100,
                              value = 0),
                  selectInput("STADE", label = "STADE CDC du VIH:", 
                              choices = list("1" = "1", "2" = "2", "3"="3"), 
                              selected = "0"),
                  sliderInput("hb", label = "HEMOGLOBINE:",
                              min = 0, max = 18,
                              value = 0),
                  sliderInput("vgm", label = "VOLUME GLOBULAIRE SANGUIN:",
                              min = 0, max = 120,
                              value = 0),
                  sliderInput("gr",label =  "GLOBULE ROUGE:",
                              min = 0, max = 5,
                              value = 0),
                  sliderInput("plq", label = "PLAQUETTE:",
                              min = 0, max = 500,
                              value = 0),
                  sliderInput("ht", "HEMATOCRITE:",
                              min = 0, max = 80,
                              value = 0),
                  selectInput("tlc12", label = "NOMBRE DE LYMPHOCYTES:", 
                              choices = list("<1200" = "0", ">=1200" = "1"), 
                              selected = "0"),
                  
                  actionButton("submitbutton", "Submit", class = "btn btn-primary")
),

  
mainPanel(
          tags$label(h3('État/résultat')), # Status/Output Text Box
          verbatimTextOutput('contents'),
          tableOutput('tabledata') # Prediction results table
                  
  )
)

