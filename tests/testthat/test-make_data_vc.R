context("test make_data_vc")

test_that("creates a file, silently", {
  expect_silent(make_data_vc("test_vc"))
  expect_true(file.exists("test_vc"))
  system("rm test_vc")
})

test_that("errors if file already exists", {
  make_data_vc("test_vc")
  expect_error(make_data_vc("test_vc"))
  system("rm test_vc")
})

test_that("replaces file", {
  expect_equal(get_current_version("testdata/mycars.rds", "DATA_VC"), "testdata/mycars_test1_.rds")
  make_data_vc(replace = TRUE)
  expect_error(get_current_version("testdata/mycars.rds"))
})
