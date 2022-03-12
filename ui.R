library(shiny)
library(shinythemes)
library(data.table)
library(RCurl)
library(randomForest)


# Training set
over <- read.csv("over.csv", header = TRUE)

pageWithSidebar(                
                # Page header
                headerPanel("Prédiction du nombre de CD4/ Laboratoire d'immunologie"),
                
                # Input values
                sidebarPanel(
                  HTML("<h2>Paramètres d'entrée</h2>"),
                  selectInput("SEXE", label = "GENRE:", 
                              choices = list("Homme" = "1", "Femme" = "2"), 
                              selected = "1"),
                  sliderInput("AGE", label = "AGE :",
                              min = 18, max = 100,
                              value = 18),
                  selectInput("STADE", label = "STADE CDC du VIH:", 
                              choices = list("1" = "1", "2" = "2", "3"="3"), 
                              selected = "1"),
                  sliderInput("hb", label = "HEMOGLOBINE:",
                              min = 0, max = 18,
                              value = 7),
                  sliderInput("vgm", label = "VOLUME GLOBULAIRE SANGUIN:",
                              min = 0, max = 120,
                              value = 80),
                  sliderInput("gr",label =  "GLOBULE ROUGE:",
                              min = 1, max = 5,
                              value = 2),
                  sliderInput("plq", label = "PLAQUETTE:",
                              min = 0, max = 500,
                              value = 200),
                  sliderInput("ht", "HEMATOCRITE:",
                              min = 0, max = 60,
                              value = 40),
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

