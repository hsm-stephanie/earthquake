#' ############# earthquake package ##############
#' This is a package that contains functions to clean and
#' visualize NOAA earthquake data of countries
#' ###############################################
#'
#'  4.New theme for the timeline plot
#'
#' This is a new theme to use with timeline plot
#'
#' @examples \dontrun{
#' p<-ggplot(data2,aes(x=DATE,y=COUNTRY,size=EQ_PRIMARY,fill=TOTAL_DEATHS))+geom_timeline()
#' p+mytheme+labs(fill="# deaths",size="Richter scale")
#' }
#'
#' @export
mytheme<-theme_classic()+theme(axis.line.x=element_line(size=1),
                               axis.line.y=element_blank(),
                               axis.ticks=element_line(color="black",size=0.5),
                               panel.grid = element_blank(),
                               panel.background = element_blank(),
                               legend.position="bottom")
