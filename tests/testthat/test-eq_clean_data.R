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
data$LOCATION_NAME=as.character(data$LOCATION_NAME)
test_that("date class",
          expect_equal(class(eq_clean_data(data)$DATE),"Date"))
test_that("numeric class",
          expect_equal(class(eq_clean_data(data)$EQ_PRIMARY),"numeric"))
test_that("numeric class",
          expect_equal(class(eq_clean_data(data)$TOTAL_DEATHS),"numeric"))
