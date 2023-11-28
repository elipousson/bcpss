# Enrollment and demographic data by school ----

library(dplyr)
source(here::here("data-raw/helpers.R"))

# enrollment_demographics_SY1920_path <- "https://www.baltimorecityschools.org/sites/default/files/inline-files/SY19-20-Enrollment-11.10.2020.xlsx"
# Download file
# download.file(enrollment_demographics_path,
#              destfile = "SY19-20-Enrollment-11.10.2020.xlsx")

# Set local path
enrollment_demographics_SY1920_path <- "inst/extdata/SY19-20-Enrollment-11.10.2020.xlsx"

# https://www.baltimorecityschools.org/sites/default/files/inline-files/SY21-22%20Enrollment%20with%20unofficial%20SWD%20Child%20Count%20PUBLIC.xlsx

enrollment_demographics_SY1920 <-
  read_bcpss_enrollment_demographics(enrollment_demographics_SY1920_path) |>
  dplyr::rename(
    percent_female = percent_females
  )

# Export enrollment and demographic data
usethis::use_data(enrollment_demographics_SY1920, overwrite = TRUE)

# Label variables
# labelled::var_label(enrollment_demographics) <- deframe(enrollment_demographics_names)

# https://web.archive.org/web/20220120220842/https://cityschools2013-my.sharepoint.com/:x:/g/personal/mjkennedy_bcps_k12_md_us/EbeBwUlSscpAkz7b8YyJQeYBq8v0uRgXytdeBKwMQwVMXg?e=dp7G5c

enrollment_demographics_SY2021_path <- "inst/extdata/SY20-21 Enrollment Official SWD Child Count PUBLIC 092421.xlsx"

enrollment_demographics_SY2021 <- read_bcpss_enrollment_demographics(enrollment_demographics_SY2021_path)

usethis::use_data(enrollment_demographics_SY2021, overwrite = TRUE)

enrollment_demographics_SY2122_path <- "inst/extdata/SY21-22 Enrollment with unofficial SWD Child Count PUBLIC.xlsx"

enrollment_demographics_SY2122 <- read_bcpss_enrollment_demographics(enrollment_demographics_SY2122_path) |>
  rename(
    percent_non_hispanic_pacific_islander = percent_non_hispanic_native_hawaiian_or_other_pacific_islander
  )

usethis::use_data(enrollment_demographics_SY2122, overwrite = TRUE)

# Make a dataframe with labels for each variable
enrollment_demographics_label_xwalk <- readxl::read_excel(path = enrollment_demographics_SY2122_path) |>
  names() |>
  tibble::enframe() |>
  dplyr::mutate(
    value = dplyr::if_else(stringr::str_detect(value, "^%"), stringr::str_replace(value, "%", "Percent"), value),
    variable = snakecase::to_any_case(value, "snake"),
    variable = dplyr::case_when(
      variable == "gradeband" ~ "grade_band",
      TRUE ~ variable
    ),
    value = stringr::str_replace(value, "^Percent", "%"),
    value = dplyr::case_when(
      value == "Gradeband" ~ "Grade Band",
      value == "% Males" ~ "% Male",
      value == "% EL" ~ "% English Learner (EL)",
      value == "% SWD" ~ "% Students with Disabilities (SWD)",
      TRUE ~ value
    )
  ) |>
  dplyr::select(variable, label = value)

usethis::use_data(enrollment_demographics_label_xwalk, internal = TRUE)
