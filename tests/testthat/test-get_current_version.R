context("test get_current_version")

test_that("error if no version control file", {
  expect_error(get_current_version("test", "bad_data_vc"),
               "version control file: bad_data_vc does not exist. Have you run make_data_vc?",
               fixed = TRUE)
})

test_that("error if specified data file doesnt exist", {
  expect_error(get_current_version("bad_test", "DATA_VC"),
               "Data bad_test is not tracked in DATA_VC",
               fixed = TRUE)
})

test_that("returns stamped file name", {
  expect_equal(get_current_version("testdata/mycars.rds", "DATA_VC"),
                "testdata/mycars_test1_.rds")
})
