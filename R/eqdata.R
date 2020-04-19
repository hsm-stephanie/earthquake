#' ############# earthquake package ##############
#' This is a package that contains functions to clean and
#' visualize NOAA earthquake data of countries
#' ###############################################
#' eqdata
#'
#' this data contains earthquake data of Indonesia, Japan,
#' and USA from 2000-01-01 to 2020-01-01
#'
#' @source NOAA The Significant Earthquake Database
#'  \url{https://www.ngdc.noaa.gov/nndc/struts/form?t=101650&s=1&d=1}
#'
#' @format a data frame with 8 variables:
#' \describe{
#'  \item{DATE}{Date values between 2000-01-01 to 2020-01-01}
#'  \item{COUNTRY}{Country names}
#'  \item{LOCATION_NAME}{Location name in the country}
#'  \item{LATITUDE}{Latitude of earthquake}
#'  \item{LONGITUDE}{Longitude of earthquake}
#'  \item{DEATHS}{Number of deaths caused directly by earthquake}
#'  \item{TOTAL_DEATHS}{Number of total deaths caused directly or
#'  indirectly by earthquake, i.e.tsunami}
#'  \item{EQ_PRIMARY}{Magnitude of earthquake}
#' }
#'  @examples
#'  \dontrun{
#'  eqdata
#'  }
"eqdata"
#'
#'
#'
#'
