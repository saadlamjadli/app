library(shiny)
library(data.table)
library(randomForest)
library(RMySQL)




# Training set
over <- read.csv("over.csv", header = TRUE)

fluidPage(
  # Page header
  headerPanel("Prediction du nombre de CD4/ Laboratoire d'immunologie"),
  
  # Input values
  sidebarPanel(
    HTML("<h2>Paramètres d'entrée</h2>"),
    
    selectInput("SEXE", label = "Genre:", 
                choices = list("homme" = "1", "femme" = "2"), 
                selected = "1"),
    sliderInput("AGE", label = "Age : / an",
                min = 18, max = 100,
                value = 18),
    selectInput("STADE", label = "STADE CDC du VIH :", 
                choices = list("1" = "1", "2" = "2", "3"="3"), 
                selected = "1"),
    sliderInput("hb", label = "Taux d'hémoglobine : g/dL",
                min = 4, max = 18,
                value = 4),
    sliderInput("vgm", label = "volume globulaire moyen: µm3",
                min = 70, max = 120,
                value = 70),
    sliderInput("gr",label =  "Nombre de globules rouge: millions par mm3",
                min = 2, max = 6,
                value = 2),
    sliderInput("plq", label = "Nombre de plaquette:*103 /mm³",
                min = 10, max = 500,
                value = 10),
    sliderInput("ht", "Taux d'hématocrite: en pourcentage",
                min = 30, max = 60,
                value = 30),
    selectInput("tlc11", label = "Nombre de lymphocyte: /mm3 ", 
                choices = list("<1100" = "0", ">=1100" = "1"), 
                selected = "0"),
    
    
    
    actionButton("submitbutton", "Soumettre", class = "btn btn-primary")
  ),
  
  mainPanel(
    tags$label(h3('État/Résultat')), # Status/Output Text Box
    verbatimTextOutput('contents'),
    tableOutput('table')
    
  )
)
