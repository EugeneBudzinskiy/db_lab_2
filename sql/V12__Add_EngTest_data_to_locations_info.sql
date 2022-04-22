INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.engptregname, t.engptareaname, t.engpttername FROM
    (SELECT DISTINCT engptregname, engptareaname, engpttername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.engptregname = locations_info.region_name AND
       t.engptareaname = locations_info.area_name AND
       t.engpttername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.engptregname IS NOT NULL AND
          t.engptareaname IS NOT NULL AND
          t.engpttername IS NOT NULL;
