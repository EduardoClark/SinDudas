require(shiny)
library(leaflet)
require(DT)

load("preLoadedObjects/Mapa")

server <- function(input, output, session) {

  load("preLoadedObjects/Mapa")
  load("preLoadedObjects/TMP")
 
  output$mymap <- renderLeaflet({
  MapaGeneral
  })
  
}