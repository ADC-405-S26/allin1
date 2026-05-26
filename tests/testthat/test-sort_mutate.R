test_that("sort_mutate assertions catch invalid inputs", {
  df <- data.frame(x = 1:3)

  # Expect error if .data is not a data frame
  expect_error(sort_mutate(x = c(1, 2, 3), expr = x * 2))

  # Expect error if desc is not logical
  expect_error(sort_mutate(df, expr = x * 2, desc = "TRUE"))

  # Expect error if desc is a vector instead of a single value
  expect_error(sort_mutate(df, expr = x * 2, desc = c(TRUE, FALSE)))
})
