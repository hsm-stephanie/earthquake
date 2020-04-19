#' ############# earthquake package ##############
#' This is a package that contains functions to clean and 
#' visualize NOAA earthquake data of countries
#' ###############################################
#'
#' 1.Clean location name with \code{eq_location_clean} function
#'
#' This function is used to clean LOCATION_NAME variable by
#' stripping out country names and keep the location name, 
#' which will be used in plots. The location name will be 
#' convert to title case.
#'
#' @param x a string to be cleaned, with country name 
#' and location name separated by colon (:).
#'
#' @return a string that is cleaned, if location name only
#' contains country name, then country name will be returned
#' 
#' @examples
#' \dontrun{
#' eq_location_clean("ECUADOR:  RIOBAMBA, QUITO, CUZCO")
#' eq_location_clean("TURKEY")
#' eq_location_clean("China: Jiangsu: Nanjing")
#' }
#' 
#' @importFrom stringr str_sub
#' @importFrom stringr str_to_title
#' @importFrom stringr str_trim
#' 
#' 
#' @export
eq_location_clean<-function(x){
  #strip out country name
  locstring<-strsplit(x,split=": ")[[1]]
  if (length(locstring)>1){
    out<-stringr::str_sub(x,start=nchar(locstring)[1]+2,end=nchar(x))
    }
  else{out<-locstring}
  #change to title case
  out<-stringr::str_to_title(stringr::str_trim(out))
  return(out)
}



