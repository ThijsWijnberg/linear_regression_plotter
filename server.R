library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  output$contents <- renderPlot({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    selectedData <- read.csv(inFile$datapath, header=input$header,dec = input$dec, sep=input$sep, 
             quote=input$quote)
   # myReg <- lm(data = selectedData, Y ~ X1)
   # coef <- myReg$coefficients
    ourPlot <-ggplot(data = selectedData, aes(x = X1, y = Y))+
      ggtitle("Linear regression in Shiny")+
      labs(x="Our X variable",y="Our Y Variable")+
    geom_point() +
    geom_smooth(method="lm",se=input$se)
    ourPlot
      #geom_abline(intercept = coef[1],slope = coef[])
  })
})