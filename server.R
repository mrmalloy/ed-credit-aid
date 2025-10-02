
library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  
option1_exp <- eventReactive(input$enter, {
  
  if (input$box1 < input$box5) {
    
    0
  
  } else {
    
    
   (input$box1 + input$otherExp) - input$box5
    
        
  }

  
})


option1_taxschol <- eventReactive(input$enter, {
  
  if (input$box1 + input$otherExp > input$box5) {
    
    "N/A"
    
  } else {
    
    input$box5 - (input$box1 + input$otherExp)
    
  }
  
  
})

option1_nontaxschol <- eventReactive(input$enter, {
  
  if(input$box5 == 0) {
    
    0
    
  } else if (input$box1 + input$otherExp > input$box5) {
    
    input$box5
    
  } else if (input$box5 > input$box1 + input$otherExp) {
    
    input$box1 + input$otherExp
    
  }
  
  
})

option2_exp <- eventReactive(input$enter, {
  
  if(input$box1 + input$otherExp < 4000) {
    
    input$box1 + input$otherExp
    
    } else {
    
   4000
    
  }
  
})

option2_taxschol <- eventReactive(input$enter, {

  if(input$box1 < 4000 & input$box5 >= input$box1) {

    
    input$box1 + input$otherExp + option1_taxschol()
    

  } else if (input$box1 > 4000 & input$box1 > input$box5) {


    4000 - ((input$box1 + input$otherExp) - input$box5)
    
  } else if (input$box5 < 4000) {
    
    input$box5
    
  } else  { #if (input$box5 - input$box1 > 4000) {
    
    (input$box5 - input$box1) + input$otherExp
    
  }


})


option2_nontaxschol <- eventReactive(input$enter, {
  
  if(option2_taxschol() == input$box5) {
    
    0
    
  } else {
    
    input$box5 - option2_taxschol()
    
  }
  
  
})

observeEvent(input$enter, {
   
  output$option1 <- renderUI({
    
    HTML(
      sprintf("<p><b>Qualified Expenses:</b> $%s</p>
              <p><b>Taxable Scholarship:</b> $%s</p>
              <p><b>Nontaxable Scholarship:</b> $%s</p>",
              as.character(option1_exp()),
              as.character(option1_taxschol()),
              as.character(option1_nontaxschol())
                
             )
        )
      
  })   
    
   output$option2 <- renderUI({
     
     if (option1_exp() >= 4000)  {
       
       HTML(
         sprintf(
           "Expenses already maximized - use option 1"
         )
       )
       
     }  else if (input$box5 == 0) {
       
       HTML(
         sprintf(
           "No scholarship to reclassify - use option 1"
         )
       )
       
       
     } else {
       
       HTML(
         sprintf("<p><b>Qualified Expenses:</b> $%s</p>
                  <p><b>Taxable Scholarship:</b> $%s</p>
                  <p><b>Nontaxable Scholarship:</b> $%s</p>",
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
