#' Applies sort_mutate
#'
#' @param .data dataframe
#' @param new_col new column name
#' @param expr expression, mathematical formula for your mutate
#' @param desc automatically set to FALSE
#'
#' @returns a table with mutated new column
#' @importFrom dplyr mutate arrange desc
#' @importFrom rlang :=
#' @export
#'
#' @examples
#' library(dplyr)
#' ranked_employees <- employees |>
#'   sort_mutate(new_col = "earnings", expr = hours_worked * hourly_wage, desc = TRUE)
#' print(ranked_employees)
#'
sort_mutate <- function(.data, new_col, expr, desc = FALSE)
{
  checkmate::assert_data_frame(.data)
  checkmate::assert_string(new_col)
  checkmate::assert_logical(desc, len = 1)

  mutated_data <-dplyr::mutate(.data, !!new_col := {{ expr }})

  if (desc) {
    dplyr::arrange(mutated_data, dplyr::desc(.data[[new_col]]))
  } else {
    dplyr::arrange(mutated_data, .data[[new_col]])
  }
}
