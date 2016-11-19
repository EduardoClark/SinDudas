require(shiny)
require(htmltools)
library(leaflet)
require(DT)
require(shinyBS)

htmlTemplate("index.html",
             maincontent=tabsetPanel(id="tabs",
               tabPanel(value="tabb1",HTML('<img src="/assets/mapaazul.png" style="width:20%;height:20%;color=blue;">&nbsp;&nbsp;&nbsp;MAPA'),leafletOutput("mymap")),
                        tabPanel(value="tabb2",HTML('<img src="/assets/mapaazul.png" style="width:20%;height:20%;color=blue;">&nbsp;&nbsp;&nbsp;LISTA'),
                                   fluidPage(fluidRow(
                                   column(3,selectInput('x', 'ITS', c("Todas",unique(TMP2$Afiliación)))),
                                   
                                   column(3,selectInput('z', 'Tipo de prueba', c("Todas",unique(TMP2$Tipo.de.Prueba)))),
                                   column(3,selectInput('a', 'Consejeria', c("Todas",unique(TMP2$Consejería)))),
                                   column(3,sliderInput(inputId="b",pre="$",'Costo',
                                                        min=min(TMP2$Costo2,na.rm=TRUE), max=max(TMP2$Costo2,na.rm=TRUE),
                                                        value=max(TMP2$Costo2,na.rm=TRUE),
                                                        step=100, round=0))
                                 ))
               ,bsModal("modalExample", "Data Table", trigger = "button_1", size = "large",
                        textOutput("prueba2")))
             ),
             
             content2 = fluidPage(conditionalPanel(condition="input.tabs!='tabb2'",
             DT::dataTableOutput("prueba") 
             )
             
             
             
             ))




