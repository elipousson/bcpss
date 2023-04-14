#' Get BCPSS package data by type and year
#'
#' Get a data frame or simple feature data by type and school year.
#'
#' @param type Data type, Default: 'bcps_programs'. Supported options in details.
#' @param year School year, Default: getOption("bcpss.year", default = 2021)
#' @param long If `TRUE`, use [tidyr::pivot_longer()] to return a long format
#'   data. Only supported if type is "enrollment_demographics", "parent_survey",
#'   "student_survey", Default: `FALSE`.
#' @return A data.frame or sf object (depending on type).
#' @details Supported data types
#'
#' Supported options for type include: "bcps_programs" (or "programs"),
#' "bcps_es_zones" (or "es_zones"), "enrollment_demographics",
#' "enrollment_msde", "baltimore_enrollment" (or "enrollment"),
#' "nces_school_directory", "accountability", "kra_results", "parent_survey",
#' "student_survey", "educator_survey".
#'
#' @examples
#'
#' get_bcpss_data(type = "bcps_programs", year = 2021)
#'
#' get_bcpss_data(type = "enrollment_demographics", year = 2019, long = TRUE)
#'
#' @rdname get_bcpss_data
#' @noRd
get_bcpss_data <- function(type = "bcps_programs",
                           year = getOption("bcpss.year", default = 2021),
                           long = FALSE) {
  if (type == "enrollment") {
    type <- "baltimore_enrollment"
  } else if (type %in% c("programs", "es_zones", "surplus_schools")) {
    type <- paste0("bcps_", type)
  }

  type <-
    match.arg(
      type,
      c(
        "bcps_programs", "bcps_es_zones", "enrollment_demographics",
        "enrollment_msde", "baltimore_enrollment",
        "nces_school_directory", "accountability", "kra_results",
        "parent_survey", "student_survey", "educator_survey"
      )
    )

  data <- type

  if (!(type %in% c("baltimore_enrollment", "bcps_surplus_schools"))) {
    data <- paste0(data, "_", as_school_year(year))
  }

  data <- eval(parse(data))

  if (type == "baltimore_enrollment") {
    if (nchar(year) == 2) {
      year <- paste0("20", year)
    }

    return(data[data[["year"]] %in% as.integer(year), ])
  }

  long <-
    (type %in% c(
      "enrollment_demographics",
      "parent_survey", "student_survey",
      "educator_survey"
    )) & long

  if (!isTRUE(long)) {
    return(data)
  }

  if (type == "enrollment_demographics") {
    return(pivot_enrollment_demographics_longer(data))
  }


  pivot_survey_longer(data)
}

#' @noRd
pivot_enrollment_demographics_longer <- function(data) {
  rlang::check_installed("tidyr")
  rlang::check_installed("dplyr")

  data <-
    tidyr::pivot_longer(
      data,
      cols = dplyr::starts_with("percent"),
      names_to = "variable"
    )

  dplyr::left_join(
    data,
    enrollment_demographics_label_xwalk
  )
}


#' @noRd
pivot_survey_longer <- function(data) {
  rlang::check_installed("tidyr")

  data <-
    tidyr::pivot_longer(
      data,
      # FIXME: This is hard-coded to work w/ parent_survey_SY1819 only
      cols = -c(1:7),
      names_to = "variable"
    )
}


#' Convert year or year range to school year abbreviation
#' @param year Integer vector (or any vector coercible to integer values).
#' @noRd
as_school_year <- function(year,
                           prefix = "SY",
                           width = 2) {
  year <- as.integer(year)

  stopifnot(
    "Year must be an integer or an object that can be converted to an integer." = !is.na(year)
  )

  paste0(
    prefix,
         str_sub_pad(year, width = width),
         str_sub_pad(year + 1, width = width)
         )
}

#' Subset end of string and pad string
#'
#' @noRd
str_sub_pad <- function(string,
                        pad = "0",
                        width = 2) {
  string <-
    str_extract(
      string,
      paste0(".{", width, "}$")
    )

  str_pad(
    string,
    pad = pad,
    width = width
  )
}
