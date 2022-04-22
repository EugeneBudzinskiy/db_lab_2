INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.spaptregname, t.spaptareaname, t.spapttername FROM
    (SELECT DISTINCT spaptregname, spaptareaname, spapttername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.spaptregname = locations_info.region_name AND
       t.spaptareaname = locations_info.area_name AND
       t.spapttername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.spaptregname IS NOT NULL AND
          t.spaptareaname IS NOT NULL AND
          t.spapttername IS NOT NULL;
