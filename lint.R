
require(gsheet)
require(leaflet)
require(dplyr)
require(ggmap)

Sheet <- gsheet2tbl("https://docs.google.com/spreadsheets/d/1D4oGSUEC0WVXmVVOBRRQRofZuOYhabBqIENIoBecppg/edit?usp=sharing")

Sheet$address <- gsub("\n","",paste0(Sheet$Dirección, ", Mexico DF"))
addresses = Sheet$address


#define a function that will process googles server responses for us.
getGeoDetails <- function(address){   
  #use the gecode function to query google servers
  geo_reply = geocode(address, output='all', messaging=TRUE, override_limit=TRUE)
  #now extract the bits that we need from the returned list
  answer <- data.frame(lat=NA, long=NA, accuracy=NA, formatted_address=NA, address_type=NA, status=NA)
  answer$status <- geo_reply$status
  
  #if we are over the query limit - want to pause for an hour
  while(geo_reply$status == "OVER_QUERY_LIMIT"){
    print("OVER QUERY LIMIT - Pausing for 1 hour at:") 
    time <- Sys.time()
    print(as.character(time))
    Sys.sleep(60*60)
    geo_reply = geocode(address, output='all', messaging=TRUE, override_limit=TRUE)
    answer$status <- geo_reply$status
  }
  
  #return Na's if we didn't get a match:
  if (geo_reply$status != "OK"){
    return(answer)
  }   
  #else, extract what we need from the Google server reply into a dataframe:
  answer$lat <- geo_reply$results[[1]]$geometry$location$lat
  answer$long <- geo_reply$results[[1]]$geometry$location$lng   
  if (length(geo_reply$results[[1]]$types) > 0){
    answer$accuracy <- geo_reply$results[[1]]$types[[1]]
  }
  answer$address_type <- paste(geo_reply$results[[1]]$types, collapse=',')
  answer$formatted_address <- geo_reply$results[[1]]$formatted_address
  answer <- answer[,1:2]
  answer$Dirección <- address
  return(answer)
}

TMP <- bind_rows(lapply(addresses, getGeoDetails))
TMP$address <- TMP$Dirección
TMP$Dirección <- NULL
TMP <- left_join(Sheet,TMP)
TMP <- unique(TMP)
TMP$Popup <- paste("<a style=\\'color=#FFCC33\\'><b>",TMP$Institución, "</b></a>
                     <br><hr style=\\'#f2f3f4\\'>
                     <a style=\\'color=#f2f3f4\\'>", TMP$Dirección,"</a>",
                     "<br><a>Afiliación <b>", TMP$Afiliación,"</b></a>",
                     "<br><img src=\'assets/Gratis.png\' style=\\'width:2.5%;height:2.5%;\\'>",
                     "<a><b>", TMP$Tipo.de.Prueba,"</b></a>",sep="")
  
  #Map
  MapaGeneral <- leaflet(data =TMP) %>% addProviderTiles("CartoDB.Positron") %>% setView(-99.16666, 19.42455, zoom = 12) %>%
    addMarkers(~long, ~lat, popup = ~as.character(Popup))
  save(MapaGeneral,file = "preLoadedObjects/Mapa")

 
