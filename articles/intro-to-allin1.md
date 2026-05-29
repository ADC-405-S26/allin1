# Introduction to allin1

The `allin1` provides convenience functions for some common tasks. To
install this package from GitHub, use

``` r

# install.packages("remotes")
# install.packages("devtools")
devtools::install_github("ADC-405-S26/allin1")
```

``` r

library(allin1)
```

The package contains three functions

- [`sort_mutate()`](https://adc-405-s26.github.io/allin1/reference/sort_mutate.md)
  — creates a new column from an expression and sorts the data frame by
  it in a single step. Sorts ascending by default, or descending with
  `desc = TRUE`. Think of it as
  [`dplyr::mutate()`](https://dplyr.tidyverse.org/reference/mutate.html)
  and
  [`dplyr::arrange()`](https://dplyr.tidyverse.org/reference/arrange.html)
  combined.

- [`drop_na_rows()`](https://adc-405-s26.github.io/allin1/reference/drop_na_rows.md)
  — removes rows that are *completely* empty (every column is `NA`),
  while keeping rows that have at least one real value. Useful for
  clearing out blank rows without throwing away partially complete
  records.

- [`top_n_percent()`](https://adc-405-s26.github.io/allin1/reference/top_n_percent.md)
  — returns the top *n* percent of rows ranked by a column, sorted
  highest to lowest. For example, the top 50% of employees by hourly
  wage. Passing `percent = 0` returns an empty data frame.

## When to use these over base R

Each function wraps a task you *can* already do in base R or dplyr — the
point is fewer steps and fewer easy mistakes.

### `sort_mutate()` vs `mutate()` + `arrange()`

Normally you’d compute a column and then sort by it in two separate
calls, and it’s easy to forget the sort:

``` r

library(dplyr)

employees |>
  mutate(earnings = hours_worked * hourly_wage) |>
  arrange(desc(earnings))
```

[`sort_mutate()`](https://adc-405-s26.github.io/allin1/reference/sort_mutate.md)
does both at once:

``` r

employees |>
  sort_mutate("earnings", hours_worked * hourly_wage, desc = TRUE)
```

### `drop_na_rows()` vs `na.omit()` / `is.na()`

This is the important distinction.
[`na.omit()`](https://rdrr.io/r/stats/na.fail.html) drops a row if it
has *any* `NA`.
[`drop_na_rows()`](https://adc-405-s26.github.io/allin1/reference/drop_na_rows.md)
only drops rows where *every* value is missing, so partially complete
rows survive:

``` r

df <- data.frame(
  name  = c("Alice", "Bob", NA),
  score = c(10,       NA,    NA)
)

# drop_na_rows() keeps Bob, he still has a name
drop_na_rows(df)
#>    name score
#> 1 Alice    10
#> 2   Bob    NA

# na.omit() removes Bob too, just because his score is missing
na.omit(df)
#>    name score
#> 1 Alice    10
```

The base-R equivalent of
[`drop_na_rows()`](https://adc-405-s26.github.io/allin1/reference/drop_na_rows.md)
is `df[rowSums(is.na(df)) < ncol(df), , drop = FALSE]` — correct, but
clunky and easy to get wrong (forgetting `drop = FALSE` silently turns a
one-column result into a vector).

### `top_n_percent()` vs `slice_max()`

[`dplyr::slice_max()`](https://dplyr.tidyverse.org/reference/slice.html)
can take a proportion, but
[`top_n_percent()`](https://adc-405-s26.github.io/allin1/reference/top_n_percent.md)
lets you think in whole percentages and returns exactly that many rows
rather than expanding to include ties:

``` r

# dplyr: proportion as a fraction, and ties may add extra rows
employees |> slice_max(hourly_wage, prop = 0.5)

# allin1: a plain percentage, exact row count
employees |> top_n_percent(hourly_wage, percent = 50)
```

My main motivation comes from everyday problems with data wrangling.
People like myself often find it quite tedious and may make silly
mistakes while writing large chunks of code like a missing or open pipe
operator, or a missing parameter in a function. My goal here was to make
shortcuts to more lengthy functions in order to create a more
user-friendly data wrangling experience for new and experienced data
scientists alike.
