#' earthquake package
#'
#' 3.Timeline plot with \code{geom_timeline} function
#'
#' This new geom function is used to build a timeline plot
#' of earthquakes.
#'
#' @param mapping  Set of asthetic mappings created by [aes()]
#' @param x required, specifies date variable to plot on x axis
#' @param y optional, specifies country variable to plot on y axis
#' @param size optional, specifies size of the point (pch shape=21),
#'             i.e. magnitude of earthquake
#' @param fill optional, specifies fill of the point, i.e. deaths
#'
#' @importFrom grid grid.points
#' @importFrom grid grid.segments
#' @importFrom grid gTree
#' @importFrom grid gList
#' @importFrom grid gpar
#' @import ggplot2
#'
#' @examples \dontrun{
#' p<-ggplot(data2,aes(x=DATE,y=COUNTRY,size=EQ_PRIMARY,fill=TOTAL_DEATHS))+geom_timeline()
#' }
#'
#' @export
geom_timeline<-function(mapping=NULL,data=NULL,stat="identity",position="identity",
                        na.rm=F,show.legend=NA,inherit.aes=T,...){
  ggplot2::layer(
    geom=GeomTimeline,mapping=mapping,
    data=data,stat=stat,
    position=position,show.legend = show.legend,
    inherit.aes=inherit.aes,params=list(na.rm=na.rm,...)
  )
}
#' @rdname geom_timeline
GeomTimeline<-ggproto("GeomTimeline",Geom,
                      required_aes=c("x"),
                      default_aes = aes(y=0.3, size = 1, fill = "grey25",
                                        alpha = 0.25, colour="grey",
                                        shape=21, stroke=1 ),
                      draw_key = draw_key_point,
                      draw_panel=function(data, panel_scales, coord) {
  #transform to coordinate scales, need to remove dates=NA
  coords<-coord$transform(data,panel_scales)
  #draw elements
  circles<-grid::grid.points(x=coords$x,
                             y=coords$y,
                             size=unit(coords$size/2,"char"),
                             default.units = "npc",
                             pch=coords$shape,
                             gp=grid::gpar(color=coords$color,
                                           fill=coords$fill,
                                           alpha=coords$alpha ))
  segline<-grid::grid.segments(x0=min(coords$x),x1=max(coords$x),
                               y0=coords$y,y1=coords$y,
                               default.units = "npc",
                               gp=grid::gpar(color=coords$color,alpha=coords$alpha))
  #combine two elements
  grid::gTree(children = grid::gList(segline,circles))
}
)
