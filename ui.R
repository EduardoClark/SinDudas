require(shiny)
require(htmltools)
library(leaflet)
require(DT)

htmlTemplate("index.html",
             maincontent=tabsetPanel(
               tabPanel(HTML('<img src="/assets/mapaazul.png" style="width:20%;height:20%;color=blue;">&nbsp;&nbsp;&nbsp;MAPA'),leafletOutput("mymap")),
                        tabPanel(HTML('<img src="/assets/mapaazul.png" style="width:20%;height:20%;color=blue;">&nbsp;&nbsp;&nbsp;LISTAA'),
                                 fluidPage(fluidRow(
                                   column(3,selectInput('x', 'Cerca de ti', c("Alvaro Obregon","Miguel Hidalgo"))),
                                   
                                   column(3,selectInput('z', 'Tipo de prueba', c("Alvaro Obregon","Miguel Hidalgo"))),
                                   column(3,selectInput('a', 'Consejeria', c("Alvaro Obregon","Miguel Hidalgo"))),
                                   column(3,sliderInput('sampleSize', 'Costo',
                                                        min=0, max=500,
                                                        value=min(0, 3),
                                                        step=100, round=0))
                                 ))
               )
             )
             )




