
#' Eval and parse data
#'
#' @noRd
use_eval_parse <- function(data, pkg) {
  eval(parse(text = glue::glue("{pkg}::{data}")))
}
