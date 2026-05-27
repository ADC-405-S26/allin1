# Drop completely empty rows

Drop completely empty rows

## Usage

``` r
drop_na_rows(.data)
```

## Arguments

- .data:

  a dataframe

## Value

A dataframe with empty rows removed

## Examples

``` r
clean_employees <-employees |> drop_na_rows()
clean_employees
#>      name hours_worked hourly_wage
#> 1   Alice           40          30
#> 2     Bob           35          25
#> 4 Charlie           45          50
#> 5   David           20          20
```
