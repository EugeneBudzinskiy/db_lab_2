INSERT INTO schools_info (location_id, name)
    SELECT tt.location_id, tt.deuptname FROM
    (SELECT locations_info.location_id, t.deuptname FROM
        (SELECT DISTINCT deuptname, deuptregname, deuptareaname, deupttername FROM zno_data) AS t
        LEFT JOIN locations_info
        ON t.deuptregname = locations_info.region_name AND
           t.deuptareaname = locations_info.area_name AND
           t.deupttername = locations_info.territory_name
        WHERE location_id IS NOT NULL) as tt
    LEFT JOIN schools_info
    ON tt.location_id = schools_info.location_id AND
       tt.deuptname = schools_info.name
    WHERE school_id IS NULL AND tt.deuptname IS NOT NULL;
