-- Add deu_test data to `tests` table
INSERT INTO tests (student_id, school_id, name, status, score_200, score_12, score, dpa_level)
    SELECT student_id, school_id, deu_test, deu_test_status, deu_score_200, deu_score_12, deu_score, deu_dpa_level FROM
		(SELECT student_id, deu_test, deu_test_status, deu_score_200, deu_score_12, deu_score, deu_dpa_level,
 				deu_pt_name, deu_pt_region_name, deu_pt_area_name, deu_pt_territory_name FROM students) AS t1
		LEFT JOIN school_location AS t2
		ON t1.deu_pt_name = t2.name AND
   		   t1.deu_pt_region_name = t2.region_name AND
   		   t1.deu_pt_area_name = t2.area_name AND
   		   t1.deu_pt_territory_name = t2.territory_name
		WHERE deu_test IS NOT NULL;


-- Remove columns from `students` which was connected to deu_test data
ALTER TABLE students
	DROP COLUMN deu_test,
	DROP COLUMN deu_dpa_level,
	DROP COLUMN deu_test_status,
	DROP COLUMN deu_score_200,
	DROP COLUMN deu_score_12,
	DROP COLUMN deu_score,
	DROP COLUMN deu_pt_name,
	DROP COLUMN deu_pt_region_name,
	DROP COLUMN deu_pt_area_name,
	DROP COLUMN deu_pt_territory_name;


