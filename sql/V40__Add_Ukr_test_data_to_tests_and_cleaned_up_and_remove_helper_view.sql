


-- Add ukr_test data to `tests` table
INSERT INTO tests (student_id, school_id, name, status, score_200, score_12, score, adapt_scale)
    SELECT student_id, school_id, ukr_test, ukr_test_status,
           ukr_score_200, ukr_score_12, ukr_score, ukr_adapt_scale FROM
		(SELECT student_id, ukr_test, ukr_test_status, ukr_score_200, ukr_score_12, ukr_score, ukr_adapt_scale,
 				ukr_pt_name, ukr_pt_region_name, ukr_pt_area_name, ukr_pt_territory_name FROM students) AS t1
		LEFT JOIN school_location AS t2
		ON t1.ukr_pt_name = t2.name AND
   		   t1.ukr_pt_region_name = t2.region_name AND
   		   t1.ukr_pt_area_name = t2.area_name AND
   		   t1.ukr_pt_territory_name = t2.territory_name
		WHERE ukr_test IS NOT NULL;


-- Remove columns from `students` which was connected to ukr_test data
ALTER TABLE students
	DROP COLUMN ukr_test,
	DROP COLUMN ukr_test_status,
	DROP COLUMN ukr_score_200,
	DROP COLUMN ukr_score_12,
	DROP COLUMN ukr_score,
	DROP COLUMN ukr_adapt_scale,
	DROP COLUMN ukr_pt_name,
	DROP COLUMN ukr_pt_region_name,
	DROP COLUMN ukr_pt_area_name,
	DROP COLUMN ukr_pt_territory_name;


-- Remove view for school - location relation
DROP VIEW school_location;