INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.bioptregname, t.bioptareaname, t.biopttername FROM
    (SELECT DISTINCT bioptregname, bioptareaname, biopttername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.bioptregname = locations_info.region_name AND
       t.bioptareaname = locations_info.area_name AND
       t.biopttername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.bioptregname IS NOT NULL AND
          t.bioptareaname IS NOT NULL AND
          t.biopttername IS NOT NULL;
