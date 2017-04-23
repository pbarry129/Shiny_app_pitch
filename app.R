liblibrary(shiny)

ui <- fluidPage(
  numericInput("n", "Choose the size of the square matrix (1-6)", min=1, max=6, value=3),
  actionButton("goButton", "Display matrices with product or scatterplot"),
  checkboxInput("showProduct", "Display Product (ticked)/Display scatterplot (not ticked)", value=TRUE),
  verbatimTextOutput("textA"),
  verbatimTextOutput("textB"),
  verbatimTextOutput("textC"),
  plotOutput("plot")
)

server <- function(input, output) { 
  
  ntext <- eventReactive(input$goButton, {
    input$n
  })
  
  output$textn <- renderText({
    ntext()
  })
  
  logic<-reactive({input$showProduct})
  output$textL<-renderPrint({logic()})
  output$textLL<-renderPrint({input$showProduct})
  
  dataX<-reactive({runif(ntext()*ntext())})
  dataY<-reactive({runif(ntext()*ntext())})
  
  
  AMat<-reactive({matrix(round(10*dataX()), ncol=ntext())})
  BMat<-reactive({matrix(round(10*dataY()), ncol=ntext())})
  CMat<-reactive(AMat()%*%BMat())
  

  output$textA<-renderPrint({AMat()})
  output$textB<-renderPrint({BMat()})
  output$textC<-renderPrint({if(logic()){CMat()}})
  
  output$plot<-renderPlot({if(!logic()){plot(dataX(),dataY(),xlab="normalized first matrix", ylab="normalized second matrix",main="Plot of normalized matrix two versus normalized matrix one")}})
  
  
}

shinyApp(ui, server)