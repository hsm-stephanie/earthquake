test_that("strip country names & title case",
          expect_identical(eq_location_clean("USA: DC"),"Dc"))
test_that("strip country names & title case-no location",
          expect_identical(eq_location_clean("USA"),"Usa"))
test_that("strip country names & title case-layers",
          expect_identical(eq_location_clean("USA: VA: Arlington"),
                           "Va: Arlington"))
