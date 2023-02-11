# Helper to read BCPSS enrollment/demographic data from Excel file
read_bcpss_enrollment_demographics <- function(path,
                                               col_types = "text") {
  data <-
    readxl::read_excel(
      path = path,
      col_types = col_types,
      .name_repair = janitor::make_clean_names
    )

  data %>%
    dplyr::rename(
      management_type = school_type,
      grade_band = gradeband,
      # NOTE: percent_females is renamed outside this function for SY1920
      percent_male = percent_males
    ) %>%
    dplyr::mutate(
      # Make school number an integer so it can be sorted
      school_number = dplyr::if_else(
        school_number == "(all)",
        0L,
        as.integer(school_number)
      ),
      # For more information on coding of grade values see:
      # https://marylandpublicschools.org/about/Documents/OCP/Publications/StudentRecordsSystemManual2020.pdf
      # Move grade range values into a new grade range column
      grade_range = dplyr::if_else(
        grade %in% c("PK to K", "PK to 2", "PK to 5", "K to 5", "1 to 5", "3 to 5", "6 to 8", "9 to 12", "All Grades"), grade, "0"
      ),
      # Replace 91 w/ K, 92 w/ PK, 93 w/ PK, and remove grade ranges from grade column
      grade = dplyr::case_when(
        grade == "91" ~ "K",
        suppressWarnings(as.integer(grade)) > 91 ~ "PK",
        grade %in% c("PK to K", "PK to 2", "PK to 5", "K to 5", "1 to 5", "3 to 5", "6 to 8", "9 to 12", "All Grades") ~ "0",
        TRUE ~ grade
      )
    ) %>%
    # Replace NA values with actual NAs
    naniar::replace_with_na(
      list(
        management_type = "NA",
        grade_band = "NA",
        grade_range = "0",
        grade = "0"
      )
    ) %>%
    mutate(
      across(
        starts_with("percent"),
        ~ case_when(
          .x == "*" ~ NA_character_,
          stringr::str_detect(.x, "<=5%") ~ "0.05",
          stringr::str_detect(.x, ">=95%") ~ "0.95",
          TRUE ~ .x
        )
      ),
      across(
        starts_with("percent"),
        ~ as.numeric(.x)
      )
    ) %>%
    # Rename variables to match survey variable names
    # Reorder variables
    dplyr::relocate(management_type, .after = school_name) %>%
    dplyr::relocate(grade_range, .after = grade) %>%
    # Convert selected variables to factors
    dplyr::mutate(
      total_enrollment = as.integer(total_enrollment),
      grade_range = factor(grade_range, c("PK to K", "PK to 2", "PK to 5", "K to 5", "1 to 5", "3 to 5", "6 to 8", "9 to 12", "All Grades")),
      grade_band = factor(grade_band, c("E", "EM", "EMH", "M", "MH", "H", "Other")),
      grade = factor(grade, c("PK", "K", as.character(c(1:12)), "Other (93)"))
    ) %>%
    dplyr::arrange(
      school_number, grade, grade_range
    )
}
