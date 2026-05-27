test_that("sort_mutate creates a new column and returns a correctly sorted data frame", {
  # Create simple test data
  df <- data.frame(hours_worked = c(40, 20, 30), hourly_wage = c(10, 10, 10))

  # Run function with descending order
  res_desc <- sort_mutate(df, new_col = "earnings", expr = hours_worked * hourly_wage, desc = TRUE)

  # Expect that it stays a data frame
  expect_s3_class(res_desc, "data.frame")

  # Expect that the new column was actually created with the correct math
  expect_true("earnings" %in% colnames(res_desc))
  expect_equal(res_desc$earnings, c(400, 300, 200))

  # Expect rows are sorted properly based on that calculation
  expect_equal(res_desc$hours_worked, c(40, 30, 20))

  # Run function with ascending order
  res_asc <- sort_mutate(df, new_col = "earnings", expr = hours_worked * hourly_wage, desc = FALSE)

  # Expect rows are sorted properly in reverse (20 first, 40 last)
  expect_equal(res_asc$hours_worked, c(20, 30, 40))
  expect_equal(res_asc$earnings, c(200, 300, 400))
})

test_that("sort_mutate assertions catch invalid inputs", {
  df <- data.frame(x = 1:3)

  # Expect error if .data is not a data frame
  expect_error(sort_mutate(x = c(1, 2, 3), new_col = "test", expr = x * 2))

  # Expect error if new_col is not a single string character
  expect_error(sort_mutate(df, new_col = 123, expr = x * 2))
  expect_error(sort_mutate(df, new_col = c("col1", "col2"), expr = x * 2))

  # Expect error if desc is not logical
  expect_error(sort_mutate(df, new_col = "test", expr = x * 2, desc = "TRUE"))

  # Expect error if desc is a vector instead of a single value
  expect_error(sort_mutate(df, new_col = "test", expr = x * 2, desc = c(TRUE, FALSE)))
})
