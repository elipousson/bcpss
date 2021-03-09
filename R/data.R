#' Enrollment and demographic data by Baltimore City Public School (SY
#' 2019-2020)
#'
#' Total enrollment and demographic characteristics for Baltimore City public
#' school students including data aggregated by grade, grade band, school, and
#' citywide for the 2019-2020 school year.
#'
#' @format A data frame with 2,243 rows and 19 variables:
#' \describe{
#'   \item{\code{school_number}}{School number}
#'   \item{\code{school_name}}{School name}
#'   \item{\code{management_type}}{School management type}
#'   \item{\code{grade_band}}{Grade band}
#'   \item{\code{grade}}{Grade}
#'   \item{\code{grade_range}}{Grade range}
#'   \item{\code{total_enrollment}}{Total Enrollment}
#'   \item{\code{percent_males}}{Percent Males}
#'   \item{\code{percent_females}}{Percent Females}
#'   \item{\code{percent_direct_certification}}{Percent Direct Certification}
#'   \item{\code{percent_swd}}{Percent Students with Disabilities (SWD)}
#'   \item{\code{percent_el}}{Percent English Learner (EL)}
#'   \item{\code{percent_non_hispanic_black}}{Percent Non-Hispanic Black}
#'   \item{\code{percent_non_hispanic_white}}{Percent Non-Hispanic White}
#'   \item{\code{percent_hispanic}}{Percent Hispanic}
#'   \item{\code{percent_non_hispanic_asian}}{Percent Non-Hispanic Asian}
#'   \item{\code{percent_non_hispanic_american_indian}}{Percent Non-Hispanic American Indian}
#'   \item{\code{percent_non_hispanic_pacific_islander}}{Percent Non-Hispanic Pacific Islander}
#'   \item{\code{percent_non_hispanic_multiracial}}{Percent Non-Hispanic Multiracial}
#' }
#' @source \url{https://www.baltimorecityschools.org/data}
"enrollment_demographics_SY1920"

#' Enrollment and demographic data by Baltimore City Public School (SY
#' 2019-2020) - long format
#'
#' Total enrollment and demographic characteristics for Baltimore City public
#' school students including data aggregated by grade, grade band, school, and
#' citywide for the 2019-2020 school year. Long format version is based on the
#' \code{enrollment_demographics_SY1920} data with an additional \code{label}
#' column based on the original Excel sheet column names.
#'
#' @format A data frame with 26,916 rows and 10 variables:
#' \describe{
#'   \item{\code{school_number}}{School number}
#'   \item{\code{school_name}}{School name}
#'   \item{\code{management_type}}{School management type}
#'   \item{\code{grade_band}}{Grade band}
#'   \item{\code{grade}}{Grade}
#'   \item{\code{grade_range}}{Grade range}
#'   \item{\code{total_enrollment}}{Total Enrollment}
#'   \item{\code{variable}}{Variable}
#'   \item{\code{share}}{Percent of Total Enrollment}
#'   \item{\code{label}}{Variable label}
#' }
#' @source \url{https://www.baltimorecityschools.org/data}
"enrollment_demographics_SY1920_long"

