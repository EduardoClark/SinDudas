require(shiny)
require(htmltools)

htmlTemplate("index.html",
  maincontent =  mainPanel(
    tabsetPanel(
      tabPanel(HTML('<a><img src="/assets/mapaazul.png" style="width:20%;height:20%;color=blue;">&nbsp;&nbsp;&nbsp;MAPA</a>'), verbatimTextOutput("summary")),
      tabPanel(HTML('<a"><img src="/assets/mapaazul.png" style="width:20%;height:20%;color=blue;">&nbsp;&nbsp;&nbsp;LISTA</a>'), verbatimTextOutput("summary2"))
    )
  )            
)