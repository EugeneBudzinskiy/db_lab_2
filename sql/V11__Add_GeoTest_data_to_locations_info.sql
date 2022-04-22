INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.geoptregname, t.geoptareaname, t.geopttername FROM
    (SELECT DISTINCT geoptregname, geoptareaname, geopttername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.geoptregname = locations_info.region_name AND
       t.geoptareaname = locations_info.area_name AND
       t.geopttername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.geoptregname IS NOT NULL AND
          t.geoptareaname IS NOT NULL AND
          t.geopttername IS NOT NULL;
