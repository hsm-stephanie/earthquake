
test_that("geom_timeline",{
  data<-data.frame(DATE=as.Date(c("1999-01-01","2000-01-01","2001-01-01")),
                   EQ_PRIMARY=c("6","4","2"),
                   TOTAL_DEATHS=c("500","50","1"),
                   DEATHS=c("500","50","1"),
                   LATITUDE=c("1.1","2.2","1.8"),
                   LONGITUDE=c("98.1","99.5","100.1"),
                   LOCATION_NAME=c("J-1","J-2","J-3"),
                   COUNTRY=c("J","J","J"))
  data$EQ_PRIMARY<-as.numeric(data$EQ_PRIMARY)
  p<-ggplot(data,aes(x=DATE,y=COUNTRY,size=EQ_PRIMARY,fill=TOTAL_DEATHS))+geom_timeline()

  expect_true(is.ggplot(p))
  expect_identical(p$layers[[1]]$geom$required_aes,"x")
  expect_identical(p$labels$y,"COUNTRY")
  expect_error(print(p), NA)
})
