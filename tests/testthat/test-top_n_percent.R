test_that("top_n_percent assertions catch out-of-bounds parameters", {
  df <- data.frame(x = 1:10)

  # Expect error if percent is greater than 100
  expect_error(top_n_percent(df, x, percent = 150))

  # Expect error if percent is negative
  expect_error(top_n_percent(df, x, percent = -5))

  # Expect error if percent is passed as a text string
  expect_error(top_n_percent(df, x, percent = "20"))
})
