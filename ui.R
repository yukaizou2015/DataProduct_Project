library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Exploring Cars' Performance by Different Characteristics"),
        sidebarPanel(selectInput("list1", "Select a parameter:",
                                 c("Weight" = "mtcars$wt",
                                   "Number of cylinders" = "mtcars$cyl",
                                   "Transmission" = "mtcars$am",
                                   "Number of forward gears" = "mtcars$gear",
                                   "Number of carburetors" = "mtcars$carb"
                                   )
                                 ),
                     sliderInput('slide', 'Select a weight value for prediction:',
                                 min = min(mtcars$wt), max = max(mtcars$wt), value = 2, ticks = F),
                     submitButton('Submit')
                     ),
        mainPanel(h2('You selected:'),
                  verbatimTextOutput('list1'),
                  h2('Coefficients:'),
                  verbatimTextOutput('text1'),
                  textOutput('text2'),
                  h2('Plot:'),
                  plotOutput('Plot'))
)
)