INSERT INTO locations (region_name, area_name, territory_name)
    SELECT t.chem_pt_region_name, t.chem_pt_area_name, t.chem_pt_territory_name FROM
    (SELECT DISTINCT chem_pt_region_name, chem_pt_area_name, chem_pt_territory_name  FROM students) AS t
    LEFT JOIN locations
    ON t.chem_pt_region_name = locations.region_name AND
       t.chem_pt_area_name = locations.area_name AND
       t.chem_pt_territory_name = locations.territory_name
    WHERE location_id IS NULL AND
          t.chem_pt_region_name IS NOT NULL AND
          t.chem_pt_area_name IS NOT NULL AND
          t.chem_pt_territory_name IS NOT NULL;


