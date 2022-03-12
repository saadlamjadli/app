library(shiny)
library(data.table)
library(randomForest)


# Training set
over <- read.csv("over.csv", header = TRUE)

pageWithSidebar(                
                # Page header
                headerPanel("Prédiction du nombre de CD4/ Laboratoire d'immunologie"),
                
                # Input values
                sidebarPanel(
                  HTML("<h3>Paramètres d'entrée</h3>"),
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
                              min = 5, max = 18,
                              value = 5),
                  sliderInput("vgm", label = "VOLUME GLOBULAIRE SANGUIN:",
                              min = 50, max = 120,
                              value = 50),
                  sliderInput("gr",label =  "GLOBULE ROUGE:",
                              min = 1, max = 5,
                              value = 1),
                  sliderInput("plq", label = "PLAQUETTE:",
                              min = 10, max = 500,
                              value = 10),
                  sliderInput("ht", "HEMATOCRITE:",
                              min = 30, max = 60,
                              value = 30),
                  selectInput("tlc12", label = "NOMBRE DE LYMPHOCYTES:", 
                              choices = list("<1200" = "0", ">=1200" = "1"), 
                              selected = "0"),
                  
                  actionButton("submitbutton", "soumettre", class = "btn btn-primary")
),

  
mainPanel(
          tags$label(h3('État/résultat')), # Status/Output Text Box
          verbatimTextOutput('contents'),
          tableOutput('tabledata') # Prediction results table
                  
  )
)

