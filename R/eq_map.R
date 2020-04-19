#' ############# earthquake package ##############
#' This is a package that contains functions to clean and
#' visualize NOAA earthquake data of countries
#' ###############################################
#'
#' 6.Visualize earthquakes on an interactive map
#'
#' \code{eq_map} function is used to visualize earthquakes with
#' annotations on an interactive map.
#'
#' @param data a dataframe or tibble
#' @param annot_col a character specifies the annotation variable
#'
#' @return an interactive map with earthquakes marked as circles
#'
#' @details when click on the earthquake circle, text will pop up
#'
#' @importFrom leaflet leaflet
#' @importFrom leaflet addTiles
#' @importFrom leaflet addCircleMarkers
#'
#' @examples \dontrun{
#' eq_map(data2,"DATE")
#' }
#'
#' @export
eq_map<-function(data,annot_col){
leaflet::leaflet() %>%
  leaflet::addTiles() %>%
  leaflet::addCircleMarkers(data=data,lng=~LONGITUDE,lat=~LATITUDE,
                            radius=~EQ_PRIMARY,
                            popup=~paste(data[[annot_col]]),
                            weight=1)
}

