-- Add eng_test data to `tests` table
INSERT INTO tests (student_id, school_id, name, status, score_200, score_12, score, dpa_level)
    SELECT student_id, school_id, eng_test, eng_test_status, eng_score_200, eng_score_12, eng_score, eng_dpa_level FROM
		(SELECT student_id, eng_test, eng_test_status, eng_score_200, eng_score_12, eng_score, eng_dpa_level,
 				eng_pt_name, eng_pt_region_name, eng_pt_area_name, eng_pt_territory_name FROM students) AS t1
		LEFT JOIN school_location AS t2
		ON t1.eng_pt_name = t2.name AND
   		   t1.eng_pt_region_name = t2.region_name AND
   		   t1.eng_pt_area_name = t2.area_name AND
   		   t1.eng_pt_territory_name = t2.territory_name
		WHERE eng_test IS NOT NULL;


-- Remove columns from `students` which was connected to eng_test data
ALTER TABLE students
	DROP COLUMN eng_test,
	DROP COLUMN eng_dpa_level,
	DROP COLUMN eng_test_status,
	DROP COLUMN eng_score_200,
	DROP COLUMN eng_score_12,
	DROP COLUMN eng_score,
	DROP COLUMN eng_pt_name,
	DROP COLUMN eng_pt_region_name,
	DROP COLUMN eng_pt_area_name,
	DROP COLUMN eng_pt_territory_name;


