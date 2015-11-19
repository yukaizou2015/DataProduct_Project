library(shiny)
shinyServer(
        function(input, output) {
                output$list1 <- renderPrint({input$list1})
                output$text2 <- renderPrint({
                        if(input$list1 == "haireye$Hair") tapply(haireye$Freq, haireye$Hair, sum)
                        else if(input$list1 == "haireye$Eye") tapply(haireye$Freq, haireye$Eye, sum)
                                else if(input$list1 == "haireye$Sex") tapply(haireye$Freq, haireye$Sex, sum)
                                
                })
                output$Plot <- renderPlot({
                        haireye <- as.data.frame(HairEyeColor)
                        if(input$list1 == "haireye$Hair") barplot(tapply(haireye$Freq, haireye$Hair, sum))
                        else if (input$list1 == "haireye$Eye") barplot(tapply(haireye$Freq, haireye$Eye, sum))
                        else if (input$list1 == "haireye$Sex") barplot(tapply(haireye$Freq, haireye$Sex, sum))
                })
        }
        )