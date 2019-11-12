context("Stamp File Function")

date <- "2019-10-22"
time <- "2019-10-22 16:46:04 PDT"

test_that("Works with no or many periods", {

  expect_equal(stamp_file("test", date), "test_2019-10-22_")
  expect_equal(stamp_file("test.rds.bat", date),  "test.rds_2019-10-22_.bat")
  expect_equal(stamp_file("test.rds.bat.dta", time), "test.rds.bat_2019-10-22 16:46:04 PDT_.dta")

})

test_that("Works with subdirectory listings in file name", {
  expect_equal(stamp_file("data/test.rds", date), "data/test_2019-10-22_.rds")
})
