library(shiny)
library(data.table)
library(randomForest)
library(RMySQL)
library(DT)
library(caret)
library(tidyverse)



# Training set
over <- read.csv("over.csv", header = TRUE)

         fluidPage(                
                # Page header
                headerPanel("Prédiction du nombre de CD4/ Laboratoire d'immunologie"),
                
                # Input values
                sidebarPanel(
                  HTML("<h2>Paramètres d'entrée</h2>"),
                  selectInput("SEXE", label = "GENRE:", 
                              choices = list("Homme" = "1", "Femme" = "2"), 
                              selected = "1"),
                  sliderInput("AGE", label = "AGE : année",
                              min = 18, max = 100,
                              value = 18),
                  selectInput("STADE", label = "STADE CDC du VIH:", 
                              choices = list("1" = "1", "2" = "2", "3"="3"), 
                              selected = "1"),
                  sliderInput("hb", label = "HEMOGLOBINE: g/dl",
                              min = 5, max = 18,
                              value = 5),
                  sliderInput("vgm", label = "VOLUME GLOBULAIRE SANGUIN: µ3 ",
                              min = 50, max = 120,
                              value = 50),
                  sliderInput("gr",label =  "GLOBULE ROUGE: millions par microlitre",
                              min = 1, max = 5,
                              value = 1),
                  sliderInput("plq", label = "PLAQUETTE: *10^3/mm3",
                              min = 10, max = 500,
                              value = 10),
                  sliderInput("ht", "HEMATOCRITE: pourcentage",
                              min = 30, max = 60,
                              value = 30),
                  selectInput("tlc11", label = "NOMBRE DE LYMPHOCYTES: /mm3", 
                              choices = list("<1100" = "0", ">=1100" = "1"), 
                              selected = "0"),
                  
                  actionButton("submitbutton", "soumettre", class = "btn btn-primary")
),

  
mainPanel(
          tags$label(h3('État/résultat')), # Status/Output Text Box
          verbatimTextOutput('contents'),
          tableOutput('tabledata') # Prediction results table
                  
  )
)
