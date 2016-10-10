require(shiny)
library(leaflet)

load("preLoadedObjects/Mapa")

server <- function(input, output, session) {
  load("preLoadedObjects/Mapa")
 
  output$mymap <- renderLeaflet({
  MapaGeneral
  })
}