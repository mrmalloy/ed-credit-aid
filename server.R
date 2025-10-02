
library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {

  
   observeEvent(input$do, {
        
     expenses1_tp <- renderText({
          
          input$box1 + input$otherExp
        
       })
        
        
      })
  
  
  
}
