library(shiny)
data(mtcars)

shinyServer(
        function(input, output) {
                output$list1 <- renderPrint({c(input$list1)})
                output$text1 <- renderPrint(
                        if(input$list1 == "mtcars$cyl") summary(lm(mpg ~ factor(cyl) - 1, data = mtcars))$coef
                        else if(input$list1 == "mtcars$wt") summary(lm(mpg ~ wt, data = mtcars))$coef
                        else if(input$list1 == "mtcars$am") summary(lm(mpg ~ factor(am) - 1, data = mtcars))$coef
                        else if(input$list1 == "mtcars$gear") summary(lm(mpg ~ factor(gear) - 1, data = mtcars))$coef
                        else if(input$list1 == "mtcars$carb") summary(lm(mpg ~ factor(carb) - 1, data = mtcars))$coef
                        )
                        output$text2 <- renderText({paste("The predicted output is:", round(lm(mpg ~ wt, data = mtcars)$coef[1] + lm(mpg ~ wt, data = mtcars)$coef[2] * as.numeric(input$slide),2), "mpg. Check out the plot of mpg against weight.", sep = " ")
                            })
                output$Plot <- renderPlot({
                        if(input$list1 == "mtcars$cyl") boxplot(mpg ~ cyl, mtcars, col = "gray", xlab = "Number of cylinders", ylab = "Miles per gallon")
                        else if (input$list1 == "mtcars$wt") {
                                plot(y = mtcars$mpg, x = mtcars$wt, pch = 20, xlab = "weight (lb/1000)", ylab = "Miles per gallon")
                                abline(lm(mpg ~ wt, data = mtcars)$coef[1], lm(mpg ~ wt, data = mtcars)$coef[2], col = "red")
                                abline(v = input$slide, col = "blue", lwd = 2)
                                points(x = as.numeric(input$slide), 
                                       y = lm(mpg ~ wt, data = mtcars)$coef[1] + lm(mpg ~ wt, data = mtcars)$coef[2] * as.numeric(input$slide), pch = 19)
                        }
                        else if (input$list1 == "mtcars$am") {
                                boxplot(mpg ~ am, mtcars, col = "yellow", xlab = "Modes of transmission", ylab = "Miles per gallon", xaxt = "n")
                                axis(1, at = c(1,2), labels = c("automatic", "manual"))
                        } 
                        else if (input$list1 == "mtcars$gear") boxplot(mpg ~ gear, mtcars, col = "lightgreen")
                        else if (input$list1 == "mtcars$carb") boxplot(mpg ~ carb, mtcars, col = "lightblue")
                })
})