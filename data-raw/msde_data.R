library(tidyverse)

baltimore_enrollment <-
  filter(mapmaryland::msde_enrollment, lss_name == "Baltimore City")

usethis::use_data(baltimore_enrollment, overwrite = TRUE)

# Enrollment data (exported 2021 Feb. 22) ----

enrollment_msde_SY0919 <- list.files("inst/extdata", full.names = TRUE) %>%
  tibble(path = .) %>%
  filter(str_detect(path, "Enrollment_")) %>%
  mutate(data = map(
    path,
    ~ read_csv(.x, col_types = cols(.default = "c"))
  )) %>%
  unnest(data) %>%
  janitor::clean_names("snake") %>%
  mutate(
    lea_number = coalesce(lea_number, lss_number),
    lea_name = coalesce(lea_name, lss_name),
    grade = coalesce(grade, grade_title)
  ) %>%
  filter(lea_name == "Baltimore City") %>%
  mutate(
    school_number = if_else(school_number == "A", "0", school_number),
    school_number = as.integer(school_number),
    grade_range = case_when(
      grade == "Total Enrollment" ~ "All Grades",
      grade == "Elementary" ~ grade,
      grade == "Middle School" ~ grade,
      grade == "High School" ~ grade
    ),
    grade = case_when(
      str_detect(grade, "Grade[:space:]") ~ str_remove(grade, "Grade[:space:]"),
      grade == "Prekindergarten" ~ "PK",
      grade == "Kindergarten" ~ "K",
      TRUE ~ "*"
    )
  ) %>%
  naniar::replace_with_na_all(condition = ~ .x == "*") %>%
  mutate(enrolled_count = as.numeric(enrolled_count)) %>%
  rename(school_year = academic_year) %>%
  select(-c(path, lea_number, lea_name, lss_number, lss_name, grade_title, create_date))

enrollment_msde_SY0919$grade <- factor(enrollment_msde_SY0919$grade, c("PK", "K", as.character(c(1:12))))

usethis::use_data(enrollment_msde_SY0919, overwrite = TRUE)


# Student mobility data (not exported) ----


student_mobility_msde_SY1520 <- list.files("inst/extdata", full.names = TRUE) %>%
  tibble(path = .) %>%
  filter(str_detect(path, "Student_")) %>%
  mutate(data = map(
    path,
    ~ read_csv(.x, col_types = cols(.default = "c"))
  )) %>%
  unnest(data) %>%
  janitor::clean_names("snake") %>%
  mutate(
    lea_number = coalesce(lea_number, lss_number),
    lea_name = coalesce(lea_name, lss_name),
    mobility_pct = coalesce(mobility_pct, mobility_rate),
    mobility_cnt = coalesce(mobility_cnt, mobility_count),
    entrants_pct = coalesce(entrants_pct, entrants_rate),
    entrants_cnt = coalesce(entrants_cnt, entrants_count),
    withdrawals_pct = coalesce(withdrawals_pct, withdrawals_rate),
    withdrawals_cnt = coalesce(withdrawals_cnt, withdrawals_count),
    avg_daily_member_cnt = coalesce(avg_daily_member_cnt, avg_daily_member_count)
  ) %>%
  relocate(create_date, .after = academic_year) %>%
  select(-c(path, lss_number, lss_name, mobility_rate:avg_daily_member_count)) %>%
  mutate(
    across(
      where(is.character),
      ~ case_when(
        .x == "<= 5.0" ~ as.character("5.0"),
        .x == ">= 95.0" ~ as.character("95.0"),
        TRUE ~ .x
      )
    )
  ) %>%
  naniar::replace_with_na_all(condition = ~ .x == "*")

student_mobility_msde_SY1520 <- student_mobility_msde_SY1520 %>%
  mutate(
    across(
      all_of(c(8:14)),
      as.numeric
    )
  ) %>%
  filter(lea_name == "Baltimore City") %>%
  rename(school_year = academic_year) %>%
  select(-c(lea_number, lea_name))

student_mobility_msde_SY1520_long <- student_mobility_msde_SY1520 %>%
  tidyr::pivot_longer(
    cols = c(8:14),
    names_to = "variable",
    values_to = "value"
  )

# Attendance data (exported 2021 Feb. 22) ----

attendance_msde_SY0919 <- list.files("inst/extdata", full.names = TRUE) %>%
  tibble(path = .) %>%
  filter(str_detect(path, "Attendance_")) %>%
  mutate(data = map(
    path,
    ~ read_csv(.x, col_types = cols(.default = "c"))
  )) %>%
  unnest(data) %>%
  janitor::clean_names("snake") %>%
  mutate(
    lea_number = coalesce(lea_number, lss_number),
    lea_name = coalesce(lea_name, lss_name)
  ) %>%
  filter(lea_name == "Baltimore City") %>%
  select(-c(path, lea_number, lea_name, lss_number, lss_name, create_date)) %>%
  rename(
    school_year = academic_year,
    grade_band = school_type
  ) %>%
  mutate(
    school_number = if_else(school_number == "A", "0", school_number),
    school_number = as.integer(school_number),
    across(
      where(is.character),
      ~ case_when(
        .x == "<= 5.0" ~ as.character("5.0"),
        .x == ">= 95.0" ~ as.character("95.0"),
        TRUE ~ .x
      )
    )
  ) %>%
  naniar::replace_with_na_all(condition = ~ .x == "*") %>%
  mutate(
    across(
      all_of(c(5:15)),
      as.numeric
    )
  )

usethis::use_data(attendance_msde_SY0919, overwrite = TRUE)

# Not exported
attendance_msde_SY1520_long <- attendance_msde_SY1520 %>%
  tidyr::pivot_longer(
    cols = c(8:18),
    names_to = "variable",
    values_to = "value"
  )

# Accountability data (exported 2021 July 13) ----

accountability_SY19 <- read_csv("inst/extdata/2019_Accountability_Schools.csv", col_types = cols(.default = "c")) %>%
  janitor::clean_names("snake") %>%
  rename(
    school_year = year,
    lea_number = lss_number,
    lea_name = lss_name
  ) %>%
  filter(lea_name == "Baltimore City") %>%
  naniar::replace_with_na_all(condition = ~ .x == "na") %>%
  mutate(
    across(
      all_of(c(7:10)),
      as.numeric
    ),
    across(
      all_of(c(4, 6)),
      as.integer
    )
  ) %>%
  select(-c(lea_number, lea_name))

usethis::use_data(accountability_SY19, overwrite = TRUE)

nces_school_directory_SY19 <- readxl::read_excel("inst/extdata/School_Directory_2019.xlsx") %>%
  janitor::clean_names("snake") %>%
  rename(
    school_year = academic_year,
    grade_band = school_type
  ) %>%
  filter(
    lss_name == "Baltimore City"
  ) %>%
  mutate(
    school_number = as.integer(school_number)
  ) %>%
  select(-c(lss_number, lss_name, create_date))

usethis::use_data(nces_school_directory_SY19, overwrite = TRUE)
