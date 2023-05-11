#' Baltimore City Public Schools Enrollment and Demographic data (SY 2019-2020)
#'
#' Total enrollment and demographic characteristics for Baltimore City public
#' school students including data aggregated by grade, grade band, school, and
#' citywide for the 2019-2020 school year.
#'
#' For variables with percentages, a value of 0.05 may represent <=5% rather
#' than 5% and a value of 0.95 may represent >=95% rather than 95%.
#'
#' @format A data frame with 2,243 rows and 19 variables:
#' \describe{
#'   \item{`school_number`}{School number}
#'   \item{`school_name`}{School name}
#'   \item{`management_type`}{School management type}
#'   \item{`grade_band`}{Grade band (factor)}
#'   \item{`grade`}{Grade (factor)}
#'   \item{`grade_range`}{Grade range (factor)}
#'   \item{`total_enrollment`}{Total Enrollment}
#'   \item{`percent_male`}{Percent Males}
#'   \item{`percent_female`}{Percent Females}
#'   \item{`percent_direct_certification`}{Percent Direct Certification}
#'   \item{`percent_swd`}{Percent Students with Disabilities (SWD)}
#'   \item{`percent_el`}{Percent English Learner (EL)}
#'   \item{`percent_non_hispanic_black`}{Percent Non-Hispanic Black}
#'   \item{`percent_non_hispanic_white`}{Percent Non-Hispanic White}
#'   \item{`percent_hispanic`}{Percent Hispanic}
#'   \item{`percent_non_hispanic_asian`}{Percent Non-Hispanic Asian}
#'   \item{`percent_non_hispanic_american_indian`}{Percent Non-Hispanic American
#'   Indian}
#'   \item{`percent_non_hispanic_pacific_islander`}{Percent Non-Hispanic Pacific
#'   Islander}
#'   \item{`percent_non_hispanic_multiracial`}{Percent Non-Hispanic Multiracial}
#' }
#' @source <https://www.baltimorecityschools.org/data>
"enrollment_demographics_SY1920"

#' Baltimore City Public Schools Enrollment and Demographic data long (SY 2019-2020)
#'
#' Total enrollment and demographic characteristics for Baltimore City public
#' school students including data aggregated by grade, grade band, school, and
#' citywide for the 2019-2020 school year. Long format version is based on the
#' `enrollment_demographics_SY1920` data with an additional `label` column based
#' on the original Excel sheet column names.
#'
#' @format A data frame with 26,916 rows and 10 variables:
#' \describe{
#'   \item{`school_number`}{School number}
#'   \item{`school_name`}{School name}
#'   \item{`management_type`}{School management type}
#'   \item{`grade_band`}{Grade band}
#'   \item{`grade`}{Grade}
#'   \item{`grade_range`}{Grade range}
#'   \item{`total_enrollment`}{Total Enrollment}
#'   \item{`variable`}{Variable}
#'   \item{`share`}{Percent of Total Enrollment}
#'   \item{`label`}{Variable label}
#' }
#' @source <https://www.baltimorecityschools.org/data>
"enrollment_demographics_SY1920_long"


#' Baltimore City Public Schools Enrollment and Demographic data (SY 2020-2021)
#'
#' Total enrollment and demographic characteristics for Baltimore City public
#' school students including data aggregated by grade, grade band, school, and
#' citywide for the 2020-2021 school year.
#'
#' For variables with percentages, a value of 0.05 may represent <=5% rather
#' than 5% and a value of 0.95 may represent >=95% rather than 95%.
#'
#' @format A data frame with 2,192 rows and 19 variables:
#' \describe{
#'   \item{`school_number`}{School number}
#'   \item{`school_name`}{School name}
#'   \item{`management_type`}{School management type}
#'   \item{`grade_band`}{Grade band (factor)}
#'   \item{`grade`}{Grade (factor)}
#'   \item{`grade_range`}{Grade range (factor)}
#'   \item{`total_enrollment`}{Total Enrollment}
#'   \item{`percent_male`}{Percent Male}
#'   \item{`percent_female`}{Percent Female}
#'   \item{`percent_direct_certification`}{Percent Direct Certification}
#'   \item{`percent_swd`}{Percent Students with Disabilities (SWD)}
#'   \item{`percent_el`}{Percent English Learner (EL)}
#'   \item{`percent_non_hispanic_black`}{Percent Non-Hispanic Black}
#'   \item{`percent_non_hispanic_white`}{Percent Non-Hispanic White}
#'   \item{`percent_hispanic`}{Percent Hispanic}
#'   \item{`percent_non_hispanic_asian`}{Percent Non-Hispanic Asian}
#'   \item{`percent_non_hispanic_american_indian`}{Percent Non-Hispanic American
#'   Indian}
#'   \item{`percent_non_hispanic_pacific_islander`}{Percent Non-Hispanic Native Hawaiian or Other Pacific
#'   Islander}
#'   \item{`percent_non_hispanic_multiracial`}{Percent Non-Hispanic Multiracial}
#' }
#' @source <https://www.baltimorecityschools.org/data>
"enrollment_demographics_SY2021"

