#' Shorten a column or character vector of school names
#'
#' Standard grade range names are replaced with corresponding abbreviations
#' ("E","EM","M","H","MH", and "P"). For example, "High" (appearing at the end
#' of a string), "High school" or "High School" is replaced by HS (or H if
#' suffix is `NULL`). String or column values are also passed to
#' [stringr::str_squish()] and [stringr::str_trim()] to avoid issues with
#' pattern matching failing due to trailing spaces or double-spaces.
#'
#' @param data Data frame with column name matching .col that contains school
#'   names to shorten.
#' @param .col Column name to shorten. Values are replaced if .col_short is
#'   supplied.
#' @param .col_short Column name for new column with short names.
#' @param suffix Suffix to append to standard abbreviations. Defaults to "S"
#' @param extra_pattern Additional replacements added to standard pattern and
#'   passed to [stringr::str_replace_all()]
#' @param string Character vector of school names to shorten.
#' @name fmt_school_name_short
#' @keywords internal
fmt_school_name_short <- function(data,
                                  .col = "school_name",
                                  .col_short = NULL,
                                  suffix = "S",
                                  extra_pattern = c(
                                    "All Baltimore City Public Schools" = "All City schools",
                                    "Academy" = "Acad.",
                                    "Preparatory" = "Prep.",
                                    "Square" = "Sq.",
                                    "^Commodore" = "Com.",
                                    ", The$" = ""
                                  )) {
  stopifnot(
    all(.col %in% names(data))
  )

  .col_short <- .col_short %||% .col

  data[[.col_short]] <- vec_fmt_school_name_short(
    data[[.col]],
    suffix = suffix,
    extra_pattern = extra_pattern
  )

  data
}

#' @rdname fmt_school_name_short
#' @keywords internal
vec_fmt_school_name_short <- function(string,
                                      suffix = "S",
                                      extra_pattern = c(
                                        "All Baltimore City Public Schools" = "All City schools",
                                        "Academy" = "Acad.",
                                        "Preparatory" = "Prep.",
                                        "Square" = "Sq.",
                                        "^Commodore" = "Com.",
                                        ", The$" = ""
                                      )) {
  check_installed("stringr")

  grade_range_names <- c(
    "E",
    "EM",
    "M",
    "H",
    "MH",
    "P"
  )

  grade_range_abb <- grade_range_names

  if (!is.null(suffix)) {
    grade_range_abb <- paste0(grade_range_abb, suffix)
  }

  grade_range_abb <- set_names(
    grade_range_abb,
    grade_range_names
  )

  pattern <- c(
    "Elementary/Middle School" = grade_range_abb[["EM"]],
    "Elementary/Middle" = grade_range_abb[["EM"]],
    "Elementary School" = grade_range_abb[["E"]],
    "Elementary/Primary" = grade_range_abb[["P"]],
    "Elementary" = grade_range_abb[["E"]],
    "Primary$" = grade_range_abb[["P"]],
    "Middle School" = grade_range_abb[["M"]],
    "Middle/High School" = grade_range_abb[["MH"]],
    "Middle$" = grade_range_abb[["M"]],
    "High School" = grade_range_abb[["H"]],
    "High school" = grade_range_abb[["H"]],
    "High$" = grade_range_abb[["H"]]
  )


  if (is.character(extra_pattern)) {
    pattern <- c(pattern, extra_pattern)
  }

  string <- stringr::str_trim(stringr::str_squish(string))

  stringr::str_replace_all(
    string = string,
    pattern = pattern
  )
}
