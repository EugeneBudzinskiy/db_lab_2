ALTER TABLE zno_data
    ADD COLUMN deu_test_school_id INTEGER NULL;


UPDATE zno_data SET deu_test_school_id = tt.school_id
FROM (SELECT outid, deuPTName, deuPTRegName, deuPTAreaName, deuPTTerName FROM zno_data) AS t
LEFT JOIN
    (SELECT school_id, name, region_name, area_name, territory_name FROM schools_info AS s_i
    LEFT JOIN locations_info AS l_i ON s_i.location_id = l_i.location_id) as tt
ON t.deuPTName = tt.name AND
   t.deuPTRegName = tt.region_name AND
   t.deuPTAreaName = tt.area_name AND
   t.deuPTTerName = tt.territory_name
WHERE zno_data.outid = t.outid;
