#' Extract the top percentage of rows based on a column
#'
#' @param .data a dataframe
#' @param col Column name to sort by
#' @param percent number between 0 and 100 to specify the percentage
#'
#' @returns A filtered and sorted dataframe
#' @importFrom dplyr arrange filter desc n
#' @export
#'
#' @examples
#' employees |> top_n_percent(hourly_wage, percent = 50)
top_n_percent <- function(.data, col, percent) {
  checkmate::assert_data_frame(.data)
  checkmate::assert_number(percent, lower = 0, upper = 100)

  # Calculate how many rows equal that percentage
  # percent = 0 returns no rows; any positive percent returns at least 1.
  num_rows <- if (percent == 0) 0L else max(1, round((percent / 100) * nrow(.data)))

  .data |>
    dplyr::arrange(dplyr::desc({{ col }})) |>
    dplyr::filter(dplyr::row_number() <= num_rows)
}
