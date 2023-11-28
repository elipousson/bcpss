library(dplyr)

path <- here::here("inst/extdata/G Appendix SY2122 CEFMP.xlsx")

bcpss_buildings_SY2122_raw <- readxl::read_excel(path, col_types = "text") |>
  janitor::clean_names("snake")

bcpss_buildings_SY2122_raw <- janitor::remove_empty(bcpss_buildings_SY2122_raw, "cols")

bcpss_buildings_SY2122 <- dplyr::filter(
  bcpss_buildings_SY2122_raw,
  psc_no != "PSC No." | is.na(psc_no),
  !(is.na(address) & is.na(building_data))
) |>
  mutate(
    psc_no = stringr::str_sub(psc_no, start = 1, end = 6),
    psc_no = if_else(
      psc_no_text == "-",
      "N/A",
      psc_no
    ),
    management_type = if_else(
      !is.na(program_name) & is.na(management_type),
      "Traditional",
      management_type
    ),
    bldg_change = case_when(
      stringr::str_detect(building_data, "(Rp)") ~ "Replacement",
      stringr::str_detect(building_data, "(R)") ~ "Renovation",
      stringr::str_detect(building_data, "(A)") ~ "Addition",
      stringr::str_detect(building_data, "(D)") ~ "Demolition",
      stringr::str_detect(building_data, "(Orig)") ~ "Built",
      stringr::str_detect(building_data, "(M)") ~ "Modified"
    ),
    year = readr::parse_integer(
      stringr::str_remove_all(building_data, "[:alpha:]|[:punct:]|[:blank:]")
      ),
    util = round(as.numeric(util), 2),
    acre_age = round(as.numeric(acre_age), 2),
    swing_space = stringr::str_detect(building_name, "(SWING)$"),
    swing_space = if_else(
      is.na(swing_space),
      FALSE,
      TRUE
    ),
    bcpss_owned = !stringr::str_detect(building_notes, "not owned by City Schools.") | is.na(building_notes)
  ) |>
  dplyr::rename(
    psc_number = psc_no,
    program_number = prog_no,
    bldg_number = bldg_no,
    bldg_name = building_name,
    bldg_enrollment = bldg_enroll_ment,
    program_enrollment = prog_enroll_ment,
    acres = acre_age,
    bldg_sqft = total_sqft,
    fci_score = physical_condition_fci_score,
    notes = building_notes,
    utilization_pct = util
  ) |>
  tidyr::fill(
    psc_number, management_type, bldg_number, bldg_enrollment, program_name,
    bldg_name, bcpss_owned, program_number, program_enrollment, src, utilization_pct,  address) |>
  dplyr::select(-c(config, building_data, psc_no_text)) |>
  naniar::replace_with_na(
    replace = list(
      psc_number = "N/A"
    )
  )

bcpss_buildings_SY2122_year_built <- bcpss_buildings_SY2122 |>
  filter(bldg_change %in% c("Built", "Replacement")) |>
  arrange(desc(bldg_change)) |>
  distinct(bldg_number, .keep_all = TRUE) |>
  select(bldg_number, year_built = year)

bcpss_buildings_SY2122 <- bcpss_buildings_SY2122 |>
  left_join(bcpss_buildings_SY2122_year_built, by = "bldg_number") |>
  select(-c(bldg_change, year, sf_of_orig_change)) |>
  distinct(bldg_number, program_number, .keep_all = TRUE)

usethis::use_data(bcpss_buildings_SY2122, overwrite = TRUE)
