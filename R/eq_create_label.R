#' earthquake package
#'
#' 7.Create label of earthquakes for annotation
#'
#' \code{eq_create_label} creates labels that contain
#' location, magnitude and deaths of earthquakes.
#'
#' @param data a data frame or tibble
#'
#' @return a data frame with a new column popup_text
#'
#' @examples \dontrun{
#' eq_create_label(data2) %>% eq_map("popup_text")
#' }
#'
#' @export
eq_create_label<-function(data){
  loc<-paste("<b>Location: </b>",data$LOCATION_NAME)
  mag<-paste("<b>Magnitude: </b>",data$EQ_PRIMARY)
  death<-paste("<b>Total deaths: </b>",data$TOTAL_DEATHS)
  vec<-data.frame(loc,mag,death)
  args<-c(vec,sep="<br>")
  data$popup_text<-do.call(paste,args)
  return(data)
}

