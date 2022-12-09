#' Get BCPSS package data by type and year
#'
#' Get a data frame or simple feature data by type and school year.
#'
#' @param type Data type, Default: 'bcps_programs'
#' @param location PARAM_DESCRIPTION, Default: NULL
#' @param year PARAM_DESCRIPTION, Default: getOption("bcpss.year", default = 2021)
#' @param format PARAM_DESCRIPTION, Default: NULL
#' @param ... PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # EXAMPLE1
#' }
#' }
#' @rdname get_bcpss_data
#' @noRd
get_bcpss_data <- function(type = "bcps_programs",
                           year = getOption("bcpss.year", default = 2021),
                           location = NULL,
                           format = NULL,
                           ...) {
  data <-
    get_data_type(
      type,
      year = year,
      format = format
    )

  if (is.null(location)) {
    return(data)
  } else if (!is_installed("getdata")) {
    stop(
      "Install `getdata` from `elipousson/getdata` to use location."
    )
  }

  getdata::get_location_data(
    location = location,
    data = data,
    ...
  )
}

#' Get package data type
#' @noRd
get_data_type <- function(type = NULL,
                          year = getOption("bcpss.year", default = 2021),
                          format = NULL) {
  if (type == "enrollment") {
    type <- "baltimore_enrollment"
  } else if (type %in% c("programs", "es_zones")) {
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

  if (type != "baltimore_enrollment") {
    year <- as_school_year(year)
    data <- paste0(type, "_", year)
  } else {
    data <- type
  }

  if (!is.null(format)) {
    format <- match.arg(format, c("long"))
    data <- paste0(data, "_", format)
  }

  data <- eval(parse(text = paste0("bcpss::", data)))

  if (type == "baltimore_enrollment") {
    if (nchar(year) == 2) {
      year <- paste0("20", year)
    }

    data <- data[data$year == year, ]
  }

  data
}

#' Convert year or year range to school year abbreviation
#' @param year Length 1 or 2 character or numeric vector for start year (end year as one year more) or start and end year.
#' @param abb If `TRUE`, return abbreviation for school year range (e.g.
#'   "SY2021" for 2020-2021 school year). If `FALSE`, return numeric vector.
#' @noRd
as_school_year <- function(year, abb = TRUE) {
  stopifnot(
    "Year must be a length 1 or 2 vector." = (length(year) == 2) | (length(year) == 1),
    "Year must be an integer or an object that can be converted to an integer." = is.integer(as.integer(year))
  )

  if (length(year) == 1) {
    year <-
      c(
        as.integer(year),
        as.integer(year) + 1
      )
  }

  if (!abb) {
    return(year)
  }

  start_year <-
    str_sub_pad(min(year))

  end_year <-
    str_sub_pad(max(year))

  paste0("SY", start_year, end_year)
}

#' Subset end of string and pad string
#'
#' @noRd
str_sub_pad <- function(string,
                        pad = "0",
                        width = 2) {
  string <-
    stringr::str_sub(
      string,
      start = width * -1
    )

  stringr::str_pad(
    string,
    pad = pad,
    width = width
  )
}
