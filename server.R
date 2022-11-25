

library(shiny)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  

  ##### best method eventReactive ###############
  # ignoreNULL=F argument gets to code to run at 
  # the beginning when button has not been pressed yet (Null)
  data <- eventReactive(input$buttonSubmit, {
    numsamples <- input$number_of_samples
    N <- input$sample_size
    mu <- input$pop_mean
    s <- input$pop_sd
    sample_means <- c()
    for (i in 1:numsamples) {
      samp <- rnorm(n=N,mean=mu,sd=s)
      sample_mean <- mean(samp)
      sample_means <- c(sample_means, sample_mean)
    }

    sample_means #the last line "returns" the data 
  }, ignoreNULL = F) 
  
      output$stats <- renderTable({
        m <- round(mean(data()),2)
        std<-round(sd(data()),2)
        tab<-data.frame(Mean=m, SD=std)
      })

          output$distPlot <- renderPlot({
          s <- floor(min(data()))
          e <- ceiling(max(data()))
          rng <- e-s
          binsize <- isolate(input$binsize) #isolate is needed to make sure only button triggers
          lngt<-ceiling(rng/binsize)
          e<-s+binsize*lngt
          bins <- seq(s,e,length.out=lngt+1)
            hist(data(), breaks = bins, xaxt = 'n')
          axis(side=1,
               at = seq(min(bins), max(bins),binsize),
               labels = seq(min(bins), max(bins),binsize))
          })
      

})
