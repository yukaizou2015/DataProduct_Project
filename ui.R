library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Plotting HairEyeColor Dataset"),
        sidebarPanel(selectInput("list1", "Variable",
                                 c("Hair" = "haireye$Hair",
                                   "Eye" = "haireye$Eye",
                                   "Sex" = "haireye$Sex"
                                   )
                                 ),
                     submitButton('Submit')
                     ),
        mainPanel(verbatimTextOutput('list1'),
                  verbatimTextOutput('text2'),
                  plotOutput('Plot'))
)
)