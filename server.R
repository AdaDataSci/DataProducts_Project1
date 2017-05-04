
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggmap)
shinyServer(function(input, output) {

  output$map <- renderLeaflet({
  
    df<-crime[ which( crime$offense==input$offense  ),16:17]
    
    names(df)<-c("lng","lat")
  
    df<-na.omit(df)
    
    df %>%
      leaflet() %>%
      addTiles() %>%
      addCircleMarkers(clusterOptions = markerClusterOptions())
  })  

})
