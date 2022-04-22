INSERT INTO schools_info (location_id, name)
    SELECT tt.location_id, tt.physptname FROM
    (SELECT locations_info.location_id, t.physptname FROM
        (SELECT DISTINCT physptname, physptregname, physptareaname, physpttername FROM zno_data) AS t
        LEFT JOIN locations_info
        ON t.physptregname = locations_info.region_name AND
           t.physptareaname = locations_info.area_name AND
           t.physpttername = locations_info.territory_name
        WHERE location_id IS NOT NULL) as tt
    LEFT JOIN schools_info
    ON tt.location_id = schools_info.location_id AND
       tt.physptname = schools_info.name
    WHERE school_id IS NULL AND tt.physptname IS NOT NULL;
