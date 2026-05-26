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
