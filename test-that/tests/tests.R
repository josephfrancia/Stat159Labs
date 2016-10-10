x=c(1,2,3,4,5)
y=c(1,2,3,4,NA)
z=c(TRUE, FALSE, TRUE)
w=letters[1:5]

# load the source code of the functions to be tested
source("../functions/missing-values.R")
source("../functions/range-value.R")

# context with one test that groups expectations
context("Test for range value") 

test_that("range works as expected for vector y", {
  y=c(1,2,3,4,NA)
  expect_length(range_value(y), 1)
  expect_equal(range_value(y), 3)	
})

test_that("range works as expected for vector z", {
  z=c(TRUE, FALSE, TRUE)
  expect_equal(range_value(z), 1L)
  expect_length(range_value(z), 1)
  expect_type(range_value(z), 'integer')	
})

test_that("range works as expected for vector w", {
  w=letters[1:5]
  expect_error(range_value(w),"non-numeric argument to binary operator")
})



# context with one test that groups expectations
context("Test for missing values") 

test_that("range works as expected for vector w", {
  expect_length(missing_values(x), 1)
  expect_type(missing_values(x), "integer")
  expect_gte(missing_values(x), 0)
})

