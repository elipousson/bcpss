# Enrollment and demographic data by school ----
# enrollment_demographics_SY1920_path <- "https://www.baltimorecityschools.org/sites/default/files/inline-files/SY19-20-Enrollment-11.10.2020.xlsx"
# Download file
# download.file(enrollment_demographics_path,
#              destfile = "SY19-20-Enrollment-11.10.2020.xlsx")

# Set local path
enrollment_demographics_SY1920_path <- "inst/extdata/SY19-20-Enrollment-11.10.2020.xlsx"

# https://www.baltimorecityschools.org/sites/default/files/inline-files/SY21-22%20Enrollment%20with%20unofficial%20SWD%20Child%20Count%20PUBLIC.xlsx

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
  rename(
    management_type = school_type
  ) %>%
  dplyr::mutate(
    # Make school number an integer so it can be sorted
    school_number = dplyr::if_else(school_number == "(all)", as.integer("0"), as.integer(school_number)),
    # Move grade range values into a new grade range column
    grade_range = dplyr::if_else(
      grade %in% c("PK to K", "PK to 2", "PK to 5", "K to 5", "1 to 5", "3 to 5", "6 to 8", "9 to 12", "All Grades"), grade, "0"
    ),
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
  naniar::replace_with_na(list(management_type = "NA", grade_band = "NA", grade_range = "0", grade = "0")) %>%
  # Rename variables to match survey variable names
  dplyr::rename(grade_band = gradeband) %>%
  # Reorder variables
  dplyr::relocate(management_type, .after = school_name) %>%
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


# Switch to long format and add label column
enrollment_demographics_SY1920_long <- enrollment_demographics_SY1920 %>%
  tidyr::pivot_longer(
    cols = c(8:19),
    names_to = "variable",
    values_to = "share"
  ) %>%
  dplyr::left_join(enrollment_demographics_SY1920_names, by = "variable") %>%
  dplyr::arrange(school_number, grade, grade_range)

usethis::use_data(enrollment_demographics_SY1920_long, overwrite = TRUE)

# Label variables
# labelled::var_label(enrollment_demographics) <- deframe(enrollment_demographics_names)

# Parent survey results ----

# Set path to
# parent_survey_SY1819_path <- "https://www.baltimorecityschools.org/sites/default/files/inline-files/SY18-19%20Parent%20School%20Survey%20OFFICIAL.xlsx"
parent_survey_SY1819_path <- "inst/extdata/SY18-19_Parent_School_Survey_OFFICIAL.xlsx"

parent_survey_SY1819 <- readxl::read_excel(parent_survey_SY1819_path) %>%
  janitor::clean_names("snake", numerals = "left") %>%
  naniar::replace_with_na_all(~ .x == "S") %>%
  dplyr::mutate(
    # Convert survey results into numeric variables
    dplyr::across(c(5:50), as.numeric),
    # Make school number an integer so it can be sorted
    school_number = dplyr::if_else(school_number == "(all)", as.integer("0"), as.integer(school_number))
  ) %>%
  dplyr::rename(
    est_num_parents = estimated_parent_number_eligible1,
    est_response_rate = estimated_parent_response_rate1
  ) %>%
  dplyr::relocate(management_type, .after = school_name) %>%
  dplyr::arrange(school_number)

# usethis::use_data(parent_survey_SY1819, overwrite = TRUE)

transportation_survey_SY1819_path <- "inst/extdata/SY18-19_Parent_Survey_Transportation.xlsx"

transportation_survey_SY1819 <- readxl::read_excel(transportation_survey_SY1819_path) %>%
  janitor::clean_names("snake", numerals = "left") %>%
  naniar::replace_with_na_all(~ .x == "*") %>%
  dplyr::mutate(
    # Convert survey results into numeric variables
    dplyr::across(c(5:9), as.numeric),
    # Make school number an integer so it can be sorted
    school_number = dplyr::if_else(school_number == "(all)", as.integer("0"), as.integer(school_number))
  ) %>%
  dplyr::select(school_number, transportation_how_does_your_child_usually_get_to_school_walk:transportation_how_does_your_child_usually_get_to_school_car)

parent_survey_SY1819 <- parent_survey_SY1819 %>%
  left_join(transportation_survey_SY1819, by = "school_number")

usethis::use_data(parent_survey_SY1819, overwrite = TRUE)

# Getting the text of the questions
parent_survey_SY1819_names <- readxl::read_excel(path = parent_survey_SY1819_path) %>%
  names() %>%
  tibble::enframe() %>%
  dplyr::mutate(
    variable = snakecase::to_any_case(value, "snake", numerals = "left"),
    variable = dplyr::case_when(
      variable == "estimated_parent_number_eligible1" ~ "est_num_parents",
      variable == "estimated_parent_response_rate1" ~ "est_response_rate",
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
      label == "OVERALL" ~ "Overall Score",
      label == "Estimated Parent Number Eligible1" ~ "Estimated number of eligible parents",
      label == "Estimated Parent Response Rate1" ~ "Estimated parent response rate",
      TRUE ~ label
    )
  ) %>%
  dplyr::select(variable, label)

transportation_survey_SY1819_names <- readxl::read_excel(path = transportation_survey_SY1819_path) %>%
  names() %>%
  tibble::enframe() %>%
  dplyr::select(-name) %>%
  dplyr::mutate(
    variable = snakecase::to_any_case(value, "snake", numerals = "left")
  ) %>%
  dplyr::filter(stringr::str_detect(variable, "^transportation")) %>%
  dplyr::rename(label = value)

parent_survey_SY1819_names <- parent_survey_SY1819_names %>%
  dplyr::bind_rows(transportation_survey_SY1819_names)

# Switch to long format and add label column
parent_survey_SY1819_long <- parent_survey_SY1819 %>%
  tidyr::pivot_longer(
    cols = c(8:54),
    names_to = "variable",
    values_to = "value"
  ) %>%
  dplyr::left_join(parent_survey_SY1819_names, by = "variable") %>%
  dplyr::mutate(
    label = dplyr::case_when(
      variable == "admin9_parents_have_the_opportunity_to_give_input_into_the_schools_decisions" ~ "Parents have the opportunity to give input into the school's decisions",
      variable == "creative1_student_work_in_the_arts_is_displayed_or_presented_in_my_childs_school" ~ "Student work in the arts is displayed or presented in my child's school",
      variable == "parent11_parents_can_use_resources_at_my_childs_school_when_school_is_not_in_session" ~ "Parents can use resources at my child's school when school is not in session",
      variable == "parent19_i_feel_that_my_input_into_my_childs_education_is_valued" ~ "I feel that my input into my child's education is valued",
      variable == "parent20_my_childs_school_can_connect_me_to_resources_in_the_community" ~ "My child's school can connect me to resources in the community",
      variable == "parent23_my_childs_school_regularly_communicates_with_parents_about_how_they_can_help_their_children_learn" ~ "My child's school regularly communicates with parents about how they can help their children learn",
      variable == "satisfy11_overall_i_am_satisfied_with_my_childs_school" ~ "Overall, I am satisfied with my child's school",
      variable == "value1_regular_on_time_attendance_is_important_to_my_childs_success_in_school" ~ "Regular, on-time attendance is important to my child's success in school",
      TRUE ~ label
    )
  ) %>%
  dplyr::arrange(school_number)

usethis::use_data(parent_survey_SY1819_long, overwrite = TRUE)

# Student and educator Survey ----
# Starting in the 2018-2019 school year, all teachers and students in grades 5-11 had the opportunity to take
# the Maryland School Survey. The survey collects important information about relationships, engagement,
# the school environment, and safety. School leaders use results to learn about and improve the school community.
student_educator_survey_path <- "https://www.baltimorecityschools.org/sites/default/files/inline-files/PUBLIC-2019-Maryland-school-Survey-Student-Educator-Results.xlsx"

student_survey_SY1819 <- openxlsx::read.xlsx(student_educator_survey_path,
  sheet = 1
) %>%
  janitor::clean_names("snake") %>%
  rename(
    grade_band = school_gradeband,
    respondent_grade_band = gradeband_for_report_card_e_m_h,
    respondent_count = student_count,
    respondent_group = summary_group_title,
    domain = domain_name,
    topic = topic_name,
    average_score = student_score_average
  ) %>%
  select(-school_year) %>%
  relocate(respondent_count, .after = respondent_grade_band) %>%
  naniar::replace_with_na(list(average_score = "*", respondent_count = "*")) %>%
  mutate(
    school_number = if_else(school_number == "A",
      as.integer(0),
      as.integer(school_number)
    ),
    average_score = as.numeric(average_score),
    respondent_count = as.integer(respondent_count)
  ) %>%
  arrange(school_number, respondent_grade_band, domain, respondent_group)

student_survey_SY1819$grade_band <- factor(student_survey_SY1819$grade_band, c("E", "EM", "EMH", "M", "MH", "H"))

usethis::use_data(student_survey_SY1819, overwrite = TRUE)


educator_survey_SY1819 <- openxlsx::read.xlsx(student_educator_survey_path,
  sheet = 2
) %>%
  janitor::clean_names("snake") %>%
  rename(
    school_number = school,
    grade_band = school_gradeband,
    domain = domain_name,
    topic = topic_name,
    average_score = educator_score_average,
    respondent_count = educator_count
  ) %>%
  select(-school_year) %>%
  relocate(respondent_count, .after = grade_band) %>%
  naniar::replace_with_na(list(average_score = "*", respondent_count = "*")) %>%
  mutate(
    school_number = if_else(school_number == "A",
      as.integer(0),
      as.integer(school_number)
    ),
    respondent_count = as.integer(respondent_count),
    average_score = as.numeric(average_score)
  ) %>%
  arrange(school_number, domain)

educator_survey_SY1819$grade_band <- factor(educator_survey_SY1819$grade_band, c("E", "EM", "EMH", "M", "MH", "H"))

usethis::use_data(educator_survey_SY1819, overwrite = TRUE)


# KRA data ----
kra_school_results_path <- "https://www.baltimorecityschools.org/sites/default/files/inline-files/PUBLIC-2019-20-KRA-School-Level-Results.xlsx"

kra_results_SY1920 <- openxlsx::read.xlsx(kra_school_results_path,
  sheet = 1
) %>%
  janitor::clean_names("snake") %>%
  naniar::replace_with_na_all(condition = ~ .x == "*") %>%
  mutate(
    school_number = if_else(school_name == "All Baltimore City Schools", 0L, as.integer(school_number)),
  ) %>%
  mutate(
    group_type = stringr::str_extract(student_group, ".+(?=:)"),
    student_group = if_else(student_group != "All Students ", stringr::str_extract(student_group, "(?<=:[:space:]).+"), "All Students"),
    student_group = if_else(student_group == "Yes", group_type, student_group),
    .after = student_group
  ) %>%
  naniar::replace_with_na(replace = list(group_type = c("Economically Disadvantaged", "EL", "SWD"))) %>%
  rename(
    num_tested_scored_overall = test_takers_with_overall_score
  ) %>%
  rename_with(
    .fn = ~ stringr::str_replace(.x, "percent_", "perc_"),
    .cols = starts_with("percent")
  ) %>%
  rename_with(
    .fn = ~ stringr::str_replace(.x, "average_", "avg_"),
    .cols = starts_with("average")
  ) %>%
  mutate(
    num_tested_scored_overall = as.integer(num_tested_scored_overall),
    dplyr::across(c(6:13), as.numeric)
  ) %>%
  arrange(school_number)

# Descriptions and definitions in source Excel sheet
# kra_results_SY1920_details <- openxlsx::read.xlsx(kra_school_results_path, sheet = 2)

usethis::use_data(kra_results_SY1920, overwrite = TRUE)
