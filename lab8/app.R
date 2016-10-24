---
runtime: shiny
output: html_document
---



library(shiny)
data=read.csv("Advertising.csv")


ui=fluidPage(
  actionButton("click", label="Generate Graph"),
  selectInput("select", label = h3("Select Box"),
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
  output$graph=renderPlot({plot(x,data$Sales, ylab="Sales", main="Impact of Advertising on Sales", xlab=input$select)})
  })
}

shinyApp(ui = ui, server = server)





