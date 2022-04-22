ALTER TABLE zno_data
    ADD COLUMN eo_school_id INTEGER NULL;


UPDATE zno_data SET eo_school_id = tt.school_id
FROM (SELECT outid, eoname, eotypename, eoparent, eoregname, eoareaname, eotername FROM zno_data) AS t
LEFT JOIN
    (SELECT school_id, name, type, parent_name, region_name, area_name, territory_name
    FROM schools_info AS s_i LEFT JOIN locations_info AS l_i on s_i.location_id = l_i.location_id) as tt
ON t.eoname = tt.name AND
   t.eotypename = tt.type AND
   t.eoparent = tt.parent_name AND
   t.eoregname = tt.region_name AND
   t.eoareaname = tt.area_name AND
   t.eotername = tt.territory_name
WHERE zno_data.outid = t.outid;
