-- Add hist_test data to `tests` table
INSERT INTO tests (student_id, school_id, name, status, score_200, score_12, score, lang)
    SELECT student_id, school_id, hist_test, hist_test_status, hist_score_200, hist_score_12, hist_score, hist_lang FROM
		(SELECT student_id, hist_test, hist_test_status, hist_score_200, hist_score_12, hist_score, hist_lang,
 				hist_pt_name, hist_pt_region_name, hist_pt_area_name, hist_pt_territory_name FROM students) AS t1
		LEFT JOIN school_location AS t2
		ON t1.hist_pt_name = t2.name AND
   		   t1.hist_pt_region_name = t2.region_name AND
   		   t1.hist_pt_area_name = t2.area_name AND
   		   t1.hist_pt_territory_name = t2.territory_name
		WHERE hist_test IS NOT NULL;


-- Remove columns from `students` which was connected to hist_test data
ALTER TABLE students
	DROP COLUMN hist_test,
	DROP COLUMN hist_lang,
	DROP COLUMN hist_test_status,
	DROP COLUMN hist_score_200,
	DROP COLUMN hist_score_12,
	DROP COLUMN hist_score,
	DROP COLUMN hist_pt_name,
	DROP COLUMN hist_pt_region_name,
	DROP COLUMN hist_pt_area_name,
	DROP COLUMN hist_pt_territory_name;