#' Baltimore City Public Schools Enrollment and Demographic data (SY 2021-2022)
#'
#' Total enrollment and demographic characteristics for Baltimore City public
#' school students including data aggregated by grade, grade band, school, and
#' citywide for the 2021-2022 school year.
#'
#' The column `percent_non_hispanic_pacific_islander` is named Percent
#' non-Hispanic Hawaiian and Other Pacific Islander in the source but is renamed
#' to match the prior two years of data. This data also includes a
#' `percent_nonbinary column that is not present in prior years.
#'
#' For variables with percentages, a value of 0.05 may represent <=5% rather
#' than 5% and a value of 0.95 may represent >=95% rather than 95%.
#'
#' @format A data frame with 2,153 rows and 20 variables:
#' \describe{
#'   \item{`school_number`}{School number}
#'   \item{`school_name`}{School name}
#'   \item{`management_type`}{School management type}
#'   \item{`grade_band`}{Grade band (factor)}
#'   \item{`grade`}{Grade (factor)}
#'   \item{`grade_range`}{Grade range (factor)}
#'   \item{`total_enrollment`}{Total Enrollment}
#'   \item{`percent_male`}{Percent Male}
#'   \item{`percent_female`}{Percent Female}
#'   \item{`percent_nonbinary`}{Percent Nonbinary}
#'   \item{`percent_direct_certification`}{Percent Direct Certification}
#'   \item{`percent_swd`}{Percent Students with Disabilities (SWD)}
#'   \item{`percent_el`}{Percent English Learner (EL)}
#'   \item{`percent_non_hispanic_black`}{Percent Non-Hispanic Black}
#'   \item{`percent_non_hispanic_white`}{Percent Non-Hispanic White}
#'   \item{`percent_hispanic`}{Percent Hispanic}
#'   \item{`percent_non_hispanic_asian`}{Percent Non-Hispanic Asian}
#'   \item{`percent_non_hispanic_american_indian`}{Percent Non-Hispanic American Indian}
#'   \item{`percent_non_hispanic_pacific_islander`}{Percent Non-Hispanic Native Hawaiian or Other Pacific Islander}
#'   \item{`percent_non_hispanic_multiracial`}{Percent Non-Hispanic Multiracial}
#' }
#' @source <https://www.baltimorecityschools.org/data>
"enrollment_demographics_SY2122"

