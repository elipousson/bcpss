# Enrollment and demographic data by school ----
# enrollment_demographics_SY1920_path <- "https://www.baltimorecityschools.org/sites/default/files/inline-files/SY19-20-Enrollment-11.10.2020.xlsx"
# Download file
# download.file(enrollment_demographics_path,
#              destfile = "SY19-20-Enrollment-11.10.2020.xlsx")

# Set local path
enrollment_demographics_SY1920_path <- "inst/extdata/SY19-20-Enrollment-11.10.2020.xlsx"

# List column types
enrollment_demographics_SY1920_col_types <- c(
  "text", "text", "text", "text", "text",
  "numeric", "numeric", "numeric", "numeric", "numeric",
  "numeric", "numeric", "numeric", "numeric", "numeric",
  "numeric", "numeric", "numeric"
)

# Import enrollment and demographic data
enrollment_demographics_SY1920 <- readxl::read_excel(
  path = enrollment_demographics_SY1920_path,
  col_types = enrollment_demographics_SY1920_col_types
) %>%
  janitor::clean_names("snake") %>%
  dplyr::mutate(
    # Make school number an integer so it can be sorted
    school_number = as.integer(school_number),
    # Move grade range values into a new grade range column
    grade_range = dplyr::if_else(grade %in% c("PK to K", "PK to 2", "PK to 5", "K to 5", "1 to 5", "3 to 5", "6 to 8", "9 to 12", "All Grades"), grade, "0"),
    # Replace 91 w/ K, 92 w/ PK, 93 w/ Other (93), and remove grade ranges from grade column
    grade = dplyr::case_when(
      grade == "91" ~ "K",
      grade == "92" ~ "PK",
      grade == "93" ~ "Other (93)",
      grade %in% c("PK to K", "PK to 2", "PK to 5", "K to 5", "1 to 5", "3 to 5", "6 to 8", "9 to 12", "All Grades") ~ "0",
      TRUE ~ grade
    )
  ) %>%
  # Replace NA values with actual NAs
  naniar::replace_with_na(list(school_type = "NA", grade_band = "NA", grade_range = "0", grade = "0")) %>%
  # Rename variables to match survey variable names
  dplyr::rename(grade_band = gradeband) %>%
  # Reorder variables
  dplyr::relocate(school_type, .after = school_name) %>%
  dplyr::relocate(grade_range, .after = grade)

# Convert selected variables to factors
enrollment_demographics_SY1920$grade_range <- factor(enrollment_demographics_SY1920$grade_range, c("PK to K", "PK to 2", "PK to 5", "K to 5", "1 to 5", "3 to 5", "6 to 8", "9 to 12", "All Grades"))
enrollment_demographics_SY1920$grade_band <- factor(enrollment_demographics_SY1920$grade_band, c("E", "EM", "EMH", "M", "MH", "H", "Other"))
enrollment_demographics_SY1920$grade <- factor(enrollment_demographics_SY1920$grade, c("PK", "K", as.character(c(1:12)), "Other (93)"))

enrollment_demographics_SY1920 <- dplyr::arrange(enrollment_demographics_SY1920, school_number, grade, grade_range)

usethis::use_data(enrollment_demographics_SY1920, overwrite = TRUE)

# Make a dataframe with labels for each variable
enrollment_demographics_SY1920_names <- readxl::read_excel(path = enrollment_demographics_SY1920_path) %>%
  names() %>%
  tibble::enframe() %>%
  dplyr::mutate(
    value = dplyr::if_else(stringr::str_detect(value, "^%"), stringr::str_replace(value, "%", "Percent"), value),
    variable = snakecase::to_any_case(value, "snake"),
    variable = dplyr::case_when(
      variable == "gradeband" ~ "grade_band",
      TRUE ~ variable
    ),
    value = dplyr::if_else(stringr::str_detect(value, "^Percent"), stringr::str_replace(value, "Percent", "%"), value)
  ) %>%
  dplyr::select(variable, label = value)

paste0(enrollment_demographics_SY1920_names$variable)


# Switch to long format and add label column
enrollment_demographics_SY1920_long <- enrollment_demographics_SY1920 %>%
  tidyr::pivot_longer(
    cols = c(8:19),
    names_to = "variable",
    values_to = "share"
  ) %>%
  dplyr::left_join(enrollment_demographics_SY1920_names, by = "variable") %>%
  dplyr::arrange(school_number, grade, grade_range)

