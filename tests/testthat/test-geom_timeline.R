library(ggplot2)

test_that("geom_timeline",{
  data<-data.frame(MONTH=c(1,1,1),
                   DAY=c(1,1,1),
                   YEAR=c(1999,2000,2001),
                   EQ_PRIMARY=c("6","4","2"),
                   TOTAL_DEATHS=c("500","50","1"),
                   DEATHS=c("500","50","1"),
                   LATITUDE=c("1.1","2.2","1.8"),
                   LONGITUDE=c("98.1","99.5","100.1"),
                   LOCATION_NAME=c("J-1","J-2","J-3"),
                   COUNTRY=c("J","J","J"))

  p<-ggplot(data2,aes(x=DATE,y=COUNTRY,size=EQ_PRIMARY,fill=TOTAL_DEATHS))+geom_timeline()

  expect_identical(,
                   )
})