#' Baltimore City Public School Parent Survey Results (SY 2018-2019)
#'
#' Results from the Baltimore City Public School Parent Survey administered
#' during the for the 2018-2029 school year. Data includes composite scores and
#' responses to selected questions school.
#'
#' @format A data frame with 169 rows and 54 variables:
#' \describe{
#'   \item{`school_number`}{School number}
#'   \item{`school_name`}{School name}
#'   \item{`management_type`}{School management type}
#'   \item{`grade_band`}{Grade band}
#'   \item{`parent_response_count`}{Total parent survey responses}
#'   \item{`est_num_parents`}{Estimated number of eligible parents}
#'   \item{`est_response_rate`}{Estimate parent response rate}
#'   \item{`administration_dimension_score`}{Administration Dimension Score}
#'   \item{`creativity_the_arts_dimension_score`}{Creativity & the Arts Dimension Score}
#'   \item{`physical_environment_dimension_score`}{Physical Environment Dimension Score}
#'   \item{`learning_climate_dimension_score`}{Learning Climate Dimension Score}
#'   \item{`family_involvement_dimension_score`}{Family Involvement Dimension Score}
#'   \item{`school_resources_dimension_score`}{School Resources Dimension Score}
#'   \item{`safety_dimension_score`}{Safety Dimension Score}
#'   \item{`satisfaction_with_school_dimension_score`}{Satisfaction with School
#'   Dimension Score}
#'   \item{`grit_dimension_score`}{Grit Dimension Score}
#'   \item{`overall`}{Overall Score}
#'   \item{`district_office_dimension_score`}{District Office Dimension Score}
#'   \item{`admin_1_the_school_administration_promptly_responds_to_my_concerns`}{The
#'   school administration promptly responds to my concerns}
#'   \item{`admin_9_parents_have_the_opportunity_to_give_input_into_the_school_s_decisions`}{Parents
#'   have the opportunity to give input into the school's decisions}
#'   \item{`creative_1_student_work_in_the_arts_is_displayed_or_presented_in_my_child_s_school`}{Student
#'   work in the arts is displayed or presented in my child's school}
#'   \item{`environ_1_the_school_building_is_clean_and_well_maintained`}{The
#'   school building is clean and well maintained}
#'   \item{`learn_13_teachers_care_about_their_students`}{Teachers care about
#'   their students}
#'   \item{`learn_14_i_feel_my_child_feels_like_i_belong_at_this_school`}{I feel
#'   (My child feels) like I belong at this school}
#'   \item{`learn_18_this_school_prepares_students_for_college_or_to_have_a_career`}{This
#'   school prepares students for college or to have a career}
#'   \item{`learn_19_if_students_break_rules_there_are_fair_consequences`}{If
#'   students break rules, there are fair consequences}
#'   \item{`parent_1_parents_or_guardians_are_welcome_at_this_school`}{Parents
#'   or guardians are welcome at this school}
#'   \item{`parent_11_parents_can_use_resources_at_my_child_s_school_when_school_is_not_in_session`}{Parents
#'   can use resources at my child's school when school is not in session}
#'   \item{`parent_12_i_know_how_to_access_information_about_how_my_child_is_performing_in_school_e_g_parent_portal`}{I
#'   know how to access information about how my child is performing in school e.g., Parent Portal}
#'   \item{`parent_18_the_school_sends_me_information_in_my_native_language`}{The
#'   school sends me information in my native language}
#'   \item{`parent_19_i_feel_that_my_input_into_my_child_s_education_is_valued`}{I
#'   feel that my input into my child's education is valued}
#'   \item{`parent_20_my_child_s_school_can_connect_me_to_resources_in_the_community`}{My
#'   child's school can connect me to resources in the community}
#'   \item{`parent_21_the_school_notifies_me_when_my_child_misses_school`}{The
#'   school notifies me when my child misses school}
#'   \item{`parent_23_my_child_s_school_regularly_communicates_with_parents_about_how_they_can_help_their_children_learn`}{My child's school regularly communicates with parents about how they can help
#'   their children learn}
#'   \item{`parent_3_when_a_student_does_something_good_at_school_the_parents_are_informed`}{When
#'   a student does something good at school, the parents are informed}
#'   \item{`parent_4_when_a_student_does_something_bad_at_school_the_parents_are_informed`}{When
#'   a student does something bad at school, the parents are informed}
#'   \item{`parent_5_school_staff_work_closely_with_parents_to_meet_students_needs`}{School
#'   staff work closely with parents to meet students' needs}
#'   \item{`resource_17_students_have_the_opportunity_to_take_books_home_from_this_school`}{Students
#'   have the opportunity to take books home from this school}
#'   \item{`resource_7_teachers_provide_extra_academic_help_to_students_who_need_it`}{Teachers
#'   provide extra academic help to students who need it}
#'   \item{`resource_9_this_school_has_programs_to_support_students_emotional_and_social_development`}{This
#'   school has programs to support students' emotional and social development}
#'   \item{`safe_12_students_feel_safe_at_this_school`}{Students feel safe at
#'   this school}
#'   \item{`safe_13_students_feel_safe_going_to_and_from_school`}{Students feel
#'   safe going to and from school}
#'   \item{`satisfy_11_overall_i_am_satisfied_with_my_child_s_school`}{Overall,
#'   I am satisfied with my child's school}
#'   \item{`satisfy_12_i_would_recommend_this_school_to_others`}{I would
#'   recommend this school to others}
#'   \item{`grit_6_i_encourage_my_child_to_keep_working_at_difficult_tasks_until_he_she_figures_them_out`}{I
#'   encourage my child to keep working at difficult tasks until he/she figures
#'   them out}
#'   \item{`value_1_regular_on_time_attendance_is_important_to_my_child_s_success_in_school`}{Regular,
#'   on-time attendance is important to my child's success in school}
#'   \item{`parent_read_2_i_read_with_my_child_at_least_once_a_month`}{I read
#'   with my child at least once a month}
#'   \item{`parent_talk_2_i_ask_my_child_what_he_she_did_at_school_at_least_once_a_month`}{I
#'   ask my child what he/she did at school at least once a month}
#'   \item{`district_office_1_if_you_called_the_district_office_within_the_last_year_how_satisfied_were_you_overall_with_the_support_you_received`}{If
#'   you called the District Office within the last year, how satisfied were you
#'   overall with the support you received?}
#'   \item{`district_office_2_if_you_visited_district_headquarters_within_the_last_year_how_satisfied_were_you_overall_with_the_service_s_you_requested`}{If
#'   you visited District Headquarters within the last year, how satisfied were
#'   you overall with the services you requested?}
#'   \item{`transportation_how_does_your_child_usually_get_to_school_walk`}{Transportation:
#'   How does your child usually get to school? Walk}
#'   \item{`transportation_how_does_your_child_usually_get_to_school_school_bus`}{Transportation:
#'   How does your child usually get to school? School Bus}
#'   \item{`transportation_how_does_your_child_usually_get_to_school_mta_bus`}{Transportation:
#'   How does your child usually get to school? MTA Bus}
#'   \item{`transportation_how_does_your_child_usually_get_to_school_car`}{Transportation:
#'   How does your child usually get to school? Car}
#' }
#' @source <https://www.baltimorecityschools.org/data>
"parent_survey_SY1819"


#' Baltimore City Public School Parent Survey Results (SY 2018-2019) -
#' long format
#'
#' Results from the Baltimore City Public School Parent Survey administered
#' during the for the 2018-2029 school year. Data includes composite scores and
#' responses to selected questions school. Long format version is based on the
#' `parent_survey_SY1819` data with an additional `label` column based on the
#' original Excel sheet column names.
#'
#' @format A data frame with 7,943 rows and 10 variables:
#' \describe{
#'   \item{`school_number`}{School number}
#'   \item{`school_name`}{School name}
#'   \item{`management_type`}{School management type}
#'   \item{`grade_band`}{School grade band}
#'   \item{`parent_response_count`}{Number of parent survey responses}
#'   \item{`est_num_parents`}{Estimated number of eligible parents}
#'   \item{`est_response_rate`}{Estimated parent response rate}
#'   \item{`variable`}{Unique slug for composite score or question}
#'   \item{`value`}{Value of composite score or share of parents responding
#'   affirmatively to question}
#'   \item{`label`}{Variable label for composite score or question}
#' }
#' @source <https://www.baltimorecityschools.org/data>
"parent_survey_SY1819_long"


