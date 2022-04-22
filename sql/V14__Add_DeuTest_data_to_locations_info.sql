INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.deuptregname, t.deuptareaname, t.deupttername FROM
    (SELECT DISTINCT deuptregname, deuptareaname, deupttername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.deuptregname = locations_info.region_name AND
       t.deuptareaname = locations_info.area_name AND
       t.deupttername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.deuptregname IS NOT NULL AND
          t.deuptareaname IS NOT NULL AND
          t.deupttername IS NOT NULL;
