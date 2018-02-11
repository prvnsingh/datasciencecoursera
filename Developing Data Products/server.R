
library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  a <- airquality
  a$Month<-factor(a$Month, levels = c(5,6,7,8,9),
                  labels = c("MAY","JUNE","JULY","AUGUST","SEPTEMBER"))
  a$Month<-as.factor((a$Month))
   fit <- lm(Solar.R~Temp+Month,a)
   fitpredict <- reactive({
     monthinput <- input$mon
     tempinput <- input$temp
     predict(fit,newdata = data.frame(Month = monthinput,Temp = as.numeric(tempinput)))
   })
  output$Plot1 <- renderPlot({
    monthinput <- input$mon
    tempinput <- as.numeric(input$temp)
    ggplot(a,aes(x=Temp,y=Solar.R))+
    geom_point(data = subset(a,Month == monthinput), color = "red")+
    geom_smooth(method = "lm")+
    geom_point(aes(x=tempinput,y=fitpredict()),color = "black",size = 3)
  })
  output$prediction <- renderText({
    fitpredict()
  })
})