#' Baltimore City Public School Parent Survey Results (SY 2018-2019)
#'
#' Results from the Baltimore City Public School Parent Survey administered
#' during the for the 2018-2029 school year. Data includes composite scores and
#' responses to selected questions school.
#'
#' @format A data frame with 169 rows and 54 variables:
#' \describe{
#'   \item{\code{school_number}}{School number}
#'   \item{\code{school_name}}{School name}
#'   \item{\code{management_type}}{School management type}
#'   \item{\code{grade_band}}{Grade band}
#'   \item{\code{parent_response_count}}{Total parent survey responses}
#'   \item{\code{est_num_parents}}{Estimated number of eligible parents}
#'   \item{\code{est_response_rate}}{Estimate parent response rate}
#'   \item{\code{administration_dimension_score}}{Administration Dimension Score}
#'   \item{\code{creativity_the_arts_dimension_score}}{Creativity & the Arts Dimension Score}
#'   \item{\code{physical_environment_dimension_score}}{Physical Environment Dimension Score}
#'   \item{\code{learning_climate_dimension_score}}{Learning Climate Dimension Score}
#'   \item{\code{family_involvement_dimension_score}}{Family Involvement Dimension Score}
#'   \item{\code{school_resources_dimension_score}}{School Resources Dimension Score}
#'   \item{\code{safety_dimension_score}}{Safety Dimension Score}
#'   \item{\code{satisfaction_with_school_dimension_score}}{Satisfaction with School Dimension Score}
#'   \item{\code{grit_dimension_score}}{Grit Dimension Score}
#'   \item{\code{overall}}{Overall Score}
#'   \item{\code{district_office_dimension_score}}{District Office Dimension Score}
#'   \item{\code{admin_1_the_school_administration_promptly_responds_to_my_concerns}}{The school administration promptly responds to my concerns}
#'   \item{\code{admin_9_parents_have_the_opportunity_to_give_input_into_the_school_s_decisions}}{Parents have the opportunity to give input into the school's decisions}
#'   \item{\code{creative_1_student_work_in_the_arts_is_displayed_or_presented_in_my_child_s_school}}{Student work in the arts is displayed or presented in my child's school}
#'   \item{\code{environ_1_the_school_building_is_clean_and_well_maintained}}{The school building is clean and well maintained}
#'   \item{\code{learn_13_teachers_care_about_their_students}}{Teachers care about their students}
#'   \item{\code{learn_14_i_feel_my_child_feels_like_i_belong_at_this_school}}{I feel (My child feels) like I belong at this school}
#'   \item{\code{learn_18_this_school_prepares_students_for_college_or_to_have_a_career}}{This school prepares students for college or to have a career}
#'   \item{\code{learn_19_if_students_break_rules_there_are_fair_consequences}}{If students break rules, there are fair consequences}
#'   \item{\code{parent_1_parents_or_guardians_are_welcome_at_this_school}}{Parents or guardians are welcome at this school}
#'   \item{\code{parent_11_parents_can_use_resources_at_my_child_s_school_when_school_is_not_in_session}}{Parents can use resources at my child's school when school is not in session}
#'   \item{\code{parent_12_i_know_how_to_access_information_about_how_my_child_is_performing_in_school_e_g_parent_portal}}{I know how to access information about how my child is performing in school (e.g., Parent Portal)}
#'   \item{\code{parent_18_the_school_sends_me_information_in_my_native_language}}{The school sends me information in my native language}
#'   \item{\code{parent_19_i_feel_that_my_input_into_my_child_s_education_is_valued}}{I feel that my input into my child's education is valued}
#'   \item{\code{parent_20_my_child_s_school_can_connect_me_to_resources_in_the_community}}{My child's school can connect me to resources in the community}
#'   \item{\code{parent_21_the_school_notifies_me_when_my_child_misses_school}}{The school notifies me when my child misses school}
#'   \item{\code{parent_23_my_child_s_school_regularly_communicates_with_parents_about_how_they_can_help_their_children_learn}}{My child's school regularly communicates with parents about how they can help their children learn}
#'   \item{\code{parent_3_when_a_student_does_something_good_at_school_the_parents_are_informed}}{When a student does something good at school, the parents are informed}
#'   \item{\code{parent_4_when_a_student_does_something_bad_at_school_the_parents_are_informed}}{When a student does something bad at school, the parents are informed}
#'   \item{\code{parent_5_school_staff_work_closely_with_parents_to_meet_students_needs}}{School staff work closely with parents to meet students' needs}
#'   \item{\code{resource_17_students_have_the_opportunity_to_take_books_home_from_this_school}}{Students have the opportunity to take books home from this school}
#'   \item{\code{resource_7_teachers_provide_extra_academic_help_to_students_who_need_it}}{Teachers provide extra academic help to students who need it}
#'   \item{\code{resource_9_this_school_has_programs_to_support_students_emotional_and_social_development}}{This school has programs to support students' emotional and social development}
#'   \item{\code{safe_12_students_feel_safe_at_this_school}}{Students feel safe at this school}
#'   \item{\code{safe_13_students_feel_safe_going_to_and_from_school}}{Students feel safe going to and from school}
#'   \item{\code{satisfy_11_overall_i_am_satisfied_with_my_child_s_school}}{Overall, I am satisfied with my child's school}
#'   \item{\code{satisfy_12_i_would_recommend_this_school_to_others}}{I would recommend this school to others}
#'   \item{\code{grit_6_i_encourage_my_child_to_keep_working_at_difficult_tasks_until_he_she_figures_them_out}}{I encourage my child to keep working at difficult tasks until he/she figures them out}
#'   \item{\code{value_1_regular_on_time_attendance_is_important_to_my_child_s_success_in_school}}{Regular, on-time attendance is important to my child's success in school}
#'   \item{\code{parent_read_2_i_read_with_my_child_at_least_once_a_month}}{I read with my child at least once a month}
#'   \item{\code{parent_talk_2_i_ask_my_child_what_he_she_did_at_school_at_least_once_a_month}}{I ask my child what he/she did at school at least once a month}
#'   \item{\code{district_office_1_if_you_called_the_district_office_within_the_last_year_how_satisfied_were_you_overall_with_the_support_you_received}}{If you called the District Office within the last year, how satisfied were you overall with the support you received?}
#'   \item{\code{district_office_2_if_you_visited_district_headquarters_within_the_last_year_how_satisfied_were_you_overall_with_the_service_s_you_requested}}{If you visited District Headquarters within the last year, how satisfied were you overall with the service(s) you requested?}
#'   \item{\code{transportation_how_does_your_child_usually_get_to_school_walk}}{Transportation - How does your child usually get to school? Walk}
#'   \item{\code{transportation_how_does_your_child_usually_get_to_school_school_bus}}{Transportation - How does your child usually get to school? School Bus}
#'   \item{\code{transportation_how_does_your_child_usually_get_to_school_mta_bus}}{Transportation - How does your child usually get to school? MTA Bus}
#'   \item{\code{transportation_how_does_your_child_usually_get_to_school_car}}{Transportation - How does your child usually get to school? Car}
#'}
#' @source \url{https://www.baltimorecityschools.org/data}
"parent_survey_SY1819"


