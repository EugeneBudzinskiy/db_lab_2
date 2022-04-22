INSERT INTO schools_info (location_id, name, type, parent_name)
    SELECT locations_info.location_id, t.eoname, t.eotypename, t.eoparent FROM
    (SELECT DISTINCT eoname, eotypename, eoparent, eoregname, eoareaname, eotername FROM zno_data) AS t
    LEFT JOIN locations_info
    ON t.eoregname = locations_info.region_name AND
       t.eoareaname = locations_info.area_name AND
       t.eotername = locations_info.territory_name
    WHERE location_id IS NOT NULL;
