ALTER TABLE zno_data
    ADD COLUMN ukr_test_school_id INTEGER NULL;


UPDATE zno_data SET ukr_test_school_id = tt.school_id
FROM (SELECT outid, UkrPTName, UkrPTRegName, UkrPTAreaName, UkrPTTerName FROM zno_data) AS t
LEFT JOIN
    (SELECT school_id, name, region_name, area_name, territory_name FROM schools_info AS s_i
    LEFT JOIN locations_info AS l_i ON s_i.location_id = l_i.location_id) as tt
ON t.UkrPTName = tt.name AND
   t.UkrPTRegName = tt.region_name AND
   t.UkrPTAreaName = tt.area_name AND
   t.UkrPTTerName = tt.territory_name
WHERE zno_data.outid = t.outid;