#' Baltimore City Public School Parent Survey Results (SY 2018-2019) -
#' long format
#'
#' Results from the Baltimore City Public School Parent Survey administered
#' during the for the 2018-2029 school year. Data includes composite scores and
#' responses to selected questions school. Long format version is based on the
#' \code{parent_survey_SY1819} data with an additional \code{label} column based on the
#' original Excel sheet column names.
#'
#' @format A data frame with 7,943 rows and 10 variables:
#' \describe{
#'   \item{\code{school_number}}{School number}
#'   \item{\code{school_name}}{School name}
#'   \item{\code{management_type}}{School management type}
#'   \item{\code{grade_band}}{School grade band}
#'   \item{\code{parent_response_count}}{Number of parent survey responses}
#'   \item{\code{est_num_parents}}{Estimated number of eligible parents}
#'   \item{\code{est_response_rate}}{Estimated parent response rate}
#'   \item{\code{variable}}{Unique slug for composite score or question}
#'   \item{\code{value}}{Value of composite score or share of parents responding affirmatively to question}
#'   \item{\code{label}}{Variable label for composite score or question}
#' }
#' @source \url{https://www.baltimorecityschools.org/data}
"parent_survey_SY1819_long"


#' Baltimore City Public School Student Survey (SY 2018-2019)
#'
#' The Maryland School Survey was administered for the first time in spring 2019
#' to students and educators. It is online only, in English and Spanish for
#' students. Student participants were from Elementary (Grade 5), Middle (grades
#' 6-8), and High (grades 9-11), and all instructional staff were eligible. The
#' student participation rate was 69.9 percent overall, and the educator participation
#' rate was 76.9 percent.
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
#'   \item{\code{school_number}}{School number}
#'   \item{\code{school_name}}{School name}
#'   \item{\code{grade_band}}{School grade band}
#'   \item{\code{respondent_grade_band}}{Grade band of student survey respondents}
#'   \item{\code{respondent_count}}{Number of student survey respondents}
#'   \item{\code{respondent_group}}{Summary group of respondents}
#'   \item{\code{domain}}{Survey domain name}
#'   \item{\code{topic}}{Survey topic name}
#'   \item{\code{average_score}}{Average score}
#'   }
#' @source \url{https://www.baltimorecityschools.org/data}
"student_survey_SY1819"


