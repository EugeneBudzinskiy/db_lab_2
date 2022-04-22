ALTER TABLE zno_data
    ADD COLUMN fra_test_school_id INTEGER NULL;


UPDATE zno_data SET fra_test_school_id = tt.school_id
FROM (SELECT outid, fraPTName, fraPTRegName, fraPTAreaName, fraPTTerName FROM zno_data) AS t
LEFT JOIN
    (SELECT school_id, name, region_name, area_name, territory_name FROM schools_info AS s_i
    LEFT JOIN locations_info AS l_i ON s_i.location_id = l_i.location_id) as tt
ON t.fraPTName = tt.name AND
   t.fraPTRegName = tt.region_name AND
   t.fraPTAreaName = tt.area_name AND
   t.fraPTTerName = tt.territory_name
WHERE zno_data.outid = t.outid;
