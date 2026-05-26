# Applies sort_mutate

Applies sort_mutate

## Usage

``` r
sort_mutate(.data, expr, desc = FALSE)
```

## Arguments

- .data:

  dataframe

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
ranked_employees <- employees |> sort_mutate(hours_worked * hourly_wage, desc = TRUE)
print(ranked_employees)
#>      name hours_worked hourly_wage
#> 1 Charlie           45          50
#> 2   Alice           40          30
#> 3     Bob           35          25
#> 4   David           20          20
#> 5    <NA>           NA          NA

# for now it doesn't show the new column, but it arranges according to the calculated area correctly
```