#' Baltimore City Public School Student Survey (SY 2018-2019)
#'
#' The Maryland School Survey was administered for the first time in spring 2019
#' to students and educators. It is online only, in English and Spanish for
#' students. Student participants were from Elementary (Grade 5), Middle (grades
#' 6-8), and High (grades 9-11), and all instructional staff were eligible. The
#' student participation rate was 69.9 percent overall, and the educator
#' participation rate was 76.9 percent.
#'
#' There were four domains and ten topics for students, and five domains and
#' eleven topics for educators. Survey results ranged from 1-10, with 10 being
#' most favorable and 1 being least favorable. Schools with fewer than 10
#' respondents overall or in any topic were excluded from relevant district
#' averages. Cells with an asterisk (*) denote less than 10 students or
#' educators in the summary group. Consequently, all data for that group are
#' suppressed. Survey results are included as an indicator of School Quality and
#' Student Success in the Maryland School Report Card (10 of 100 points: 7 from
#' the student survey, 3 from the educator survey).
#'
#' Student respondent summary groups include: Students with Disabilities (SWD)
#' ("Special Education Services" in MSDE file): Indicates students who have
#' current Individualized Education Plans (IEPs) and are receiving special
#' education services. English Learner (EL): English Learners, students who have
#' a primary or home language other than English and have been assessed as
#' having limited or no ability to understand, speak, or read English.
#' Economically Disadvantaged (ED): Indicates students who have been identified
#' as enrolled in a direct certification program. Direct certification is based
#' on a student's Supplemental Nutrition Assistance Program (SNAP), Homeless,
#' Foster care, or Temporary Assistance for Needy Families (TANF) status. ED is
#' the new terminology used to refer to students historically identified as
#' low-income or Free and Reduced Meals (FARMS) students under the Every Student
#' Succeeds Act (ESSA).
#'
#' @format A data frame with 17,380 rows and 9 variables:
#' \describe{
#'   \item{`school_number`}{School number}
#'   \item{`school_name`}{School name}
#'   \item{`grade_band`}{School grade band}
#'   \item{`respondent_grade_band`}{Grade band of student survey respondents}
#'   \item{`respondent_count`}{Number of student survey respondents}
#'   \item{`respondent_group`}{Summary group of respondents}
#'   \item{`domain`}{Survey domain name}
#'   \item{`topic`}{Survey topic name}
#'   \item{`average_score`}{Average score}
#'   }
#' @source <https://www.baltimorecityschools.org/data>
"student_survey_SY1819"


#' Baltimore City Public School Educator Survey (SY 2018-2019)
#'
#' The Maryland School Survey was administered for the first time in spring 2019
#' to students and educators. It is online only, in English and Spanish for
#' students. Student participants were from Elementary (Grade 5), Middle (grades
#' 6-8), and High (grades 9-11), and all instructional staff were eligible. The
#' student participation rate was 69.9 percent overall, and the educator
#' participation rate was 76.9 percent.
#'
#' There were four domains and ten topics for students, and five domains and
#' eleven topics for educators. Survey results ranged from 1-10, with 10 being
#' most favorable and 1 being least favorable. Schools with fewer than 10
#' respondents overall or in any topic were excluded from relevant district
#' averages. Cells with an asterisk (*) denote less than 10 students or
#' educators in the summary group. Consequently, all data for that group are
#' suppressed. Survey results are included as an indicator of School Quality and
#' Student Success in the Maryland School Report Card (10 of 100 points: 7 from
#' the student survey, 3 from the educator survey).
#'
#' @format A data frame with 1,782 rows and 7 variables:
#' \describe{
#'   \item{`school_number`}{School number}
#'   \item{`school_name`}{School name}
#'   \item{`grade_band`}{Grade band}
#'   \item{`respondent_grade_band`}{Grade band of student survey respondents}
#'   \item{`respondent_count`}{Number of student survey respondents}
#'   \item{`domain`}{Survey domain name}
#'   \item{`topic`}{Survey topic name}
#'   \item{`average_score`}{Average score}
#' }
#' @source <https://www.baltimorecityschools.org/data>
"educator_survey_SY1819"


#' Baltimore City Public School Elementary School Attendance Zones (SY
#' 2021-2022)
#'
#' Boundaries for Baltimore City Public School elementary school attendance
#' zones for the 2021-2022 school year. The `program_number` variable is
#' equivalent to the `school_number` variable used in the demographic and survey
#' datasets.
#'
#' @format A data frame with 92 features and 5 variables:
#' \describe{
#'   \item{`zone_number`}{Program zone number}
#'   \item{`zone_name`}{Program zone name}
#'   \item{`program_number`}{Program number (school number)}
#'   \item{`program_name_short`}{Program name (short)}
#'   \item{`geometry`}{Multipolygon geometry for zone boundaries}
#' }
#' @source <https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/BCPSZones_2122/FeatureServer/0>
"bcps_es_zones_SY2122"


#' Baltimore City Public School Elementary School Attendance Zones (SY 2020-2021)
#'
#' Boundaries for Baltimore City Public School elementary school attendance
#' zones for the 2020-2021 school year. The `program_number` variable is
#' equivalent to the `school_number` variable used in the demographic and survey
#' datasets.
#'
#' @format A data frame with 96 rows and 5 variables:
#' \describe{
#'   \item{`zone_number`}{Program zone number}
#'   \item{`zone_name`}{Program zone name}
#'   \item{`program_number`}{Program number (school number)}
#'   \item{`program_name_short`}{Program name (short)}
#'   \item{`geometry`}{Multipolygon geometry for zone boundaries}
#' }
#' @source <https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/BCPSZones_2021/FeatureServer/0>
"bcps_es_zones_SY2021"