#' Baltimore City Public School Educator Survey (SY 2018-2019)
#'
#' The Maryland School Survey was administered for the first time in spring 2019
#' to students and educators. It is online only, in English and Spanish for
#' students. Student participants were from Elementary (Grade 5), Middle (grades
#' 6-8), and High (grades 9-11), and all instructional staff were eligible. The
#' student participation rate was 69.9 percent overall, and the educator participation
#' rate was 76.9 percent.
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
#'   \item{\code{school_number}}{School number}
#'   \item{\code{school_name}}{School name}
#'   \item{\code{grade_band}}{Grade band}
#'   \item{\code{respondent_grade_band}}{Grade band of student survey respondents}
#'   \item{\code{respondent_count}}{Number of student survey respondents}
#'   \item{\code{domain}}{Survey domain name}
#'   \item{\code{topic}}{Survey topic name}
#'   \item{\code{average_score}}{Average score}
#' }
#' @source \url{https://www.baltimorecityschools.org/data}
"educator_survey_SY1819"

#' Baltimore City Public School Elementary School Attendance Zones (SY 2020-2021)
#'
#' Boundaries for Baltimore City Public School elementary school attendance zones for
#' the 2020-2021 school year. The \code{program_name} variable is equivalent to the \code{school_number}
#' variable used in the demographic and survey datasets.
#'
#' @format A data frame with 96 rows and 5 variables:
#' \describe{
#'   \item{\code{zone_number}}{Program zone number}
#'   \item{\code{zone_name}}{Program zone name}
#'   \item{\code{program_number}}{Program number (school number)}
#'   \item{\code{program_name_short}}{Program name (short)}
#'   \item{\code{geometry}}{Multipolygon geometry for zone boundaries}
#' }
#' @source \url{https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/BCPSZones_2021/FeatureServer/0}
"bcps_es_zones_SY2021"


#' Baltimore City Public School Program Locations (SY 2020-2021)
#'
#' Locations for Baltimore City Public School buildings and programs for the 2020-2021
#' school year. The \code{program_name} variable is equivalent to the \code{school_number}
#' variable used in the demographic and survey datasets.
#'
#' @format A data frame with 165 rows and 18 variables:
#' \describe{
#'   \item{\code{program_number}}{Program number (school number)}
#'   \item{\code{program_name_short}}{Program name (short)}
#'   \item{\code{grade_band}}{Grade band for program}
#'   \item{\code{management_type}}{School management type}
#'   \item{\code{category}}{Grade category}
#'   \item{\code{swing}}{Logical indicator for program at swing site}
#'   \item{\code{swing_building_number}}{Building number for swing site}
#'   \item{\code{colocated}}{Logical indicator for programs colocated with another program}
#'   \item{\code{two_buildings}}{Logical indicator for programs with two buildings at one site}
#'   \item{\code{home_building}}{...}
#'   \item{\code{council_district}}{Baltimore City Council District Number}
#'   \item{\code{legislative_district}}{Maryland Legislative District}
#'   \item{\code{congressional_district}}{U.S. Congressional District}
#'   \item{\code{planning_area}}{Planning area, Baltimore City Department of Planning}
#'   \item{\code{quadrant}}{Quadrant}
#'   \item{\code{zone_number}}{Program zone number}
#'   \item{\code{zone_name}}{Program zone name}
#'   \item{\code{geometry}}{Multipolygon geometry for zone boundaries}
#' }
#' @source \url{https://services3.arcgis.com/mbYrzb5fKcXcAMNi/ArcGIS/rest/services/SY2021_Programs/FeatureServer}
"bcps_programs_SY2021"



