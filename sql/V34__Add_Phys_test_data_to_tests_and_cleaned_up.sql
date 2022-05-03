-- Add phys_test data to `tests` table
INSERT INTO tests (student_id, school_id, name, status, score_200, score_12, score, lang)
    SELECT student_id, school_id, phys_test, phys_test_status, phys_score_200, phys_score_12, phys_score, phys_lang FROM
		(SELECT student_id, phys_test, phys_test_status, phys_score_200, phys_score_12, phys_score, phys_lang,
 				phys_pt_name, phys_pt_region_name, phys_pt_area_name, phys_pt_territory_name FROM students) AS t1
		LEFT JOIN school_location AS t2
		ON t1.phys_pt_name = t2.name AND
   		   t1.phys_pt_region_name = t2.region_name AND
   		   t1.phys_pt_area_name = t2.area_name AND
   		   t1.phys_pt_territory_name = t2.territory_name
		WHERE phys_test IS NOT NULL;


-- Remove columns from `students` which was connected to phys_test data
ALTER TABLE students
	DROP COLUMN phys_test,
	DROP COLUMN phys_lang,
	DROP COLUMN phys_test_status,
	DROP COLUMN phys_score_200,
	DROP COLUMN phys_score_12,
	DROP COLUMN phys_score,
	DROP COLUMN phys_pt_name,
	DROP COLUMN phys_pt_region_name,
	DROP COLUMN phys_pt_area_name,
	DROP COLUMN phys_pt_territory_name;