#' Baltimore City Public School Program Locations (SY 2021-2022)
#'
#' Locations for Baltimore City Public School buildings and programs for the
#' 2021-2022 school year. The `program_number` variable is equivalent to the
#' `school_number` variable used in the demographic and survey datasets.
#'
#' @format A data frame with 165 rows and 18 variables:
#' \describe{
#'   \item{`program_number`}{Program number (school number)}
#'   \item{`program_name_short`}{Program name (short)}
#'   \item{`grade_band`}{Grade band for program}
#'   \item{`management_type`}{School management type}
#'   \item{`category`}{Grade category}
#'   \item{`swing`}{Logical indicator for program at swing site}
#'   \item{`swing_building_number`}{Building number for swing site}
#'   \item{`geometry`}{Point geometry for program/school locations}
#' }
#' @source <https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/SY2122_Ezones_and_Programs/FeatureServer/11>
"bcps_programs_SY2122"

#' Baltimore City Public School Program Locations (SY 2020-2021)
#'
#' Locations for Baltimore City Public School buildings and programs for the
#' 2020-2021 school year. The `program_number` variable is equivalent to the
#' `school_number` variable used in the demographic and survey datasets.
#'
#' @format A data frame with 165 rows and 18 variables:
#' \describe{
#'   \item{`program_number`}{Program number (school number)}
#'   \item{`program_name_short`}{Program name (short)}
#'   \item{`grade_band`}{Grade band for program}
#'   \item{`management_type`}{School management type}
#'   \item{`category`}{Grade category}
#'   \item{`swing`}{Logical indicator for program at swing site}
#'   \item{`swing_building_number`}{Building number for swing site}
#'   \item{`colocated`}{Logical indicator for programs colocated with another
#'   program}
#'   \item{`two_buildings`}{Logical indicator for programs with two buildings at
#'   one site}
#'   \item{`home_building`}{...}
#'   \item{`council_district`}{Baltimore City Council District Number}
#'   \item{`legislative_district`}{Maryland Legislative District}
#'   \item{`congressional_district`}{U.S. Congressional District}
#'   \item{`planning_area`}{Planning area, Baltimore City Department of
#'   Planning}
#'   \item{`quadrant`}{Quadrant}
#'   \item{`zone_number`}{Program zone number}
#'   \item{`zone_name`}{Program zone name}
#'   \item{`geometry`}{Point geometry for program/school locations}
#' }
#' @source <https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/SY2021_Programs/FeatureServer>
"bcps_programs_SY2021"

#' Baltimore City Public School Program Locations (SY 2019-2020)
#'
#' Locations for Baltimore City Public School buildings for the 2019-2020
#' school year. The `program_number` variable is equivalent to the `school_number`
#' variable used in the demographic and survey datasets.
#'
#' @format A data frame with 174 rows and 11 variables:
#' \describe{
#'   \item{`program_number`}{Program number (school number)}
#'   \item{`program_name`}{Program name}
#'   \item{`program_name_short`}{Program name (short)}
#'   \item{`grade_band`}{Grade band for program}
#'   \item{`management_type`}{School management type}
#'   \item{`swing`}{Logical indicator for program at swing site}
#'   \item{`swing_building_number`}{Building number for swing site}
#'   \item{`colocated`}{Logical indicator for programs colocated with another
#'   program}
#'   \item{`council_district`}{Baltimore City Council District Number}
#'   \item{`legislative_district`}{Maryland Legislative District}
#'   \item{`geometry`}{Point geometry for program/school locations}
#' }
#' @source <https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/SY1920_Building_Status_Publish/FeatureServer/0>
"bcps_programs_SY1920"

#' Enrolled students by school and grade (SY 2009-2019)
#'
#' Enrollment data from the Maryland State Department of Education (MSDE). Raw
#' CSV data files with the full state enrollment data are available in the
#' `inst/extdata` folder. The number of enrolled students includes ungraded
#' special education and pre-kindergarten students. Variable definitions are
#' based on the [definitions from the MSDE
#' website](https://reportcard.msde.maryland.gov/Definitions/Index).
#'
#' @format A data frame with 16,763 rows and 6 variables:
#' \describe{
#'  \item{`school_year`}{School or academic year for enrollment count, e.g.
#'    2019 data is from the start of the 2019-2020 school year.}
#'  \item{`school_number`}{School number (0 indicates all schools)}
#'  \item{`school_name`}{School name}
#'  \item{`enrolled_count`}{Number of students registered to attend the school
#'  as of September 30 in the grade or grade range}
#'  \item{`grade`}{Grades from Prekindergarden (PK) to Grade 12}
#'  \item{`grade_range`}{Elementary school, middle school, high school, or
#'    all grades (total enrollment)}
#'  }
#' @source [MSDE Data Downloads](https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload)
"enrollment_msde_SY0919"

