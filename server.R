require(shiny)
library(leaflet)
require(DT)
require(shinyBS)
require(dplyr)

load("preLoadedObjects/Mapa")

server <- function(input, output, session) {
  load("preLoadedObjects/Mapa")
  load("preLoadedObjects/TMP")

  output$prueba2 <- renderText({
    "MapaGeneral"
  })
  
  output$mymap <- renderLeaflet({
  MapaGeneral
    })
  
  output$prueba <- DT::renderDataTable({
    load("preLoadedObjects/TMP")
    shinyInput <- function(FUN, len, id, ...) {
      inputs <- character(len)
      for (i in seq_len(len)) {
        inputs[i] <- as.character(FUN(paste0(id, i), ...))
      }
      inputs
   } 
    TMP2$Prueba2 <- paste("<a href='/clinicas/",row.names(TMP1), ".html' onClick=\"window.open('/clinicas/",row.names(TMP1),".html','titlebar=no,toolbar=no,pagename','scrollbars=no,resizable=no,height=709,width=776'); return false;\">Mas información</a>",sep="")
    # TMP2$Prueba2 <- shinyInput(actionButton, nrow(TMP2), 'button_', label = "Más Información" )
    TMP2 <- if(input$x=="Todas"){TMP2} else {filter(TMP2,Afiliación==input$x)}
    TMP2 <- if(input$z=="Todas"){TMP2} else {filter(TMP2,Tipo.de.Prueba==input$z)}
    TMP2 <- if(input$a=="Todas"){TMP2} else {filter(TMP2,Consejería==input$a)}
    TMP2 <- if(input$b==max(TMP2$Costo2,na.rm=TRUE)){TMP2} else {filter(TMP2,Costo2<=input$b)}
    DT::datatable(TMP2[,c(8,9)],escape=FALSE,options = list(searching = FALSE,
                                      lengthMenu = FALSE,
                                      pageLength = 5
                                      ),rownames=FALSE,selection="none")
  })
 
}