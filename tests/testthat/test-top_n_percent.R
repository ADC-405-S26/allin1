test_that("top_n_percent returns the correct top slice and sorts it", {
  # Create a clean dataset of 10 rows
  df <- data.frame(name = letters[1:10], score = 1:10)

  # Grab top 20% (should be exactly 2 rows: scores 10 and 9)
  top_20 <- top_n_percent(df, score, percent = 20)

  # Expect that the resulting table has exactly 2 rows
  expect_equal(nrow(top_20), 2)

  # Expect that it sorted them in descending order (10 comes before 9)
  expect_equal(top_20$score, c(10, 9))

  # Grab top 50% (should be exactly 5 rows)
  top_50 <- top_n_percent(df, score, percent = 50)

  # Expect that the number of rows matches the half-slice calculation
  expect_equal(nrow(top_50), 5)
})

test_that("top_n_percent assertions catch out-of-bounds parameters", {
  df <- data.frame(x = 1:10)

  # Expect error if percent is greater than 100
  expect_error(top_n_percent(df, x, percent = 150))

  # Expect error if percent is negative
  expect_error(top_n_percent(df, x, percent = -5))

  # Expect error if percent is passed as a text string
  expect_error(top_n_percent(df, x, percent = "20"))
})

test_that("top_n_percent returns no rows when percent is 0", {
  df <- data.frame(name = letters[1:10], score = 1:10)

  # percent = 0 should return an empty data frame, not a single row
  expect_equal(nrow(top_n_percent(df, score, percent = 0)), 0)
})
