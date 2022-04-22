INSERT INTO locations_info (region_name, area_name, territory_name)
    SELECT t.eoregname, t.eoareaname, t.eotername FROM
    (SELECT DISTINCT eoregname, eoareaname, eotername  FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.eoregname = locations_info.region_name AND
       t.eoareaname = locations_info.area_name AND
       t.eotername = locations_info.territory_name
    WHERE location_id IS NULL AND
          t.eoregname IS NOT NULL AND
          t.eoareaname IS NOT NULL AND
          t.eotername IS NOT NULL;