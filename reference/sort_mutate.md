# Applies sort_mutate

Applies sort_mutate

## Usage

``` r
sort_mutate(.data, new_col, expr, desc = FALSE)
```

## Arguments

- .data:

  dataframe

- new_col:

  new column name

- expr:

  expression, mathematical formula for your mutate

- desc:

  automatically set to FALSE

## Value

a table with mutated new column

## Examples

``` r
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
ranked_employees <- employees |>
  sort_mutate(new_col = "earnings", expr = hours_worked * hourly_wage, desc = TRUE)
print(ranked_employees)
#>      name hours_worked hourly_wage earnings
#> 1 Charlie           45          50     2250
#> 2   Alice           40          30     1200
#> 3     Bob           35          25      875
#> 4   David           20          20      400
#> 5    <NA>           NA          NA       NA
```
