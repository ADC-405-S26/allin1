# Extract the top percentage of rows based on a column

Extract the top percentage of rows based on a column

## Usage

``` r
top_n_percent(.data, col, percent)
```

## Arguments

- .data:

  a dataframe

- col:

  Column name to sort by

- percent:

  number between 0 and 100 to specify the percentage

## Value

A filtered and sorted dataframe

## Examples

``` r
employees |> top_n_percent(hourly_wage, percent = 50)
#>      name hours_worked hourly_wage
#> 1 Charlie           45          50
#> 2   Alice           40          30
```
