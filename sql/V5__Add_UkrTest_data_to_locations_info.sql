INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.ukrptregname, t.ukrptareaname, t.ukrpttername FROM
    (SELECT DISTINCT ukrptregname, ukrptareaname, ukrpttername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.ukrptregname = locations_info.region_name AND
       t.ukrptareaname = locations_info.area_name AND
       t.ukrpttername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.ukrptregname IS NOT NULL AND
          t.ukrptareaname IS NOT NULL AND
          t.ukrpttername IS NOT NULL;