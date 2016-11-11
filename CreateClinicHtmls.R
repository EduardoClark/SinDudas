load("preLoadedObjects/TMP")

Leaflets <- paste("<!doctype html>
  
  <html lang=\"en\">
    <head>
    <meta charset=\"utf-8\">
      <title>",TMP2$Nombre.Corto, "</title>
      <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">
        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>
          <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>
            <link rel=\"stylesheet\" href=\"../css/styles.css\">
              <link rel=\"stylesheet\" type=\"../text/css\"
              href=\"https://fonts.googleapis.com/css?family=Roboto\">
                <script src=\"../shared/jquery.js\" type=\"text/javascript\"></script>
                <script src=\"../shared/shiny.js\" type=\"text/javascript\"></script>
                <link   rel=\"../stylesheet\" type=\"text/css\" href=\"shared/shiny.css\"/> 
                <link href=\"../shared/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" />
                <script src=\"../shared/bootstrap/js/bootstrap.min.js\"></script>
                <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>
                </head>
                
                <body>
                
                <div class=\"container\">
                <div class=\"Information\">
                <div class=\"Name\"><a style=\"color:#5407C5;font-size:20px\"><b>",TMP2$Institución,"</b></a> </div>
                <br>
                <div class=\"column-left\"><a><b>DIRECCION</b><br>",TMP2$Dirección,"</a></div>
                <div class=\"column-center\"><a><b>TELEFONOS</b><br>",TMP1$Teléfono,"</a></div>
                <div class=\"column-right\">
                <a><b>Horario</b><br>",TMP1$Horario.de.Atención,"</a>
                </div>
                
                </div>
                
                <div>
                <hr>
                <table>
                <tr>
                <th><a>Afilicacion<b>",TMP1$Afiliación,"</b></a></th>
                <th><a>Tipo<b>",TMP1$Tipo.de.Prueba,"</b></a></th>
                <th><a>Consejeria<b>", TMP1$Consejería,"</b></a></th>
                <th><a>Costo<b>",TMP1$Costo,"</b></a></th>
                </tr>
                </table> 
                </div>
                
                <div class=\"MsInformation\">
                <hr>
                <div class=\"column-left\"><a>Tiempo para resultados<br><br><br><a class=\"enfasis\"><b>",TMP1$Tiempo.p.resultados,"</b></a></a></div>
                <div class=\"column-center\"><a>Preparacion para la prueba<br><br><br><a class=\"enfasis\"><b>",TMP1$Preparación.Pre,"</b></a></a></div>
                <div class=\"column-right\"><a>Información adicional<br><br><br><a class=\"infop\"><b>",TMP1$Otros,"</b></a></a></div>
                <br>
                </div>
                
                </div>
                
                <div style=\"margin:0px;padding:0px;overflow:hidden\" >
                <br>
                <iframe  frameborder=\"0\" style=\"overflow:hidden;height:370px%;width:150%;\" height=\"370px\" width=\"150%\" src=\"../iframeleaflet.html\"></iframe>
                </div>
                
                
                </body>
                </html>",sep="")

for(i in 1:length(Leaflets)){
  TMP3 <- Leaflets[i]
  write(TMP3,paste("www/clinicas/",i,".html",sep=""))
        print(i)
}
