INSERT INTO schools_info (location_id, name)
    SELECT tt.location_id, tt.spaptname FROM
    (SELECT locations_info.location_id, t.spaptname FROM
        (SELECT DISTINCT spaptname, spaptregname, spaptareaname, spapttername FROM zno_data) AS t
        LEFT JOIN locations_info
        ON t.spaptregname = locations_info.region_name AND
           t.spaptareaname = locations_info.area_name AND
           t.spapttername = locations_info.territory_name
        WHERE location_id IS NOT NULL) as tt
    LEFT JOIN schools_info
    ON tt.location_id = schools_info.location_id AND
       tt.spaptname = schools_info.name
    WHERE school_id IS NULL AND tt.spaptname IS NOT NULL;
