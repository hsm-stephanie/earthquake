#' ############# earthquake package ##############
#' This is a package that contains functions to clean and 
#' visualize NOAA earthquake data of countries
#' ###############################################
#'
#' 2.Clean earthquake data with \code{eq_clean_data} function
#' 
#' This function is used to clean variables to be used in
#' the plots.It will generate a DATE variable of class Date
#' based on YEAR, MONTH and DAY in the data set. It will 
#' convert LATITUDE, LONGITUDE, EQ_PRIMARY, TOTAL_DEATHS to
#' numeric and clean LOCATION_NAME using eq_location_clean().
#' 
#' @param x a dataframe or tibble to be cleaned
#' 
#' @return a cleaned dataframe or tibble
#' 
#' @examples
#' \dontrun{
#' data<-eq_clean_data(data)
#' }
#' 
#' @importFrom magrittr "%>%"
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom dplyr filter
#' @importFrom lubridate make_date
#' @importFrom purrr map_chr
#' 
#' @export
eq_clean_data<-function(x){
  x %>% 
    #impute missing month and day to 01-01
    dplyr::mutate(MONTH=ifelse(is.na(MONTH),1,MONTH),
                  DAY=ifelse(is.na(DAY),1,DAY)) %>%
    #convert to date,before B.C were set to NA
    dplyr::mutate(DATE=ifelse(YEAR>=0,lubridate::make_date(YEAR,MONTH,DAY),NA)) %>%
    #convert to date class
    dplyr::mutate(DATE=as.Date(DATE, origin="1970-01-01"))  %>%
    #convert to numeric
    dplyr::mutate(LATITUDE=as.numeric(LATITUDE),
                  LONGITUDE=as.numeric(LONGITUDE),
                  DEATHS=as.numeric(DEATHS),
                  EQ_PRIMARY=as.numeric(EQ_PRIMARY),
                  TOTAL_DEATHS=as.numeric(TOTAL_DEATHS))  %>%                
    #apply function to each row of location_name for transformation
    dplyr::mutate(LOCATION_NAME=purrr::map_chr(LOCATION_NAME,eq_location_clean))   %>% 
    dplyr::select(DATE,COUNTRY,LOCATION_NAME,LATITUDE,LONGITUDE,DEATHS,EQ_PRIMARY,TOTAL_DEATHS)   %>% 
    dplyr::filter(!is.na(DATE))
}