usethis::use_data(enrollment_demographics_SY1920_long)

# Label variables
# labelled::var_label(enrollment_demographics) <- deframe(enrollment_demographics_names)

# Parent survey results ----

# Set path to
# parent_school_survey_SY1819_path <- "https://www.baltimorecityschools.org/sites/default/files/inline-files/SY18-19%20Parent%20School%20Survey%20OFFICIAL.xlsx"
parent_school_survey_SY1819_path <- "inst/extdata/SY18-19_Parent_School_Survey_OFFICIAL.xlsx"

parent_school_survey_SY1819 <- readxl::read_excel(parent_school_survey_SY1819_path) %>%
  janitor::clean_names("snake") %>%
  dplyr::rename(
    school_type = management_type
  ) %>%
  naniar::replace_with_na_all(~ .x == "S") %>%
  dplyr::mutate(
    # Convert survey results into numeric variables
    dplyr::across(c(5:50), as.numeric),
    # Make school number an integer so it can be sorted
    school_number = as.integer(school_number)
  ) %>%
  dplyr::rename(
    estimated_parent_number_eligible = estimated_parent_number_eligible1,
    estimated_parent_response_rate = estimated_parent_response_rate1
  ) %>%
  dplyr::relocate(school_type, .after = school_name) %>%
  dplyr::filter(school_number != "(all)")

usethis::use_data(parent_school_survey_SY1819, overwrite = TRUE)

# Getting the text of the questions
parent_school_survey_SY1819_names <- readxl::read_excel(path = parent_school_survey_SY1819_path) %>%
  names() %>%
  tibble::enframe() %>%
  dplyr::mutate(
    variable = snakecase::to_any_case(value, "snake"),
    variable = dplyr::case_when(
      variable == "estimated_parent_number_eligible1" ~ "estimated_parent_number_eligible",
      variable == "estimated_parent_response_rate1" ~ "estimated_parent_response_rate",
      variable == "management_type" ~ "school_type",
      TRUE ~ variable
    ),
    question_category = stringr::str_extract(value, "(^[:alpha:]+)(?=[:digit:])"),
    question_category = dplyr::case_when(
      variable == "parent_read_2_i_read_with_my_child_at_least_once_a_month" ~ "Parent Read",
      variable == "parent_talk_2_i_ask_my_child_what_he_she_did_at_school_at_least_once_a_month" ~ "Parent Talk",
      question_category == "DistrictOffice" ~ "District Office",
      TRUE ~ question_category
    ),
    #    question_number = str_extract(value, "[:digit:]+(?=-)"),
    question = stringr::str_extract(value, "(?<=-).+"),
    label = dplyr::if_else(is.na(question), value, question),
    label = dplyr::case_when(
      label == "Management Type" ~ "School Type",
      label == "OVERALL" ~ "Overall Score",
      label == "Estimated Parent Number Eligible1" ~ "Estimated number of eligible parents",
      label == "Estimated Parent Response Rate1" ~ "Estimated parent response rate",
      TRUE ~ label
    )
  ) %>%
  dplyr::select(variable, label)

# Switch to long format and add label column
parent_school_survey_SY1819_long <- parent_school_survey_SY1819 %>%
  tidyr::pivot_longer(
    cols = c(8:50),
    names_to = "variable",
    values_to = "value"
  ) %>%
  dplyr::left_join(parent_school_survey_SY1819_names, by = "variable") %>%
  dplyr::arrange(school_number)

usethis::use_data(parent_school_survey_SY1819_long, overwrite = TRUE)


# BCPS Student/Educator Survey ----
# Starting in the 2018-2019 school year, all teachers and students in grades 5-11 had the opportunity to take
# the Maryland School Survey. The survey collects important information about relationships, engagement,
# the school environment, and safety. School leaders use results to learn about and improve the school community.
student_educator_survey_path <- "https://www.baltimorecityschools.org/sites/default/files/inline-files/PUBLIC-2019-Maryland-school-Survey-Student-Educator-Results.xlsx"
student_educator_survey <- openxlsx::read.xlsx(student_educator_survey_path) %>%
  janitor::clean_names("snake")
