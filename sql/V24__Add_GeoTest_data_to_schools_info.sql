INSERT INTO schools_info (location_id, name)
    SELECT tt.location_id, tt.geoptname FROM
    (SELECT locations_info.location_id, t.geoptname FROM
        (SELECT DISTINCT geoptname, geoptregname, geoptareaname, geopttername FROM zno_data) AS t
        LEFT JOIN locations_info
        ON t.geoptregname = locations_info.region_name AND
           t.geoptareaname = locations_info.area_name AND
           t.geopttername = locations_info.territory_name
        WHERE location_id IS NOT NULL) as tt
    LEFT JOIN schools_info
    ON tt.location_id = schools_info.location_id AND
       tt.geoptname = schools_info.name
    WHERE school_id IS NULL AND tt.geoptname IS NOT NULL;
