-- Add values to new column in `students` table
UPDATE students SET am_school_id = t2.school_id
FROM (SELECT student_id, eo_name, eo_type, eo_parent_name,
             eo_region_name, eo_area_name, eo_territory_name FROM students) AS t1
LEFT JOIN
    (SELECT school_id, name, type, parent_name, region_name, area_name, territory_name
    FROM schools AS s LEFT JOIN locations AS l on s.location_id = l.location_id) as t2
ON t1.eo_name = t2.name AND
   t1.eo_type = t2.type AND
   t1.eo_parent_name = t2.parent_name AND
   t1.eo_region_name = t2.region_name AND
   t1.eo_area_name = t2.area_name AND
   t1.eo_territory_name = t2.territory_name
WHERE students.student_id = t1.student_id;


-- Remove columns which was replaced by new column in `students` table
ALTER TABLE students
    DROP COLUMN eo_name,
    DROP COLUMN eo_type,
    DROP COLUMN eo_parent_name,
    DROP COLUMN eo_region_name,
    DROP COLUMN eo_area_name,
    DROP COLUMN eo_territory_name;


