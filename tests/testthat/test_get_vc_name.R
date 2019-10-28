context("test get_vc_name")

test_that("runs silently", {
  expect_silent(get_vc_name("testdata/mycars.rds"))
})

test_that("error if file not found", {
  expect_error(get_vc_name("testmycars.rds"))
})


## This isn't working, clipr doesn't want to run in non-interactive mode

# test_that("correct value in clipboard", {
# expect_equal( clipr::read_clip(get_vc_name("testdata/mycars.rds"),
#                                allow_non_interactive=TRUE),
#               "testdata/mycars_2019-10-27_.rds")
# })
