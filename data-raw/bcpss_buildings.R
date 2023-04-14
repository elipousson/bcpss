path <- "inst/extdata/G Appendix SY2122 CEFMP.xlsx"

data <-
  readxl::read_excel(
  here::here(path),
  col_types = "text"
) |>
  janitor::clean_names("snake")

data_clean <-
  data |>
  janitor::remove_empty(quiet = FALSE) |>
  dplyr::filter(
    is.na(psc_no) | psc_no != "PSC No."
  ) |>
  dplyr::mutate(
    config = stringr::str_replace(config, " to ", "-"),
    config = stringr::str_remove(config, "^'"),
    psc_number = stringr::str_remove(psc_no_text, "'"),
    psc_number = dplyr::case_match(
      psc_number,
      "-" ~ "None",
      "" ~ NA_character_,
      .default = psc_number
    ),
   # psc_no_key = glue::glue("{psc_no_text} {bldg_no}"),
    building_data = stringr::str_remove_all(building_data, "\\(|\\)|[:space:]"),
    .after = dplyr::all_of("bldg_no")
  ) |>
  tidyr::fill(psc_number, bldg_no, building_name, prog_no, program_name, address) |>
  dplyr::mutate(
    psc_number = dplyr::if_else(
      psc_number == "None",
      psc_number,
      stringr::str_pad(psc_number, 6, pad = "0", side = "right")
    )
  ) |>
  tidyr::separate(
    building_data,
    into = c("bldg_event_year", "bldg_event_type"),
    sep = "-"
  ) |>
  dplyr::select(-c(psc_no_text, psc_no)) |>
  dplyr::rename(
    building_enrollment = bldg_enroll_ment,
    program_enrollment = prog_enroll_ment
  )

data_locations <- data_clean |>
  dplyr::distinct(psc_no, bldg_no) |>
  dplyr::rename(psc_number = psc_no) |>
  dplyr::left_join(mapmaryland::md_schools)
