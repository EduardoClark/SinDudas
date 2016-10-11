require(shiny)
require(htmltools)
library(leaflet)

htmlTemplate("index.html",
             maincontent=tabsetPanel(
               tabPanel(HTML('<img src="/assets/mapaazul.png" style="width:20%;height:20%;color=blue;">&nbsp;&nbsp;&nbsp;MAPA'),leafletOutput("mymap")),
                        tabPanel(HTML('<img src="/assets/mapaazul.png" style="width:20%;height:20%;color=blue;">&nbsp;&nbsp;&nbsp;MAPAA'))
             ))

