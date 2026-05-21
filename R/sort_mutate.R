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
