
library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  
init_diff <- eventReactive(input$enter, {
  
  (input$box1 + input$otherExp) - input$box5 
  
})
  
option1_exp <- eventReactive(input$enter, {
  
  
  input$box1 + input$otherExp
  
})


option1_taxschol <- eventReactive(input$enter, {
  
  if (input$box1 > input$box5) {
    
    "N/A"
    
  } else {
    
    as.character(paste0("$", input$box5 - input$box1))
    
  }
  
  
})


option2_exp <- eventReactive(input$enter, {
  
  if(option1_exp() < 4000) {
    
    option1_exp()
    
    } else {
    
    4000
    
  }
  
})

option2_taxschol <- eventReactive(input$enter, {
  
  if(input$box1 < 4000 & input$box5 >= input$box1) {
    
  
  } else if  {
    
    
  }
  
  
})


option2_taxschol <- eventReactive(input$enter, {
  
  if (input$box1 > input$box5) {
    
    "N/A"
    
  } else {
    
    as.character(paste0("$", input$box5 - input$box1))
    
  }
  
  
})

observeEvent(input$enter, {
   
  output$option1 <- renderUI({
    
    HTML(
      sprintf("<p><b>Qualified Expenses:</b> $%s</p>
              <p><b>Taxable Scholarship:</b> %s</p>
              <p><b>Nontaxable Scholarship:</b> N/A</p>",
              as.character(option1_exp()),
              as.character(option1_taxschol())
                
             )
        )
      
  })   
    
   output$option2 <- renderUI({
     
     if (init_diff() >= 4000)  {
       
       HTML(
         sprintf(
           "Expenses already maximized - use option 1"
         )
       )
       
     }  else {
       
       HTML(
         sprintf("<p><b>Qualified Expenses:</b> $%s</p>
                  <p><b>Taxable Scholarship:</b> %s</p>
                  <p><b>Nontaxable Scholarship:</b> N/A</p>",
                  as.character(option2_exp()),
                  as.character(option2_taxschol()),
                  as.character(option2_nontaxschol())
                 
         )
       )
       
     }
     
       
       
       })
        
     # expenses1_tp <- renderText({
     #      
     #      input$box1 + input$otherExp
     #    
     #   })
  
})
  
}
