#' earthquake package
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
    dplyr::mutate(MONTH=ifelse(is.na(.data$MONTH),1,.data$MONTH),
                   DAY=ifelse(is.na(.data$DAY),1,.data$DAY)) %>%
    #convert to date,before B.C were set to NA
    dplyr::mutate(DATE=ifelse(.data$YEAR>=0,lubridate::make_date(.data$YEAR,.data$MONTH,.data$DAY),NA)) %>%
    #convert to date class
    dplyr::mutate(DATE=as.Date(.data$DATE, origin="1970-01-01"))  %>%
    #convert to numeric
    dplyr::mutate(LATITUDE=as.numeric(.data$LATITUDE),
                  LONGITUDE=as.numeric(.data$LONGITUDE),
                  DEATHS=as.numeric(.data$DEATHS),
                  EQ_PRIMARY=as.numeric(.data$EQ_PRIMARY),
                  TOTAL_DEATHS=as.numeric(.data$TOTAL_DEATHS))  %>%
    #apply function to each row of location_name for transformation
    dplyr::mutate(LOCATION_NAME=purrr::map_chr(.data$LOCATION_NAME,eq_location_clean))   %>%
    dplyr::select(.data$DATE,.data$COUNTRY,.data$LOCATION_NAME,.data$LATITUDE,.data$LONGITUDE,.data$DEATHS,.data$EQ_PRIMARY,.data$TOTAL_DEATHS)   %>%
    dplyr::filter(!is.na(.data$DATE))
}
