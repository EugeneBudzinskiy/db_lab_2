INSERT INTO schools_info (location_id, name)
    SELECT tt.location_id, tt.mathptname FROM
    (SELECT locations_info.location_id, t.mathptname FROM
        (SELECT DISTINCT mathptname, mathptregname, mathptareaname, mathpttername FROM zno_data) AS t
        LEFT JOIN locations_info
        ON t.mathptregname = locations_info.region_name AND
           t.mathptareaname = locations_info.area_name AND
           t.mathpttername = locations_info.territory_name
        WHERE location_id IS NOT NULL) as tt
    LEFT JOIN schools_info
    ON tt.location_id = schools_info.location_id AND
       tt.mathptname = schools_info.name
    WHERE school_id IS NULL AND tt.mathptname IS NOT NULL;