#'@title Enrolled students by school and grade (SY 2009-2019)
#'@description Enrollment data from the Maryland State Department of Education
#'  (MSDE). Raw CSV data files with the full state enrollment data are available
#'  in the \code{inst/extdata} folder. The number of enrolled students includes
#'  ungraded special education and pre-kindergarten students.
#'  Variable definitions are based on the \href{https://reportcard.msde.maryland.gov/Definitions/Index}{definitions from the MSDE website}.
#'@format A data frame with 16,763 rows and 6 variables:
#'\describe{
#'  \item{\code{school_year}}{School or academic year for enrollment count, e.g.
#'    2019 data is from the start of the 2019-2020 school year.}
#'  \item{\code{school_number}}{School number (0 indicates all schools)}
#'  \item{\code{school_name}}{School name}
#'  \item{\code{enrolled_count}}{Number of students registered to attend the school as of September 30 in the grade or grade range}
#'  \item{\code{grade}}{Grades from Prekindergarden (PK) to Grade 12}
#'  \item{\code{grade_range}}{Elementary school, middle school, high school, or
#'    all grades (total enrollment)}
#'  }
#'@source \href{https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload}{MSDE Data Downloads}
"enrollment_msde_SY0919"


#' @title Attendance data by school (SY 2009-2019)
#' @description Attendance data from the Maryland State Department of Education
#'   (MSDE). Raw CSV data files with the full state enrollment data are
#'   available in the \code{inst/extdata} folder. Any percent variables with a
#'   value of 95 percent should be interpreted as equivalent at or above 95
#'   percent. Any percent variables with a value of 5 percent should be
#'   interpreted as equivalent to at or below 5 percent. Chronic absenteeism
#'   data is not available prior to 2018 when the federal Every Student Succeeds
#'   Act (passed in 2015) went into effect and Maryland began to include the
#'   chronic absenteeism rate in the state's annual academic report cards.
#'   Variable definitions are based on the \href{https://reportcard.msde.maryland.gov/Definitions/Index}{definitions from the MSDE website}.
#' @format A data frame with 3,197 rows and 15 variables:
#' \describe{
#'   \item{\code{school_year}}{School year or academic year, e.g. 2019 for 2019-2020 school year}
#'   \item{\code{school_number}}{School number (0 indicates all schools)}
#'   \item{\code{school_name}}{School name}
#'   \item{\code{grade_band}}{Grade band (school type)}
#'   \item{\code{attend_rate_pct}}{Attendance rate as defined as the average daily attendance rate of students in the school and grade band, including special education students}
#'   \item{\code{days_attended_cnt}}{Total number of students in attendance from the first day of school through April 13th}
#'   \item{\code{days_member_cnt}}{Total number of students registered to attend from the first day of school through April 13th}
#'   \item{\code{fewer_5_pct}}{Percent of students absentee rate is the percentage of students absent from school for five or fewer days between the first day of the school year and the last day of the school year}
#'   \item{\code{fewer_5_cnt}}{Count of students absentee rate is the percentage of students absent from school for five or fewer days between the first day of the school year and the last day of the school year}
#'   \item{\code{more_20_pct}}{Percent of students absentee rate is the percentage of students absent from school for twenty or more days between the first day of the school year and the last day of the school year}
#'   \item{\code{more_20_cnt}}{Number of students absentee rate is the percentage of students absent from school for twenty or more days between the first day of the school year and the last day of the school year}
#'   \item{\code{more_90_member_cnt}}{Number of students with an attendance rate of 90 percent or more (?)}
#'   \item{\code{chronic_absentee_cnt}}{Number of students expected to attend school for at least 10 days who were absent 10 percent or more of the school days while enrolled at that school}
#'   \item{\code{chronic_absentee_denom}}{Number of students who are expected to attend school for at least 10 days in the school year}
#'   \item{\code{chronic_absentee_pct}}{Chronic absenteeism rate as defined as the percent of students expected to attend school for at least 10 days who were absent 10 percent or more of the school days while enrolled at that school}
#'  }
#'@source \href{https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload}{MSDE Data Downloads}
"attendance_msde_SY0919"
