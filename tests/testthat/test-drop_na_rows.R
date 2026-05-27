test_that("drop_na_rows removes completely blank rows while keeping active ones", {
  # Create data where row 2 is completely empty
  dirty_df <- data.frame(
    id = c(1, NA, 3),
    val = c("A", NA, "C")
  )

  clean_df <- drop_na_rows(dirty_df)

  # Expect that the number of rows went from 3 down to 2
  expect_equal(nrow(clean_df), 2)

  # Expect that the correct IDs remain (1 and 3)
  expect_equal(clean_df$id, c(1, 3))

  # Expect that an completely clean data frame remains completely untouched
  perfect_df <- data.frame(x = 1:5, y = 6:10)
  expect_equal(nrow(drop_na_rows(perfect_df)), 5)
})

test_that("drop_na_rows handles invalid inputs safely", {
  # Expect error if someone passes a vector instead of a data frame
  expect_error(drop_na_rows(c(1, 2, NA, 4)))

  # Expect error if input is a matrix (checkmate asserts data.frame)
  mat <- matrix(1:9, nrow = 3)
  expect_error(drop_na_rows(mat))
})