#' Attendance data by school (SY 2009-2019)
#'
#' Attendance data from the Maryland State Department of Education (MSDE). Raw
#' CSV data files with the full state enrollment data are available in the
#' `inst/extdata` folder. Any percent variables with a value of 95 percent
#' should be interpreted as equivalent at or above 95 percent. Any percent
#' variables with a value of 5 percent should be interpreted as equivalent to at
#' or below 5 percent. Chronic absenteeism data is not available prior to 2018
#' when the federal Every Student Succeeds Act (passed in 2015) went into effect
#' and Maryland began to include the chronic absenteeism rate in the state's
#' annual academic report cards. Variable definitions are based on the
#' [definitions from the MSDE
#' website](https://reportcard.msde.maryland.gov/Definitions/Index).
#'
#' @format A data frame with 3,197 rows and 15 variables:
#' \describe{
#'   \item{`school_year`}{School year or academic year, e.g. 2019 for 2019-2020
#'   school year}
#'   \item{`school_number`}{School number (0 indicates all schools)}
#'   \item{`school_name`}{School name}
#'   \item{`grade_band`}{Grade band (school type)}
#'   \item{`attend_rate_pct`}{Attendance rate as defined as the average daily
#'   attendance rate of students in the school and grade band, including special
#'   education students}
#'   \item{`days_attended_cnt`}{Total number of students in attendance from the
#'   first day of school through April 13th}
#'   \item{`days_member_cnt`}{Total number of students registered to attend from
#'   the first day of school through April 13th}
#'   \item{`fewer_5_pct`}{Percent of students absentee rate is the percentage of
#'   students absent from school for five or fewer days between the first day of
#'   the school year and the last day of the school year}
#'   \item{`fewer_5_cnt`}{Count of students absentee rate is the percentage of
#'   students absent from school for five or fewer days between the first day of
#'   the school year and the last day of the school year}
#'   \item{`more_20_pct`}{Percent of students absentee rate is the percentage of
#'   students absent from school for twenty or more days between the first day
#'   of the school year and the last day of the school year}
#'   \item{`more_20_cnt`}{Number of students absentee rate is the percentage of
#'   students absent from school for twenty or more days between the first day
#'   of the school year and the last day of the school year}
#'   \item{`more_90_member_cnt`}{Number of students with an attendance rate of
#'   90 percent or more (?)}
#'   \item{`chronic_absentee_cnt`}{Number of students expected to attend school
#'   for at least 10 days who were absent 10 percent or more of the school days
#'   while enrolled at that school}
#'   \item{`chronic_absentee_denom`}{Number of students who are expected to
#'   attend school for at least 10 days in the school year}
#'   \item{`chronic_absentee_pct`}{Chronic absenteeism rate as defined as the
#'   percent of students expected to attend school for at least 10 days who were
#'   absent 10 percent or more of the school days while enrolled at that school}
#'  }
#' @source [MSDE Data Downloads](https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload)
"attendance_msde_SY0919"


#' MSDE Kindergarten Readiness Assessment (KRA) results for Baltimore City
#' Public Schools (SY 2019-2020)
#'
#' @description As of 2018-19, students who are not scored (NS) in all items
#'   still receive a composite score and readiness level. NS is applied when an
#'   item requires demonstration of a skill (e.g., hopping), and the child is
#'   not able to respond due to a disability that restricts or prevents
#'   participating in the skill being assessed. A NS rating would not be
#'   appropriate when the response to the item reflects a child's functioning at
#'   an earlier developmental level and their ability to respond is not affected
#'   by a disability; in this instance the appropriate rating would be “0” since
#'   the child could access the item, but did not demonstrate the skill. See
#'   MSDE: KRA 2018-19 Technical Report, January 2019. Consistent with MSDE's
#'   reporting, aggregates exclude students with some incomplete items, and
#'   include students with not scorable (NS) items. Missing values include data
#'   that has been suppressed due to a group size of less than 10 students.
#'
#'   Children whose readiness skills and behaviors are "approaching" or
#'   "emerging" overall require instructional support to be successful in
#'   kindergarten and beyond. Reports of KRA data prior to the 2018-19
#'   administration have readiness level assigned for each of the four domains
#'   (Literacy, Math, Social Foundations, and Physical Development). Since last
#'   year's administration, readiness levels are no longer reported for
#'   individual domains, and only an overall or composite readiness level is
#'   reported. This is why this data file does not resemble previous releases of
#'   KRA data. Details on the KRA assessment and changes to the test can be
#'   found at <https://pd.kready.org/r4kmaryland>.
#' @format A data frame with 1604 rows and 13 variables:
#' \describe{
#'   \item{`school_number`}{School number (0 indicates all schools)}
#'   \item{`school_name`}{School name}
#'   \item{`student_group`}{Student group (includes "All Students")}
#'   \item{`group_type`}{Student group type}
#'   \item{`num_tested_scored_overall`}{Number of test takers with overall
#'   scores}
#'   \item{`avg_scale_score`}{Average KRA scale score}
#'   \item{`perc_emerging_readiness`}{Percent of test takers in Emerging
#'   Readiness category. Emerging readiness: Student demonstrates limited
#'   foundational skills and behaviors that prepare him or her for curriculum
#'   based on Maryland College and Career-Ready kindergarten standards.}
#'   \item{`perc_approaching_readiness`}{Percent of test takers in Approaching
#'   Readiness category. Approaching readiness: Student demonstrates some
#'   foundational skills and behaviors that prepare him or her for curriculum
#'   based on Maryland College and Career-Ready kindergarten standards.}
#'   \item{`perc_demonstrating_readiness`}{Percent of test takers in
#'   Demonstrating Readiness category. Demonstrating readiness: Student
#'   demonstrates foundational skills and behaviors that prepare him or her for
#'   curriculum based on Maryland College and Career-Ready kindergarten
#'   standards.}
#'   \item{`avg_language_and_literacy_score`}{Average score in Literacy domain}
#'   \item{`avg_math_score`}{Average score in KRA Math domain}
#'   \item{`avg_physical_development_score`}{Average score in Physical
#'   Development domain}
#'   \item{`avg_social_foundations_score`}{Average score in Social Foundations
#'   domain}
#' }
#' @source [BCPSS Public 2019-20 KRA School Level Results](https://www.baltimorecityschools.org/sites/default/files/inline-files/PUBLIC-2019-20-KRA-School-Level-Results.xlsx)
"kra_results_SY1920"


