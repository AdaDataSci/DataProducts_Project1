
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(leaflet)
library(ggmap)

offense_list<-unique(crime$offense)
application_title<-"Houston Crime Locations as of 2017-05-04"


shinyUI(fluidPage(

  # Application title
  titlePanel(application_title),

  sidebarPanel(
    selectInput(inputId="offense", label="Choose a crime", choices=offense_list)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    leafletOutput(outputId = "map", width="100%"),
    br(),
    tags$div(
      tags$p("I used the crime data set found in ggmap for this shiny app project."), 
      tags$p("Lightly cleaned Houston crime from January 2010 to August 2010 geocoded with Google Maps where only NA values were removed."), 
      tags$p("Data originated from Houston Police Department, City of Houston"),
      citation("ggmap")
      )
    
    
    
  )
)

)