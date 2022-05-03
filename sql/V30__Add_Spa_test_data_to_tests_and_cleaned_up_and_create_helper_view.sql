-- Create view for school - location relation
CREATE VIEW school_location AS
    SELECT school_id, name, region_name, area_name, territory_name FROM schools AS s
        LEFT JOIN locations AS l ON s.location_id = l.location_id;


-- Add spa_test data to `tests` table
INSERT INTO tests (student_id, school_id, name, status, score_200, score_12, score, dpa_level)
    SELECT student_id, school_id, spa_test, spa_test_status, spa_score_200, spa_score_12, spa_score, spa_dpa_level FROM
		(SELECT student_id, spa_test, spa_test_status, spa_score_200, spa_score_12, spa_score, spa_dpa_level,
 				spa_pt_name, spa_pt_region_name, spa_pt_area_name, spa_pt_territory_name FROM students) AS t1
		LEFT JOIN school_location AS t2
		ON t1.spa_pt_name = t2.name AND
   		   t1.spa_pt_region_name = t2.region_name AND
   		   t1.spa_pt_area_name = t2.area_name AND
   		   t1.spa_pt_territory_name = t2.territory_name
		WHERE spa_test IS NOT NULL;


-- Remove columns from `students` which was connected to spa_test data
ALTER TABLE students
	DROP COLUMN spa_test,
	DROP COLUMN spa_dpa_level,
	DROP COLUMN spa_test_status,
	DROP COLUMN spa_score_200,
	DROP COLUMN spa_score_12,
	DROP COLUMN spa_score,
	DROP COLUMN spa_pt_name,
	DROP COLUMN spa_pt_region_name,
	DROP COLUMN spa_pt_area_name,
	DROP COLUMN spa_pt_territory_name;


