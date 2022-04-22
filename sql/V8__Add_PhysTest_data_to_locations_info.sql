INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.physptregname, t.physptareaname, t.physpttername FROM
    (SELECT DISTINCT physptregname, physptareaname, physpttername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.physptregname = locations_info.region_name AND
       t.physptareaname = locations_info.area_name AND
       t.physpttername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.physptregname IS NOT NULL AND
          t.physptareaname IS NOT NULL AND
          t.physpttername IS NOT NULL;
