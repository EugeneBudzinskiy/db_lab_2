INSERT INTO schools_info (location_id, name)
    SELECT tt.location_id, tt.histptname FROM
    (SELECT locations_info.location_id, t.histptname FROM
        (SELECT DISTINCT histptname, histptregname, histptareaname, histpttername FROM zno_data) AS t
        LEFT JOIN locations_info
        ON t.histptregname = locations_info.region_name AND
           t.histptareaname = locations_info.area_name AND
           t.histpttername = locations_info.territory_name
        WHERE location_id IS NOT NULL) as tt
    LEFT JOIN schools_info
    ON tt.location_id = schools_info.location_id AND
       tt.histptname = schools_info.name
    WHERE school_id IS NULL AND tt.histptname IS NOT NULL;
