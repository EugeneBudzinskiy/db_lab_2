INSERT INTO schools_info (location_id, name)
    SELECT tt.location_id, tt.engptname FROM
    (SELECT locations_info.location_id, t.engptname FROM
        (SELECT DISTINCT engptname, engptregname, engptareaname, engpttername FROM zno_data) AS t
        LEFT JOIN locations_info
        ON t.engptregname = locations_info.region_name AND
           t.engptareaname = locations_info.area_name AND
           t.engpttername = locations_info.territory_name
        WHERE location_id IS NOT NULL) as tt
    LEFT JOIN schools_info
    ON tt.location_id = schools_info.location_id AND
       tt.engptname = schools_info.name
    WHERE school_id IS NULL AND tt.engptname IS NOT NULL;
