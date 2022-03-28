library(data.table)
library(randomForest)
library(RMySQL)
library(DT)


over <- read.csv("over.csv", header = TRUE)

# Read in the RF model
library(randomForest)

model <- readRDS("model.rds")

shinyServer(function(input, output, session) {
  # Input 
   datasetInput <- reactive({    
     table <- "responses"
    # outlook,temperature,humidity,windy,play
    df <- data.frame(
      Name = c("SEXE",
               "AGE",
               "STADE",
               "hb",
               "vgm",
               "gr",
               "plq",
               "ht",
               "tlc11"),
      Value = as.character(c(input$SEXE,
                             input$AGE,
                             input$STADE,
                             input$hb,
                             input$vgm,
                             input$gr,
                             input$plq,
                             input$ht,
                             input$tlc11)),
      stringsAsFactors = FALSE)
    
    cd4count <- "cd4count"
    df <- rbind(df, cd4count)
    input <- transpose(df)
    write.table(input,"input.csv", sep=",", quote = FALSE, row.names = FALSE, col.names = FALSE)
    test <- read.csv(paste("input", ".csv", sep=""), header = TRUE)
    test <- rbind(over[1,], test)
    test <- test[-1,]
    test$SEXE <- factor(test$SEXE, levels=c("1","2"))
    test$STADE <- factor(test$STADE, levels = c("1","2","3"))
    test$tlc11 <- factor(test$tlc11, levels=c("0","1"))
    test$cd4count <- factor(test$cd4count, levels = c("0","1"))  
     
    Output <- data.frame(Prediction=predict(model,test), round(predict(model,test,type="prob"), 3))
    print(Output)
    
  })
  
  # Status/Output Text Box
  output$contents <- renderPrint({
    if (input$submitbutton>0) { 
      isolate("Calculation complete.") 
    } else {
      return("Server is ready for calculation.")
    }
  })
  

  # Prediction results table
  output$table <- renderTable({
    if (input$submitbutton>0) { 
      isolate(setInput()) 
    } 
  })
  
})

