## code to prepare `employees` dataset goes here
employees <- data.frame(
  name = c("Alice", "Bob", NA, "Charlie", "David"),
  hours_worked = c(40, 35, NA, 45, 20),
  hourly_wage  = c(30, 25, NA, 50, 20)
)


usethis::use_data(employees, overwrite = TRUE)
