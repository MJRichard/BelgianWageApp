#Bwages, has gender, experience education level, wage
#interactive plot of experience vs wage, possible highlight factors
#enter gender and education, calculate average wage

#absolutely no proactical use

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Belgium Wage Analysis by Experience and Education"),
  sidebarPanel(
    #maybe button to include both, or just one
    radioButtons('imeanoptions', 'Calculate mean of',
                 choices=list('Complete Data Set'='all',
                              'Defined Education for all Experience levels'='edu',
                              'Defined Experience for all Education levels'='exp',
                              'Defined Experience and Education levels'='both')
                 ),
    
    h3('Select Education Level'),
    numericInput('iedu', 'Education from 1 (low) to 5 (high)', 
                 1, min=1, max=5, step=1),
    h3('Select Experience Amount (years)'),
    sliderInput('iexp', 'Experience', 10, min=0, max=47, step=1)#,
    
    #submitButton('Submit')
    ),
  mainPanel(
    tabsetPanel(
      tabPanel("Plot",
        h3('1994 Belgian Wage Plot (euros)'),
        plotOutput('owageplot'),
        h3('The mean hourly wage of this category in 1994 Euros is'),
        textOutput('omean')
              ),
      tabPanel("Documentation",
              h5('This app uses the Bwages dataset from the Ecdat package to calculate the
                 mean hourly wage in Euros of Belgian workers in 1994. The dataset include 1472 observations
                 on the wages of Beligian workers with their education and job experience.
                  On the sidebar, the user can select
                 what subset of the data they would like to observe. The options include 
                looking at a specific education
                 or experience level while observing all the values of the other variable. The
                 final option is to look at a specific education and experience level.
                After selecting which variables to look at, the user then decides which 
                values of the selected variable they want to observe.
                For each option
                 selected, the main panel will show a plot of the selected data. Below the plot,
                 the mean wage of that category is calculated and displayed.') 
              )
    )
  )
  ))