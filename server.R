
# 
# 401K9 Data - Server 
# ( R Shiny App )
#

library(shiny)
library(leaflet)

shinyServer(function(input, output) {
  
  library(readr)
  k9datacsv <- read_csv("~/Documents/fll/k9/k9data.csv")

  output$mymap <- renderLeaflet({
    
      dogIcon <- makeIcon(
        iconUrl = "~/Documents/fll/k9/guide-dog.png",
        iconWidth = 36, iconHeight = 36,
        iconAnchorX = -7, iconAnchorY = 30
      )
      
      dogFace <- makeIcon(
        iconUrl = "~/Documents/fll/k9/dog.png",
        iconWidth = 36, iconHeight = 36,
        iconAnchorX = -7, iconAnchorY = 30
      )
    
    leaflet(k9datacsv) %>%
      #addTiles() %>%  # Add default OpenStreetMap map tiles
      #addProviderTiles(providers$Esri.NatGeoWorldMap) %>% 
      addProviderTiles(providers$CartoDB.Positron) %>% 
      addMarkers(clusterOptions = markerClusterOptions(), popup= ~City, icon = dogIcon)%>%
      addMarkers(lng = ~longitude, lat = ~latitude, popup= ~City, icon = dogFace)
      #%>% addCircles(lng = ~longitude, lat = ~latitude)
  })
  
  #my <- datatable(faithful, filter = 'top', options = list(bPaginate = TRUE))
  output$mytable = renderDataTable({ 
    k9datacsv
   }, options = list(lengthMenu = c(5, 30, 50), pageLength = 5)
   )
  

})
