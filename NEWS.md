# bcpss 0.2.0

Versioning for this package has been and may continue to be somewhat uneven. Here are the key changes since the last version:

- Add current year zones and program data `bcps_es_zones_SY2223` and `bcps_programs_SY2223`
- Update `bcpss_enrollment` with 2023 data from `marylandedu::msde_enrollment`
- Export `bcpss_enrollment`, `bcpss_attendance`, and `bcpss_student_mobility` data (from MSDE via `{marylandedu}` package) (2023-04-14)
- Standardize naming convention for datasets (breaking change for `nces_school_directory_SY19` and `accountability_SY19` datasets) (2023-04-14)
- Add `bcps_surplus_schools` data (2022-11-13)
- Add `bcps_programs_SY1920` data (2022-10-20)

# bcpss 0.1.0.9001 (2022-01-10)

- docs: Update pkgdown site to use Bootstrap 5 + include info re: `bcps_es_zones_SY2122`
- docs: Update README w/ related projects
- feat: Add spatial data with SY21-22 attendance zone boundaries (`bcps_es_zones_SY2122`)

# bcpss 0.1.0.9000 (2022-01-10)

- fix: Change year column to school_year for accountability data
- docs: fix typo in KRA data documentation
- Add educator and student spring 2019 survey data
- Switch school_type variable name to management_type
- Add current spatial data for BCPS elementary school zones
- Add current spatial data for BCPS programs
- Rename parent_school_survey_SY1819 to parent_survey_SY1819


