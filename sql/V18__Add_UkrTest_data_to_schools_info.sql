INSERT INTO schools_info (location_id, name)
    SELECT tt.location_id, tt.ukrptname FROM
    (SELECT locations_info.location_id, t.ukrptname FROM
        (SELECT DISTINCT ukrptname, ukrptregname, ukrptareaname, ukrpttername FROM zno_data) AS t
        LEFT JOIN locations_info
        ON t.ukrptregname = locations_info.region_name AND
           t.ukrptareaname = locations_info.area_name AND
           t.ukrpttername = locations_info.territory_name
        WHERE location_id IS NOT NULL) as tt
    LEFT JOIN schools_info
    ON tt.location_id = schools_info.location_id AND
       tt.ukrptname = schools_info.name
    WHERE school_id IS NULL AND tt.ukrptname IS NOT NULL;
