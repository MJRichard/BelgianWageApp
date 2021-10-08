## Belgian Wage Analysis App README

This app was developed for an assignment in the Developing Data Products class in the Data Science specialization offered by Johns Hopkins through Coursera. The assignment is an introduction to shiny and requires an input with reactive output and a documentation.

The app is deployed on shinyapps.io and can be viewed [here](https://mjrichard.shinyapps.io/AppBelgiumWage/)

This app uses the Bwages dataset from the Ecdat package to calculate the mean hourly wage in Euros of Belgian workers in 1994. The dataset include 1472 observations on the wages of Beligian workers with their education and job experience. On the sidebar, the user can select what subset of the data they would like to observe. The options include looking at a specific education or experience level while observing all the values of the other variable. The final option is to look at a specific education and experience level. After selecting which variables to look at, the user then decides which values of the selected variable they want to observe.For each option selected, the main panel will show a plot of the selected data. Below the plot, the mean wage of that category is calculated and displayed.
