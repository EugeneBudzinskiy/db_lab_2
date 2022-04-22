INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.histptregname, t.histptareaname, t.histpttername FROM
    (SELECT DISTINCT histptregname, histptareaname, histpttername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.histptregname = locations_info.region_name AND
       t.histptareaname = locations_info.area_name AND
       t.histpttername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.histptregname IS NOT NULL AND
          t.histptareaname IS NOT NULL AND
          t.histpttername IS NOT NULL;
