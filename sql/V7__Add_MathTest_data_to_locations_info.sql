INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.mathptregname, t.mathptareaname, t.mathpttername FROM
    (SELECT DISTINCT mathptregname, mathptareaname, mathpttername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.mathptregname = locations_info.region_name AND
       t.mathptareaname = locations_info.area_name AND
       t.mathpttername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.mathptregname IS NOT NULL AND
          t.mathptareaname IS NOT NULL AND
          t.mathpttername IS NOT NULL;
