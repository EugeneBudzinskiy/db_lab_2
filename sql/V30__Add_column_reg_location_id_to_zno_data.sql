ALTER TABLE zno_data
    ADD COLUMN reg_location_id INTEGER NULL;


UPDATE zno_data SET reg_location_id = locations_info.location_id
FROM (SELECT outid, regname, areaname, tername, tertypename FROM zno_data) AS t
LEFT JOIN locations_info
ON t.regname = locations_info.region_name AND
   t.areaname = locations_info.area_name AND
   t.tername = locations_info.territory_name AND
   t.tertypename = locations_info.territory_type
WHERE zno_data.outid = t.outid;
