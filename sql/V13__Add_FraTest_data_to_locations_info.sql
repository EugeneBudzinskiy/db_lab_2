INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.fraptregname, t.fraptareaname, t.frapttername FROM
    (SELECT DISTINCT fraptregname, fraptareaname, frapttername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.fraptregname = locations_info.region_name AND
       t.fraptareaname = locations_info.area_name AND
       t.frapttername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.fraptregname IS NOT NULL AND
          t.fraptareaname IS NOT NULL AND
          t.frapttername IS NOT NULL;
