-- Add math_test data to `tests` table
INSERT INTO tests (student_id, school_id, name, status, score_200, score_12, score, lang)
    SELECT student_id, school_id, math_test, math_test_status, math_score_200, math_score_12, math_score, math_lang FROM
		(SELECT student_id, math_test, math_test_status, math_score_200, math_score_12, math_score, math_lang,
 				math_pt_name, math_pt_region_name, math_pt_area_name, math_pt_territory_name FROM students) AS t1
		LEFT JOIN school_location AS t2
		ON t1.math_pt_name = t2.name AND
   		   t1.math_pt_region_name = t2.region_name AND
   		   t1.math_pt_area_name = t2.area_name AND
   		   t1.math_pt_territory_name = t2.territory_name
		WHERE math_test IS NOT NULL;


-- Remove columns from `students` which was connected to math_test data
ALTER TABLE students
	DROP COLUMN math_test,
	DROP COLUMN math_lang,
	DROP COLUMN math_test_status,
	DROP COLUMN math_score_200,
	DROP COLUMN math_score_12,
	DROP COLUMN math_score,
	DROP COLUMN math_pt_name,
	DROP COLUMN math_pt_region_name,
	DROP COLUMN math_pt_area_name,
	DROP COLUMN math_pt_territory_name;


