library(shiny)
shinyUI(fluidPage(
  
  titlePanel("Shiny Application-Predicting Solar Radiation for given Month and Temperature"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("mon","Select the month",c("MAY","JUNE","JULY","AUGUST","SEPTEMBER"), selected = "MAY"),
      textInput("temp","Enter the temperature(50-100)"),
      h4("Predicted Solar Radiation"),
      textOutput("prediction")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Airquality data set of R is used in making this application.
         The graph depicts the variation of solar radiation with respect of temperature for selected Month.
         The line depicts the Linear Regression Model fitted to predict the solar radiation for particular temperature.
         Select the months from options and enter the Temperature and see the forecast"),
      plotOutput("Plot1")
      
    )
  )
))
