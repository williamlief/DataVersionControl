context("test csv wrappers")

file <- "testdata/mycars.csv"

write.csv_vc(cars, file, stamp = "test1")
write.csv_vc(cars[1:10,], file, stamp = "test2")
# note teardown deletes everything in testdata directory

test_that("confirm both test1 and test2 stamps exist", {
  expect_true(file.exists("testdata/mycars_test1_.csv"))
  expect_true(file.exists("testdata/mycars_test2_.csv"))
})

test_that("read gets latest version with only ten rows", {
  expect_equal(nrow(read.csv_vc(file)), 10)
})


write_csv_vc(cars[1:5,], file, stamp = "test3")
test_that("confirm write_csv_vc overwrites a write.csv created data_vc entry", {
  expect_true(file.exists("testdata/mycars_test2_.csv"))
  expect_true(file.exists("testdata/mycars_test3_.csv"))
  expect_equal(nrow(read.csv_vc(file)), 5)
})