#' Accountability data (SY 2019-2020)
#'
#' @description The Maryland State Department of Education is required to report
#'   "accountability data" under the 2015 federal Every Student Succeeds Act
#'   (ESSA). Maryland's plan for an accountability system that complies with the
#'   ESSA was approved by the U.S. Department of Education in early 2018.
#'   Overall, The accountability system has two parts: academic indicators,
#'   which make up 65 possible points in the system, and measures of school
#'   quality and student success, which are 35 possible points.  The star rating
#'   and total points are summary measures based on a broad selection of
#'   performance indicators to measure how schools are doing.
#'
#'   Detailed data is available for download through the MSDE website. Howard
#'   County Public School System (HCPSS) provides an accessible explanation of
#'   the accountability data on their website:
#'   https://www.hcpss.org/about-us/essa/
#' @format A data frame with 160 rows and 8 variables:
#' \describe{
#'   \item{`school_year`}{School year}
#'   \item{`school_number`}{School number}
#'   \item{`school_name`}{School name}
#'   \item{`star_rating`}{Star rating}
#'   \item{`total_points_earned_percentage`}{Total points earned (as a
#'   percentage)}
#'   \item{`percentile_rank_elementary`}{Statewide percentile rank for
#'   elementary school grade band}
#'   \item{`percentile_rank_middle`}{Statewide percentile rank for middle school
#'   grade band}
#'   \item{`percentile_rank_high`}{Statewide percentile rank for high school
#'   grade band}
#' }
#' @source [MSDE Data Downloads](https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload)
"accountability_SY1920"

#' National Center for Education Statistics (NCES) School Directory (SY 2019-2020)
#'
#' NCES Directory listing for Baltimore City Schools including school addresses,
#' phone numbers, and NCES numbers.
#'
#' @format A data frame with 167 rows and 10 variables:
#' \describe{
#'   \item{`school_year`}{School year}
#'   \item{`school_number`}{School number}
#'   \item{`school_name`}{School name}
#'   \item{`grade_band`}{Grade band (school type)}
#'   \item{`address`}{Street address}
#'   \item{`city`}{City}
#'   \item{`state`}{State}
#'   \item{`zip`}{Zipcode}
#'   \item{`phone`}{Phone number}
#'   \item{`nces_number`}{NCES number}
#' }
#' @source [MSDE Data Downloads](https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload)
"nces_school_directory_SY1920"

#' Baltimore City Public Schools Surplus School Buildings
#'
#'
#' @format A data frame with 40 rows and 15 variables:
#' \describe{
#'   \item{`pos`}{Position/sort order}
#'   \item{`id`}{Identifier}
#'   \item{`building_name`}{Building name}
#'   \item{`primary_building_year`}{Primary building year of construction}
#'   \item{`address`}{Building street address}
#'   \item{`school_name`}{School name}
#'   \item{`school_number`}{School number}
#'   \item{`school_closure_year`}{Year school closed}
#'   \item{`surplus_year`}{Year surplussed}
#'   \item{`status_sy20`}{Status (Fall 2020)}
#'   \item{`status_sy22`}{Status (Fall 2022)}
#'   \item{`building_sq_ft`}{Building interior area (square feet)}
#'   \item{`property_acres`}{Property area (acres)}
#'   \item{`flag_property_acres`}{Flag for properties with shared campus and
#'   inaccurate acreage}
#'   \item{`url`}{URL for Baltimore City Surplus Schools website or related
#'   ArcGIS Feature Layer}
#'   \item{`geometry`}{POINT geometry with building location}
#' }
#' @source [Baltimore City Department of Planning - FeatureLayer](https://services1.arcgis.com/43Lm3JYE3nM91DAF/ArcGIS/rest/services/Surplus_Schools/FeatureServer/0)
"bcps_surplus_schools"

#' Baltimore City Public School Enrollment (SY 2003-2022)
#'
#' This data is a subset of [mapmaryland::msde_enrollment] where `lss_name` is
#' "Baltimore City". This data does not include the SEED School of Maryland
#' which is located within Baltimore City. It is recommended you use this data
#' instead of [enrollment_msde_SY0919] as the name of this object will remain
#' the same when current enrollment data is appended on an annual basis.
#'
#' @format A data frame with 31,618 rows and 10 variables:
#' \describe{
#'  \item{`year`}{School or academic year for enrollment count, e.g.
#'    2019 data is from the start of the 2019-2020 school year.}
#'  \item{`school_number`}{School number as integer (0 indicates all
#'  schools)}
#'  \item{`school_name`}{School name}
#'  \item{`enrolled_count`}{Number of students registered to attend the
#'  school at the start of the year in the grade or grade range as integer.
#'  Typically enrollment count is as of September 30.}
#'  \item{`grade`}{Grades from Prekindergarden (PK) to Grade 12}
#'  \item{`grade_range`}{all elementary school Grades, all middle school
#'  grades, all high school grades, or all grades (total enrollment). May also
#'  be used as a label for grade.}
#'   \item{`race`}{Race/ethnicity. Enrollment by race/ethnicity is only
#'   available across all grades for years since 2020. "All" is used for data
#'   prior to 2020.}
#'   \item{`county`}{County name}
#'   \item{`lss_number`}{Local school system number (previously known as a
#'   LEA Number) as an integer. `NA` values are used for statewide data.}
#'   \item{`lss_name`}{Local school system name (previously known as a LEA
#'   Name). A value of "State" is used for statewide data.}
#' }
#' @source [MSDE Data Downloads](https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload)
"baltimore_enrollment"

