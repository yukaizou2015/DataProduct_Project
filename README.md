# Exploring Car Performance by Different Characteristics
This repository contains the project for the class "Data Product" in Data Science Specialization. The Shiny application was written in R, consisting of [ui.R](https://github.com/yukaizou2015/DataProduct_Project/blob/master/ui.R) and [server.R](https://github.com/yukaizou2015/DataProduct_Project/blob/master/server.R) The application has been published at Shinyapp.io and can be found [here](https://yukaizou2015.shinyapps.io/DataProduct_Project). There is also a [slidify presentation](http://rpubs.com/yukaizou2015/DevProd_Presentation) for this application.

This application is a simple yet brief demonstration of using R to make an interactive product for users to explore certain dataset. `mtcars` dataset in R is used for this application.  

The inputs are arranged in the sidebar panel (on the left), and the outputs are arranged in the main panel (on the right).

## Sidebar Panel
The sidebar panel contains several components:  
- A list of parameters of cars. By selecting parameter in the list, users can investigate the coefficients of the linear model between `mpg` and the chosen parameter, as well as making an exploratory plot for `mpg` against the chosen variable;  
- A slider with a range of values. By choosing the value on the slider, users can define a weight value and predict what the miles per gallon will be;  
- A submit button. Clicking the button will refresh the main panel with the new inputs specified by users.

## Main Panel
There are several items displayed on the main panel.  
- **You selected:** print out the variable name of the corresponding parameter chosen by users;  
- **Coefficients Summary:** print out the estimates, standard errors, t values, and p values calculated from the linear regression;  
- A text output showing the predicted `mpg` value;  
- **Exploratory Plot:** plot the relationship between `mpg` and the chosen parameter, in either dotplots or boxplot. For `mpg` against weight, a fitted regression line also plotted in red color, the blue vertical line shows where the slider input is, and the intersect of the two lines is highlighted with a large black dot, showing the location of the predicted point.