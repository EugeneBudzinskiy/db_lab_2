-- Add geo_test data to `tests` table
INSERT INTO tests (student_id, school_id, name, status, score_200, score_12, score, lang)
    SELECT student_id, school_id, geo_test, geo_test_status, geo_score_200, geo_score_12, geo_score, geo_lang FROM
		(SELECT student_id, geo_test, geo_test_status, geo_score_200, geo_score_12, geo_score, geo_lang,
 				geo_pt_name, geo_pt_region_name, geo_pt_area_name, geo_pt_territory_name FROM students) AS t1
		LEFT JOIN school_location AS t2
		ON t1.geo_pt_name = t2.name AND
   		   t1.geo_pt_region_name = t2.region_name AND
   		   t1.geo_pt_area_name = t2.area_name AND
   		   t1.geo_pt_territory_name = t2.territory_name
		WHERE geo_test IS NOT NULL;


-- Remove columns from `students` which was connected to geo_test data
ALTER TABLE students
	DROP COLUMN geo_test,
	DROP COLUMN geo_lang,
	DROP COLUMN geo_test_status,
	DROP COLUMN geo_score_200,
	DROP COLUMN geo_score_12,
	DROP COLUMN geo_score,
	DROP COLUMN geo_pt_name,
	DROP COLUMN geo_pt_region_name,
	DROP COLUMN geo_pt_area_name,
	DROP COLUMN geo_pt_territory_name;


