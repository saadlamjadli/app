library(data.table)
library(ROSE)

# Read in the RF model
model <- readRDS("model.rds")

server(function(input, output, session) {
  # Input 
  setInput <- reactive({  
    
    # outlook,temperature,humidity,windy,play
    df <- data.frame(
      Name = c("STADE",
               "hb",
               "vgm",
               "plq",
               "ht",
               "tlc12"),
      Value = as.character(c(input$STADE,
                             input$hb,
                             input$vgm,
                             input$plq,
                             input$ht,
                             input$tlc12)),
      stringsAsFactors = FALSE)
    
    cd4count <- "cd4count"
    df <- rbind(df, cd4count)
    input <- transpose(df)
    write.table(input,"input.csv", sep=",", quote = FALSE, row.names = FALSE, col.names = FALSE)
    
    test <- read.csv(paste("input", ".csv", sep=""), header = TRUE)
    test <- rbind(train[1, ] , test)
    test$cd4count <- factor(test$cd4count, levels = "0", "1")
    
    
    Output <- data.frame(Prediction=predict(model,test), round(predict(model,test,type="prob"), 3))
    print(Output)
    
  })
  
  # Status/Output Text Box
  output$contents <- renderTable({
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
  
}
