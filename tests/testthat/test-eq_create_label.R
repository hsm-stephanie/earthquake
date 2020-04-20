
test_that("check text",{
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

  expect_identical(eq_create_label(data)$popup_text[1],
                   "<b>Location: </b> J-1<br><b>Magnitude: </b> 6<br><b>Total deaths: </b> 500")
  })
