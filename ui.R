
#
# 401K9 Data - UI 
# ( R Shiny App )
#

library(shiny)
library(leaflet)

shinyUI(
  
  fluidPage(
    # Application title
    img(src="401k9-logo-black.png", align = "center", width= "50%", height = "50%" ),
    
    headerPanel("401K9 Project - California K9 Database"),
    
    leafletOutput("mymap"),
    br(),
    br(),
    dataTableOutput('mytable')
  )

)
