% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_timeline_label.R
\docType{data}
\name{geom_timeline_label}
\alias{geom_timeline_label}
\alias{GeomTimelineLabel}
\title{earthquake package}
\format{An object of class \code{GeomTimelineLabel} (inherits from \code{Geom}, \code{ggproto}, \code{gg}) of length 5.}
\usage{
geom_timeline_label(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  na.rm = F,
  show.legend = NA,
  inherit.aes = T,
  ...
)

GeomTimelineLabel
}
\arguments{
\item{mapping}{Set of asthetic mappings created by [aes()]}

\item{data}{data frame}

\item{stat}{stat function=identity}

\item{position}{position=identity}

\item{na.rm}{remove NA=F}

\item{show.legend}{show legend=NA}

\item{inherit.aes}{inherit ase=TRUE}

\item{...}{Other arguments passed on to [layer()].}
}
\description{
5.Label the timeline plot with \code{geom_timeline_label} function
}
\details{
This function labels the timeline plot

asthetics: x is required, specifies date variable to plot on x axis;
label is required, specifies label variable to label on y axis;
n_max is optional, specifies the number of earthequakes of greatest
magnitude by countries to label.
}
\examples{
\dontrun{
p<-ggplot(data2,aes(x=DATE,y=COUNTRY,size=EQ_PRIMARY,fill=TOTAL_DEATHS))+geom_timeline()
p+geom_timeline_label(aes(label=LOCATION_NAME,n_max=4))+mytheme
}

}
\keyword{datasets}
