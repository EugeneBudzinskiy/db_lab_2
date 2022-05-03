-- Add values to new column in `students` table
UPDATE students SET reg_location_id = locations.location_id
FROM (SELECT student_id, reg_region_name, reg_area_name, reg_territory_name, reg_territory_type FROM students) AS t
LEFT JOIN locations
ON t.reg_region_name = locations.region_name AND
   t.reg_area_name = locations.area_name AND
   t.reg_territory_name = locations.territory_name AND
   t.reg_territory_type = locations.territory_type
WHERE students.student_id = t.student_id;


-- Remove columns which was replaced by new column in `students` table
ALTER TABLE students
    DROP COLUMN reg_region_name,
    DROP COLUMN reg_area_name,
    DROP COLUMN reg_territory_name,
    DROP COLUMN reg_territory_type;
