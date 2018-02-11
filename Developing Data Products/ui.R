library(shiny)
shinyUI(fluidPage(
  
  titlePanel("Shiny Application and Reproducible Pitch"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("mon","Select the month",c("MAY","JUNE","JULY","AUGUST","SEPTEMBER"), selected = "MAY"),
      textInput("temp","Enter the temperature(50-100)")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("Plot1"),
      h3("Predicting Solar Radiation for given Month and Temperature"),
      textOutput("prediction")
    )
  )
))
