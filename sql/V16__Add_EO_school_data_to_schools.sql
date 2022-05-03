INSERT INTO schools (location_id, name, type, parent_name)
     SELECT locations.location_id, t.eo_name, t.eo_type, t.eo_parent_name FROM
     (SELECT DISTINCT eo_name, eo_type, eo_parent_name,
                      eo_region_name, eo_area_name, eo_territory_name FROM students) AS t
     LEFT JOIN locations
     ON t.eo_region_name = locations.region_name AND
        t.eo_area_name = locations.area_name AND
        t.eo_territory_name = locations.territory_name
     WHERE location_id IS NOT NULL;

