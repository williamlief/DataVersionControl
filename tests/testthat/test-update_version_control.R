context("tests for update_version_control")

test_that("errors if version control file doesn't exist", {

  expect_error(
    update_version_control("cars", "test1", "bad_vc"),
    "version control file: bad_vc does not exist. Have you run make_data_vc?",
    fixed = TRUE)

})

test_that("updates existing file record", {
  update_version_control("testdata/mycars.rds", "test2", "DATA_VC")
  expect_equal(get_current_version("testdata/mycars.rds", "DATA_VC"),
               "testdata/mycars_test2_.rds")
})

test_that("creates new record if no existing", {
  update_version_control("testdata/newCars.rds", "test1", "DATA_VC")
  expect_equal(get_current_version("testdata/newCars.rds", "DATA_VC"),
               "testdata/newCars_test1_.rds")
})
