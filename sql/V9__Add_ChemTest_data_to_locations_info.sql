INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.chemptregname, t.chemptareaname, t.chempttername FROM
    (SELECT DISTINCT chemptregname, chemptareaname, chempttername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.chemptregname = locations_info.region_name AND
       t.chemptareaname = locations_info.area_name AND
       t.chempttername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.chemptregname IS NOT NULL AND
          t.chemptareaname IS NOT NULL AND
          t.chempttername IS NOT NULL;
