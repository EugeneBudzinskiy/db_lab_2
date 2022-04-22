INSERT INTO schools_info (location_id, name)
    SELECT tt.location_id, tt.fraptname FROM
    (SELECT locations_info.location_id, t.fraptname FROM
        (SELECT DISTINCT fraptname, fraptregname, fraptareaname, frapttername FROM zno_data) AS t
        LEFT JOIN locations_info
        ON t.fraptregname = locations_info.region_name AND
           t.fraptareaname = locations_info.area_name AND
           t.frapttername = locations_info.territory_name
        WHERE location_id IS NOT NULL) as tt
    LEFT JOIN schools_info
    ON tt.location_id = schools_info.location_id AND
       tt.fraptname = schools_info.name
    WHERE school_id IS NULL AND tt.fraptname IS NOT NULL;
