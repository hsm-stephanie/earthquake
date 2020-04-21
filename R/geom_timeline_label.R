#' earthquake package
#'
#' 5.Label the timeline plot with \code{geom_timeline_label} function
#'
#' This function labels the timeline plot
#' @param mapping  Set of asthetic mappings created by [aes()]
#' @param x required, specifies date variable to plot on x axis
#' @param label required, specifies label variable to label on y axis
#' @param n_max optional, specifies the number of earthequakes of greatest
#'              magnitude by countries to label
#'
#' @importFrom grid grid.text
#' @importFrom grid grid.segments
#' @importFrom grid gTree
#' @importFrom grid gList
#' @importFrom grid gpar
#' @importFrom dplyr group_by
#' @importFrom dplyr top_n
#' @import ggplot2
#'
#' @examples \dontrun{
#' p<-ggplot(data2,aes(x=DATE,y=COUNTRY,size=EQ_PRIMARY,fill=TOTAL_DEATHS))+geom_timeline()
#' p+geom_timeline_label(aes(label=LOCATION_NAME,n_max=4))+mytheme
#' }
#'
#' @export
geom_timeline_label<-function(mapping=NULL,data=NULL,stat="identity",position="identity",
                              na.rm=F,show.legend=NA,inherit.aes=T,...){
  ggplot2::layer(
    geom=GeomTimelineLabel,mapping=mapping,
    data=data,stat=stat,
    position=position,show.legend = show.legend,
    inherit.aes=inherit.aes,params=list(na.rm=na.rm,...)
  )
}
#' @rdname geom_timeline_label
GeomTimelineLabel<-ggproto("GeomTimelineLabel",Geom,
                           required_aes=c("x","label"),
                           default_aes = aes(y=0.3, n_max=NA,
                                             alpha = 0.25,colour="grey"),
                           draw_key = draw_key_blank,
                           draw_panel=function(data, panel_scales, coord) {
  #transform to coordinate scales, need to remove dates=NA
  coords<-coord$transform(data,panel_scales)
  if (!is.na(coords$n_max[1])){
    coords<-coords %>%
      dplyr::group_by(y)  %>%
      dplyr::top_n(coords$n_max[1],size)
  }
  #draw elements
  ysegs<-grid::grid.segments(x0=coords$x,x1=coords$x,
                             y0=coords$y,y1=coords$y*1.2,
                             default.units = "npc",
                             gp=grid::gpar(color=coords$colour,alpha=coords$alpha))
  ylabel<-grid::grid.text(label=coords$label,x=unit(coords$x,"npc"),
                          y=unit(coords$y*1.2,"npc"),just="left",rot=45,check.overlap = T,
                          gp=grid::gpar(color="black"))
  #combine two elements
  grid::gTree(children = grid::gList(ysegs,ylabel))
}
)
