selected_crs <- 2804

# Import Baltimore City Public School 2021-2022 attendance zones from ArcGIS Feature Server layer
bcps_es_zones_SY2122_path <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/BCPSZones_2122/FeatureServer/0"

bcps_es_zones_SY2122 <- esri2sf::esri2sf(bcps_es_zones_SY2122_path) %>%
  janitor::clean_names("snake") %>%
  sf::st_transform(selected_crs) %>%
  dplyr::select(
    zone_number = zone_numbe,
    zone_name,
    program_number = prog_no,
    program_name_short = prog_name,
    geometry = geoms
  ) %>%
  mutate(
    zone_number = as.integer(zone_number),
    program_number = as.integer(program_number)
  ) %>%
  dplyr::arrange(zone_number)

usethis::use_data(bcps_es_zones_SY2122, overwrite = TRUE)


# Import Baltimore City Public School 2020-2021 attendance zones from ArcGIS Feature Server layer
bcps_es_zones_SY2021_path <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/BCPSZones_2021/FeatureServer/0"

bcps_es_zones_SY2021 <- esri2sf::esri2sf(bcps_es_zones_SY2021_path) %>%
  janitor::clean_names("snake") %>%
  sf::st_transform(selected_crs) %>%
  dplyr::select(
    zone_number = zone_numbe,
    zone_name,
    program_number = prog_no,
    program_name_short = prog_name,
    geometry = geoms
  ) %>%
  mutate(
    zone_number = as.integer(zone_number),
    program_number = as.integer(program_number)
    ) %>%
  dplyr::arrange(zone_number)

usethis::use_data(bcps_es_zones_SY2021, overwrite = TRUE)

# 2020-2021 program sites
bcps_programs_SY2021_path <- "https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/SY2021_Programs/FeatureServer/0"

bcps_programs_SY2021 <- esri2sf::esri2sf(bcps_programs_SY2021_path) %>%
  janitor::clean_names("snake") %>%
  sf::st_transform(selected_crs) %>%
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
  ) %>%
  naniar::replace_with_na(list(category = "na")) %>%
  mutate(
    grade_band = str_replace(grade_band, "'", ""),
    swing = if_else(swing == "n", FALSE, TRUE),
    colocated = if_else(colocated == "n", FALSE, TRUE),
    two_buildings = if_else(two_buildings == "n", FALSE, TRUE),
    home_building = as.integer(home_building),
    council_district = as.integer(council_district),
    legislative_district = if_else(legislative_district == "44", "44A", as.character(legislative_district)),
    congressional_district = paste0(str_to_lower(congressional_district), " District")
    ) %>%
  dplyr::arrange(program_number)

usethis::use_data(bcps_programs_SY2021, overwrite = TRUE)
