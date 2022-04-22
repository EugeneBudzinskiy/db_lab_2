INSERT INTO schools_info (location_id, name)
    SELECT tt.location_id, tt.bioptname FROM
    (SELECT locations_info.location_id, t.bioptname FROM
        (SELECT DISTINCT bioptname, bioptregname, bioptareaname, biopttername FROM zno_data) AS t
        LEFT JOIN locations_info
        ON t.bioptregname = locations_info.region_name AND
           t.bioptareaname = locations_info.area_name AND
           t.biopttername = locations_info.territory_name
        WHERE location_id IS NOT NULL) as tt
    LEFT JOIN schools_info
    ON tt.location_id = schools_info.location_id AND
       tt.bioptname = schools_info.name
    WHERE school_id IS NULL AND tt.bioptname IS NOT NULL;
