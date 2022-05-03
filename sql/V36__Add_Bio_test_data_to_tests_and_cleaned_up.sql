-- Add bio_test data to `tests` table
INSERT INTO tests (student_id, school_id, name, status, score_200, score_12, score, lang)
    SELECT student_id, school_id, bio_test, bio_test_status, bio_score_200, bio_score_12, bio_score, bio_lang FROM
		(SELECT student_id, bio_test, bio_test_status, bio_score_200, bio_score_12, bio_score, bio_lang,
 				bio_pt_name, bio_pt_region_name, bio_pt_area_name, bio_pt_territory_name FROM students) AS t1
		LEFT JOIN school_location AS t2
		ON t1.bio_pt_name = t2.name AND
   		   t1.bio_pt_region_name = t2.region_name AND
   		   t1.bio_pt_area_name = t2.area_name AND
   		   t1.bio_pt_territory_name = t2.territory_name
		WHERE bio_test IS NOT NULL;


-- Remove columns from `students` which was connected to bio_test data
ALTER TABLE students
	DROP COLUMN bio_test,
	DROP COLUMN bio_lang,
	DROP COLUMN bio_test_status,
	DROP COLUMN bio_score_200,
	DROP COLUMN bio_score_12,
	DROP COLUMN bio_score,
	DROP COLUMN bio_pt_name,
	DROP COLUMN bio_pt_region_name,
	DROP COLUMN bio_pt_area_name,
	DROP COLUMN bio_pt_territory_name;


