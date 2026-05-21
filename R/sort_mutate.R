#' Applies sort_mutate
#'
#' @param .data dataframe
#' @param expr expression, mathematical formula for your mutate
#' @param desc automatically set to FALSE
#'
#' @returns a table with mutated new column
#' @importFrom dplyr mutate arrange desc
#' @export
#'
#' @examples
#' library(dplyr)
#' shapes <- data.frame(length = c(10, 5, 8), width = c(2, 4, 5))
#' area_shapes <- shapes |> sort_mutate(length*width, desc = TRUE)
#' area_shapes
#'
#' # for now it doesn't show the new column, but it arranges according to the calculated area correctly
sort_mutate <- function(.data, expr, desc = FALSE)
{
  checkmate::assert_data_frame(.data)
  checkmate::assert_logical(desc, len = 1)

  if (desc) {
    dplyr::arrange(.data, dplyr::desc({{ expr }}))
  } else {
    dplyr::arrange(.data, {{ expr }})
  }
}
