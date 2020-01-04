context("test csv wrappers")

write.csv_vc(cars, "testdata/mycars.csv", stamp = "test1")
write.csv_vc(cars[1:10,], "testdata/mycars.csv", stamp = "test2")
# note teardown deletes everything in testdata directory

test_that("confirm both test1 and test2 stamps exist", {
  expect_true(file.exists("testdata/mycars_test1_.csv"))
  expect_true(file.exists("testdata/mycars_test2_.csv"))
})

test_that("read gets latest version with only ten rows", {
  expect_equal(nrow(read.csv_vc("testdata/mycars.csv")), 10)
})

