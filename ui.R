library(shiny)
library(bslib)

page_sidebar(
  
  theme = bs_theme(navbar_bg = "#956087"),
  
  title = h3(strong("Education Credits Aid")),
  
  sidebar = sidebar(width = "25%",
                    bg = "#956087",
                    includeHTML("sidebar_text.html"),
                    img(src = "logo.png",
                        width = "17%",
                        height = "auto",
                        style = "position: fixed; bottom: 40px; left: 48px;")
                    ),
                  
  card(max_height = 800,
       full_screen = FALSE,
       card_header(h5(strong("Enter Initial Information"))),
      
       card_body(
         layout_columns(
              col_widths = c(4, 4, 4),
              
              div(
                  numericInput("box1",
                               label = h6("1098-T Box 1 - Qualified tuition & expenses"),
                               value = NA,
                               min = 0
                               ),
              
                  numericInput("box5",
                           label = h6(("1098-T Box 5 - Scholarships & grants")),
                           value = NA,
                           min = 0
                           ),
              
                  numericInput("otherExp",
                           label = h6("Other qualified expenses"),
                           value = NA,
                           min = 0
                           ),
                    ),   ## end div
              
              
              div(
                  radioButtons("studentType",
                             label = h6("The student is the:"),
                             choiceNames = list("taxpayer", "taxpayer's dependent"),
                             choiceValues = list("taxpayer", "taxpayer's dependent"),
                             inline = TRUE
                              ),
                  radioButtons("otherCredits",
                             label = h6("Is the taxpayer receiving earned income credit or additional child tax credit?"),
                             choiceNames = list("Yes", "No"),
                             choiceValues = list("Yes", "No"),
                             inline = TRUE
                              ),

                  br(),
                  
                  actionButton("enter",
                               "Generate Taxslayer Entry Values",
                               icon("calculator"),
                               style ="color: #fff; background-color: #00B0B8;",
                               class = "btn-lg")
                  
                  ),  ## end div
               
              div(textInput("preparerName",
                            label = "Preparer Name"),
                  textInput("taxpayerName",
                            label = "Taxpayer Name"),
                  textInput("taxYr",
                            "Tax Year"),
                  h6("When you have completed this form, click here to print your results. Print 2 copies, one for the client's records and one to staple with P+P paperwork.")
                  )
              
                        )  ## end layout columns
                ) ## end card_body

           ),  ## end card
       
  
  layout_columns(height = 400,
    
              card(card_header(h5(strong("Option 1 – Baseline Values"))),
                   h6(uiOutput("option1")),
                   h6("Enter the above amounts into TaxSlayer, and record refund amounts:"),
                   textInput("opt1_fed",
                             "Federal"),
                   textInput("opt1_m1",
                             "M1"),
                   textInput("opt1_m1pr",
                             "M1PR"),
                   
                  ),
              card(card_header(h5(strong("Option 2 – Maximum Expenses"))),
                   h6(uiOutput("option2")),
                   h6("Enter the above amounts into TaxSlayer, and record refund amounts:"),
                   textInput("opt2_fed",
                             "Federal"),
                   textInput("opt2_m1",
                             "M1"),
                   textInput("opt2_m1pr",
                             "M1PR"),
                   ),
              card(card_header(h5(strong("Option 3 – Variable Expenses"))))
    
                )

          )