#' BCPSS Attendance Data
#'
#' This documentation is a place-holder.
#'
#' @format A data frame with 5585 rows and 18 variables:
#' \describe{
#'   \item{`year`}{integer COLUMN_DESCRIPTION}
#'   \item{`school_number`}{integer COLUMN_DESCRIPTION}
#'   \item{`school_name`}{character COLUMN_DESCRIPTION}
#'   \item{`school_type`}{character COLUMN_DESCRIPTION}
#'   \item{`attend_rate_pct`}{double COLUMN_DESCRIPTION}
#'   \item{`days_attended_count`}{double COLUMN_DESCRIPTION}
#'   \item{`days_member_count`}{double COLUMN_DESCRIPTION}
#'   \item{`fewer_5_pct`}{double COLUMN_DESCRIPTION}
#'   \item{`fewer_5_count`}{double COLUMN_DESCRIPTION}
#'   \item{`more_20_pct`}{double COLUMN_DESCRIPTION}
#'   \item{`more_20_count`}{double COLUMN_DESCRIPTION}
#'   \item{`more_90_member_count`}{double COLUMN_DESCRIPTION}
#'   \item{`chronic_absentee_count`}{double COLUMN_DESCRIPTION}
#'   \item{`chronic_absentee_denom`}{double COLUMN_DESCRIPTION}
#'   \item{`chronic_absentee_pct`}{double COLUMN_DESCRIPTION}
#'   \item{`date_created`}{double COLUMN_DESCRIPTION}
#'   \item{`lss_name`}{character COLUMN_DESCRIPTION}
#'   \item{`lss_number`}{integer COLUMN_DESCRIPTION}
#'}
#' @details DETAILS
"bcpss_attendance"


#' BCPSS Enrollment Data
#'
#' This documentation is a place-holder.
#'
#' @format A data frame with 31618 rows and 10 variables:
#' \describe{
#'   \item{`year`}{integer COLUMN_DESCRIPTION}
#'   \item{`school_number`}{integer COLUMN_DESCRIPTION}
#'   \item{`school_name`}{character COLUMN_DESCRIPTION}
#'   \item{`enrolled_count`}{integer COLUMN_DESCRIPTION}
#'   \item{`grade`}{character COLUMN_DESCRIPTION}
#'   \item{`grade_range`}{character COLUMN_DESCRIPTION}
#'   \item{`race`}{character COLUMN_DESCRIPTION}
#'   \item{`date_created`}{double COLUMN_DESCRIPTION}
#'   \item{`lss_number`}{integer COLUMN_DESCRIPTION}
#'   \item{`lss_name`}{character COLUMN_DESCRIPTION}
#'}
#' @details DETAILS
"bcpss_enrollment"

#' BCPSS Student Mobility Data
#'
#' This documentation is a place-holder.
#'
#' @format A data frame with 5586 rows and 14 variables:
#' \describe{
#'   \item{`year`}{integer COLUMN_DESCRIPTION}
#'   \item{`school_number`}{integer COLUMN_DESCRIPTION}
#'   \item{`school_name`}{character COLUMN_DESCRIPTION}
#'   \item{`school_type`}{character COLUMN_DESCRIPTION}
#'   \item{`mobile_pct`}{double COLUMN_DESCRIPTION}
#'   \item{`entry_pct`}{double COLUMN_DESCRIPTION}
#'   \item{`exit_pct`}{double COLUMN_DESCRIPTION}
#'   \item{`mobile_count`}{integer COLUMN_DESCRIPTION}
#'   \item{`entry_count`}{integer COLUMN_DESCRIPTION}
#'   \item{`exit_count`}{integer COLUMN_DESCRIPTION}
#'   \item{`avg_enrolled_count`}{double COLUMN_DESCRIPTION}
#'   \item{`lss_name`}{character COLUMN_DESCRIPTION}
#'   \item{`date_created`}{double COLUMN_DESCRIPTION}
#'   \item{`lss_number`}{integer COLUMN_DESCRIPTION}
#'}
#' @details DETAILS
"bcpss_student_mobility"


#' BCPSS Buildings (SY 2021-2022) from CEFMP
#'
#' Buildings and programs within BCPSS. Note that each row is a program (not a
#' building).
#'
#' @format A data frame with 173 rows and 18 variables:
#' \describe{
#'   \item{`psc_number`}{PSC Number}
#'   \item{`bldg_number`}{Building number}
#'   \item{`bldg_name`}{Building name}
#'   \item{`program_number`}{Program number}
#'   \item{`program_name`}{Program name}
#'   \item{`management_type`}{Management type}
#'   \item{`address`}{Address}
#'   \item{`src`}{SRC (State Rated Capacity)}
#'   \item{`bldg_enrollment`}{Total building enrollment}
#'   \item{`program_enrollment`}{Program enrollment}
#'   \item{`utilization_pct`}{Utilitization (% of SRC)}
#'   \item{`acres`}{Acres}
#'   \item{`bldg_sqft`}{Building sq. feet}
#'   \item{`fci_score`}{FCI Score (physical condition)}
#'   \item{`notes`}{Building notes}
#'   \item{`swing_space`}{Swing space indicator}
#'   \item{`bcpss_owned`}{BCPSS owned building indicator}
#'   \item{`year_built`}{Year built}
#'}
"bcpss_buildings_SY2122"


