-- Add location data to `locations` table
INSERT INTO locations (region_name, area_name, territory_name, territory_type)
    SELECT DISTINCT reg_region_name, reg_area_name, reg_territory_name, reg_territory_type FROM students;


-- Add new column to `students` table, + create FK
ALTER TABLE students
    ADD COLUMN reg_location_id INTEGER NULL,
	ADD CONSTRAINT fk_reg_location_id FOREIGN KEY (reg_location_id) REFERENCES locations(location_id);



