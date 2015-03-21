library(shiny)
library(Ecdat)
library(ggplot2)
data(Bwages)

shinyServer(
  function(input, output) {
  meanval<-reactive({
    switch(input$imeanoptions,
           all=mean(Bwages$wage),
           edu=mean(Bwages$wage[Bwages$educ==input$iedu]),
           exp=mean(Bwages$wage[Bwages$exper==input$iexp]),
           both=mean((subset(Bwages, (Bwages$exper==input$iexp &Bwages$educ==input$iedu)))[,1])
    )
  })
    output$omean<-renderText({meanval()})
  plotdata<-reactive({
    switch(input$imeanoptions,
           all=Bwages,
           edu=Bwages[Bwages$educ==input$iedu,],
           exp=Bwages[Bwages$exper==input$iexp,],
           both=subset(Bwages, (Bwages$exper==input$iexp &Bwages$educ==input$iedu))
    )
  }) 
  
  plott<-reactive({
    switch(input$imeanoptions,
           all=qplot(exper, wage, data=plotdata(),xlim=c(0,47),ylim=c(0,50), col=educ),
           edu=qplot(exper, wage, data=plotdata(), xlim=c(0,47), ylim=c(0,50),
                     main=paste('Wages for workers with',input$iedu,'education level')),
           exp=qplot(educ, wage, data=plotdata(), xlim=c(1,5),ylim=c(0,50),
                     main=paste('Wages for workers with',input$iexp,'years experience')),
           both=qplot(educ, wage, data=plotdata(), xlim=c(1,5),ylim=c(0,50),
                      main=paste('Wages for workers with',input$iexp,'years experience and', input$iedu,'education level'))
    )
  })
  output$owageplot<-renderPlot({
    plott()
  })
    #output$wageplot <- 
  #different datasubset for each option
  #plot data, fill= education, x=experience, y=wage
  
  }
  
  )