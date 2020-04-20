test_that("eq_map",{
  data<-data.frame(DATE=as.Date(c("1999-01-01","2000-01-01","2001-01-01")),
                   EQ_PRIMARY=c("6","4","2"),
                   TOTAL_DEATHS=c("500","50","1"),
                   DEATHS=c("500","50","1"),
                   LATITUDE=c("1.1","2.2","1.8"),
                   LONGITUDE=c("98.1","99.5","100.1"),
                   LOCATION_NAME=c("J-1","J-2","J-3"),
                   COUNTRY=c("J","J","J"))
  data$EQ_PRIMARY<-as.numeric(data$EQ_PRIMARY)
  data$LONGITUDE<-as.numeric(data$LONGITUDE)
  data$LATITUDE<-as.numeric(data$LATITUDE)

  p<-eq_map(data,annot_col="DATE")

  expect_identical(class(p)[1],"leaflet")
  expect_error(print(p), NA)
})
