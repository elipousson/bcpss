library(dplyr)

selected_crs <- 2804

bcps_es_zones_SY2324_path <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/arcgis/rest/services/School_Profiles_WFL1/FeatureServer/14"

bcps_es_zones_SY2324 <- esri2sf::esri2sf(bcps_es_zones_SY2324_path, crs = selected_crs) |>
  janitor::clean_names("snake") |>
  select(
    zone_number = zone_no,
    zone_name,
    program_number = lower_grades,
    program_name = prog_name,
    lower_grades,
    upper_grades,
    geometry = geoms
  ) |>
  dplyr::mutate(
    zone_number = as.integer(zone_number),
    program_number = as.integer(program_number),
    program_name_short = stringr::str_remove(zone_name, " zone$"),
    upper_grades = as.character(upper_grades)
  ) |>
  dplyr::arrange(zone_number)

usethis::use_data(bcps_es_zones_SY2324, overwrite = TRUE)

bcps_es_zones_SY2223_path <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/SY2223_Elementary_Zones/FeatureServer/21"

bcps_es_zones_SY2223 <- esri2sf::esri2sf(bcps_es_zones_SY2223_path) |>
  janitor::clean_names("snake") |>
  sf::st_transform(selected_crs) |>
  dplyr::mutate(
    ms_feeder = has_m_feeder == "Yes",
    program_number = zone_no,
    program_name_short = stringr::str_remove(zone_name, "[:space:]zone$")
  ) |>
  dplyr::select(
    zone_number = zone_no,
    zone_name,
    program_number,
    program_name_short,
    ms_feeder,
    lower_grades,
    upper_grades,
    quadrant = quad
  ) |>
  sfext::rename_sf_col() |>
  dplyr::mutate(
    zone_number = as.integer(zone_number),
    program_number = as.integer(program_number)
  ) |>
  dplyr::arrange(zone_number)

usethis::use_data(bcps_es_zones_SY2223, overwrite = TRUE)


# Import Baltimore City Public School 2021-2022 attendance zones from ArcGIS Feature Server layer
bcps_es_zones_SY2122_path <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/BCPSZones_2122/FeatureServer/0"

bcps_es_zones_SY2122 <- esri2sf::esri2sf(bcps_es_zones_SY2122_path) |>
  janitor::clean_names("snake") |>
  sf::st_transform(selected_crs) |>
  dplyr::select(
    zone_number = zone_numbe,
    zone_name,
    program_number = prog_no,
    program_name_short = prog_name,
    geometry = geoms
  ) |>
  mutate(
    zone_number = as.integer(zone_number),
    program_number = as.integer(program_number)
  ) |>
  dplyr::arrange(zone_number)

usethis::use_data(bcps_es_zones_SY2122, overwrite = TRUE)


# Import Baltimore City Public School 2020-2021 attendance zones from ArcGIS Feature Server layer
bcps_es_zones_SY2021_path <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/BCPSZones_2021/FeatureServer/0"

bcps_es_zones_SY2021 <- esri2sf::esri2sf(bcps_es_zones_SY2021_path) |>
  janitor::clean_names("snake") |>
  sf::st_transform(selected_crs) |>
  dplyr::select(
    zone_number = zone_numbe,
    zone_name,
    program_number = prog_no,
    program_name_short = prog_name,
    geometry = geoms
  ) |>
  mutate(
    zone_number = as.integer(zone_number),
    program_number = as.integer(program_number)
  ) |>
  dplyr::arrange(zone_number)

usethis::use_data(bcps_es_zones_SY2021, overwrite = TRUE)

bcps_programs_SY2223_path <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/SY2223_Programs/FeatureServer/0"

bcps_programs_SY2223 <- esri2sf::esri2sf(bcps_programs_SY2223_path) |>
  janitor::clean_names("snake") |>
  sf::st_transform(selected_crs) |>
  dplyr::select(
    program_number = prog_no,
    program_name_short = prog_short,
    grade_band = msde,
    management_type = mgmnt_type,
    category = categorization,
    swing,
    swing_building_number = swing_bldg_no,
    geometry = geoms
  ) |>
  naniar::replace_with_na(list(category = "na")) |>
  mutate(
    grade_band = stringr::str_replace(grade_band, "'", ""),
    swing = dplyr::if_else(swing == "n", FALSE, TRUE)
  ) |>
  dplyr::arrange(program_number)

usethis::use_data(bcps_programs_SY2223, overwrite = TRUE)

# 2020-2021 program sites
bcps_programs_SY2021_path <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/SY2021_Programs/FeatureServer/0"

