-- Add fra_test data to `tests` table
INSERT INTO tests (student_id, school_id, name, status, score_200, score_12, score, dpa_level)
    SELECT student_id, school_id, fra_test, fra_test_status, fra_score_200, fra_score_12, fra_score, fra_dpa_level FROM
		(SELECT student_id, fra_test, fra_test_status, fra_score_200, fra_score_12, fra_score, fra_dpa_level,
 				fra_pt_name, fra_pt_region_name, fra_pt_area_name, fra_pt_territory_name FROM students) AS t1
		LEFT JOIN school_location AS t2
		ON t1.fra_pt_name = t2.name AND
   		   t1.fra_pt_region_name = t2.region_name AND
   		   t1.fra_pt_area_name = t2.area_name AND
   		   t1.fra_pt_territory_name = t2.territory_name
		WHERE fra_test IS NOT NULL;


-- Remove columns from `students` which was connected to fra_test data
ALTER TABLE students
	DROP COLUMN fra_test,
	DROP COLUMN fra_dpa_level,
	DROP COLUMN fra_test_status,
	DROP COLUMN fra_score_200,
	DROP COLUMN fra_score_12,
	DROP COLUMN fra_score,
	DROP COLUMN fra_pt_name,
	DROP COLUMN fra_pt_region_name,
	DROP COLUMN fra_pt_area_name,
	DROP COLUMN fra_pt_territory_name;


