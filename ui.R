
#
# 401K9 Data - UI 
# ( R Shiny App )
#

library(shiny)
library(leaflet)

shinyUI(
  
  fluidPage(
    # Application title
    headerPanel(strong("401K9 Project")),
    headerPanel("California K9 Data"),
    
  
    leafletOutput("mymap"),
    br(),
    br(),
    dataTableOutput('mytable')
  )

)
