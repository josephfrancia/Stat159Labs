---
runtime: shiny
output: html_document
---



```{r pressure, echo=FALSE}
library(shiny)
data=read.csv("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-hw03/data/Advertising.csv")


ui=fluidPage(
  actionButton("click", label="Generate Graph"),
  radioButtons("select", label = h3("Advertising Medium"),
      choices = list("Radio" = "Radio", "Newspaper" = "Newspaper", "Television" =       "Television")), 
  plotOutput("graph"))

server=function(input, output){
  observeEvent(input$click,{
  if(input$select=="Radio"){
    x=data$Radio
  }
  if(input$select=="Newspaper"){
    x=data$Newspaper
  }
  if(input$select=="Television"){
    x=data$Television
  }
  output$graph=renderPlot({plot(x,data$Sales)})
  })
}

shinyApp(ui = ui, server = server)




```
