INSERT INTO schools_info (location_id, name)
    SELECT tt.location_id, tt.chemptname FROM
    (SELECT locations_info.location_id, t.chemptname FROM
        (SELECT DISTINCT chemptname, chemptregname, chemptareaname, chempttername FROM zno_data) AS t
        LEFT JOIN locations_info
        ON t.chemptregname = locations_info.region_name AND
           t.chemptareaname = locations_info.area_name AND
           t.chempttername = locations_info.territory_name
        WHERE location_id IS NOT NULL) as tt
    LEFT JOIN schools_info
    ON tt.location_id = schools_info.location_id AND
       tt.chemptname = schools_info.name
    WHERE school_id IS NULL AND tt.chemptname IS NOT NULL;
