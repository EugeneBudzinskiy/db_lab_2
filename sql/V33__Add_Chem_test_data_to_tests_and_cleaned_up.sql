-- Add chem_test data to `tests` table
INSERT INTO tests (student_id, school_id, name, status, score_200, score_12, score, lang)
    SELECT student_id, school_id, chem_test, chem_test_status, chem_score_200, chem_score_12, chem_score, chem_lang FROM
		(SELECT student_id, chem_test, chem_test_status, chem_score_200, chem_score_12, chem_score, chem_lang,
 				chem_pt_name, chem_pt_region_name, chem_pt_area_name, chem_pt_territory_name FROM students) AS t1
		LEFT JOIN school_location AS t2
		ON t1.chem_pt_name = t2.name AND
   		   t1.chem_pt_region_name = t2.region_name AND
   		   t1.chem_pt_area_name = t2.area_name AND
   		   t1.chem_pt_territory_name = t2.territory_name
		WHERE chem_test IS NOT NULL;


-- Remove columns from `students` which was connected to chem_test data
ALTER TABLE students
	DROP COLUMN chem_test,
	DROP COLUMN chem_lang,
	DROP COLUMN chem_test_status,
	DROP COLUMN chem_score_200,
	DROP COLUMN chem_score_12,
	DROP COLUMN chem_score,
	DROP COLUMN chem_pt_name,
	DROP COLUMN chem_pt_region_name,
	DROP COLUMN chem_pt_area_name,
	DROP COLUMN chem_pt_territory_name;


