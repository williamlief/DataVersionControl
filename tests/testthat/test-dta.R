context("test foreign dta wrappers")

write.dta_vc(cars[1:10,], "testdata/mycars.dta", stamp = "test2")
write.dta_vc(cars[1:5,], "testdata/mycars.dta", stamp = "test3")

# note teardown deletes everything in testdata directory

test_that("confirm both test1 and test2 stamps exist", {
  expect_true(file.exists("testdata/mycars_test1_.rds"))
  expect_true(file.exists("testdata/mycars_test2_.dta"))
})

test_that("read gets latest version with only five rows", {
  expect_equal(nrow(read.dta_vc("testdata/mycars.dta")), 5)
})
