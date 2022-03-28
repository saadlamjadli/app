library(shiny)

port <- Sys.getenv('PORT')

shiny::runApp(
  appDir = getwd(),
  host = 'us-cdbr-east-05.cleardb.net',
  port = as.numeric(3306)
)
