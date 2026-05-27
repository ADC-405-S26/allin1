#' Drop completely empty rows
#'
#' @param .data a dataframe
#'
#' @returns A dataframe with empty rows removed
#' @export
#'
#' @examples
#' clean_employees <-employees |> drop_na_rows()
#' clean_employees
drop_na_rows <- function(.data) {
  checkmate::assert_data_frame(.data)

  # rowSums(is.na(.data)) counts how many NAs are in each row
  # ncol(.data) is the total number of columns
  keep_rows <- rowSums(is.na(.data)) < ncol(.data)

  .data[keep_rows, , drop = FALSE]
}