bcps_programs_SY2021 <- esri2sf::esri2sf(bcps_programs_SY2021_path) |>
  janitor::clean_names("snake") |>
  sf::st_transform(selected_crs) |>
  dplyr::select(
    program_number = prog_no,
    program_name_short = prog_short,
    grade_band = config,
    management_type = mgmnt_type,
    category = categorization,
    swing,
    swing_building_number = swing_bldg_no,
    colocated,
    two_buildings = two_bldgs,
    home_building = home_bldg,
    council_district = council,
    legislative_district = legis,
    congressional_district = congress,
    planning_area = plan_area,
    quadrant = quad,
    zone_number = ezone,
    zone_name,
    geometry = geoms
  ) |>
  naniar::replace_with_na(list(category = "na")) |>
  mutate(
    grade_band = str_replace(grade_band, "'", ""),
    swing = if_else(swing == "n", FALSE, TRUE),
    colocated = if_else(colocated == "n", FALSE, TRUE),
    two_buildings = if_else(two_buildings == "n", FALSE, TRUE),
    home_building = as.integer(home_building),
    council_district = as.integer(council_district),
    legislative_district = if_else(legislative_district == "44", "44A", as.character(legislative_district)),
    congressional_district = paste0(str_to_lower(congressional_district), " District")
  ) |>
  dplyr::arrange(program_number)

usethis::use_data(bcps_programs_SY2021, overwrite = TRUE)

bcps_programs_SY1920_path <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/SY1920_Building_Status_Publish/FeatureServer/0"

bcps_programs_SY1920 <-
  getdata::get_esri_data(
    url = bcps_programs_SY1920_path,
    crs = selected_crs
  ) |>
  dplyr::select(
    program_number = prog_no,
    program_name = prog_name_long,
    program_name_short = prog_name_short,
    grade_band = msde,
    management_type = management,
    # category = categorization,
    swing = in_swing_space,
    swing_building_number = swing_bldg_no,
    colocated,
    # two_buildings = two_bldgs,
    # home_building = home_bldg,
    legislative_district,
    council_district = city_council_district,
    # congressional_district = congress,
    # planning_area = plan_area,
    # quadrant = quad,
    # zone_number = ezone,
    # zone_name
  ) |>
  sfext::rename_sf_col()

bcps_programs_SY1920 <- bcps_programs_SY1920 |>
  dplyr::mutate(
    grade_band = str_replace(grade_band, "'", ""),
    swing = if_else(swing == "n", FALSE, TRUE),
    colocated = if_else(colocated == "n", FALSE, TRUE),
    council_district = as.integer(council_district),
    legislative_district = if_else(legislative_district == "44", "44A", as.character(legislative_district))
  ) |>
  dplyr::arrange(program_number)

usethis::use_data(bcps_programs_SY1920, overwrite = TRUE)


bcps_programs_SY2122_path <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/SY2122_Ezones_and_Programs/FeatureServer/11"

bcps_programs_SY2122 <-
  getdata::get_esri_data(
    url = bcps_programs_SY2122_path,
    crs = selected_crs
  ) |>
  dplyr::select(
    program_number = prog_no,
    program_name_short = prog_short,
    grade_band = msde,
    management_type = mgmnt_type,
    category = categorization,
    swing,
    swing_building_number = swing_bldg_no
  ) |>
  sfext::rename_sf_col()


bcps_programs_SY2122 <-
  bcps_programs_SY2122 |>
  dplyr::mutate(
    grade_band = stringr::str_replace(grade_band, "'", ""),
    swing = dplyr::if_else(swing == "n", FALSE, TRUE)
  ) |>
  naniar::replace_with_na(
    list(
      category = "na"
    )
  ) |>
  dplyr::arrange(program_number)


usethis::use_data(bcps_programs_SY2122, overwrite = TRUE)

url <- "https://services1.arcgis.com/43Lm3JYE3nM91DAF/ArcGIS/rest/services/Surplus_Schools/FeatureServer/0"

bcps_surplus_schools <-
  getdata::get_esri_data(
    url = url,
    crs = 2804
  ) |>
  mutate(
    interior_sq_ft = sq_ft,
    property_acres = campus_acre,
    url = link1
  ) |>
  select(-c(starts_with("link"), objectid)) |>
  naniar::replace_with_na(
    list(
      year = "n/a",
      status = "n/a"
    )
  ) |>
  dplyr::rename(
    status_sy20 = status
  ) |>
  dplyr::arrange(bldg_name) |>
  sfext::rename_sf_col()

# NOTE: The data from the prior processing pipeline was manually edited and
# updated in fall 2022 in a Google Sheet using a variety of news sources and
# public administrative records
url <- "https://docs.google.com/spreadsheets/d/156WkhGtAZ0y5CVNxfQSEsjiTHD0W3sslSzTGy0K3QEs/edit?usp=sharing"

bcps_surplus_schools <-
  getdata::get_gsheet_data(
    url = url
  )

bcps_surplus_schools <- sfext:::wkt_df_to_sf(data, crs = 2804)

use_data(bcps_surplus_schools, overwrite = TRUE)

url <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/Building_Status_SY1920_v2/FeatureServer/0"

bcps_buildings_SY1920 <-
  getdata::get_esri_data(
    url = url,
    crs = 2804
  )

getdata::make_variable_dictionary(
  bcps_buildings_SY1920
) |>
  View()
