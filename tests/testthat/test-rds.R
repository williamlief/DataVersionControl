context("test base rds wrappers")

saveRDS_vc(cars[1:10,], "testdata/mycars.rds", stamp = "test2")
# note teardown deletes everything in testdata directory

test_that("confirm both test1 and test2 stamps exist", {
  expect_true(file.exists("testdata/mycars_test1_.rds"))
  expect_true(file.exists("testdata/mycars_test2_.rds"))
})

test_that("read gets latest version with only ten rows", {
  expect_equal(nrow(readRDS_vc("testdata/mycars.rds")), 10)
})
