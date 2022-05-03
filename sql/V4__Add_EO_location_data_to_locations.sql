INSERT INTO locations (region_name, area_name, territory_name)
	SELECT t.eo_region_name, t.eo_area_name, t.eo_territory_name FROM
    (SELECT DISTINCT eo_region_name, eo_area_name, eo_territory_name FROM students) AS t
    LEFT JOIN locations
    ON t.eo_region_name = locations.region_name AND
	   t.eo_area_name = locations.area_name AND
       t.eo_territory_name = locations.territory_name
 	 WHERE location_id IS NULL AND
	 	   t.eo_region_name IS NOT NULL AND
           t.eo_area_name IS NOT NULL AND
           t.eo_territory_name IS NOT NULL;

