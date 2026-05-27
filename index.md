# allin1

The goal of `allin1` is to provide shortcuts for usually tedious
functions

## Installation

You can install the development version of `allin1` from
[GitHub](https://github.com/) with:

``` r

# install.packages("devtools")
devtools::install_github("ADC-405-S26/allin1")
```

## Examples

This is a basic example which shows you how to solve a common problem:

``` r

library(allin1)
```

#### sort_mutate example

``` r

employees |> 
  sort_mutate("earnings", hours_worked * hourly_wage, desc = TRUE)
#>      name hours_worked hourly_wage earnings
#> 1 Charlie           45          50     2250
#> 2   Alice           40          30     1200
#> 3     Bob           35          25      875
#> 4   David           20          20      400
#> 5    <NA>           NA          NA       NA
```

#### drop_na_rows example

``` r

clean_employees <- employees |> drop_na_rows()
clean_employees
#>      name hours_worked hourly_wage
#> 1   Alice           40          30
#> 2     Bob           35          25
#> 4 Charlie           45          50
#> 5   David           20          20
```

#### top_n_percent example

``` r

employees |> 
  top_n_percent(hourly_wage, percent = 50)
#>      name hours_worked hourly_wage
#> 1 Charlie           45          50
#> 2   Alice           40          30
```
