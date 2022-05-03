INSERT INTO schools (location_id, name)
    SELECT t2.location_id, t2.hist_pt_name FROM
    (SELECT locations.location_id, t1.hist_pt_name FROM
        (SELECT DISTINCT hist_pt_name, hist_pt_region_name,
                         hist_pt_area_name, hist_pt_territory_name FROM students) AS t1
        LEFT JOIN locations
        ON t1.hist_pt_region_name = locations.region_name AND
           t1.hist_pt_area_name = locations.area_name AND
           t1.hist_pt_territory_name = locations.territory_name
        WHERE location_id IS NOT NULL) as t2
    LEFT JOIN schools
    ON t2.location_id = schools.location_id AND
       t2.hist_pt_name = schools.name
    WHERE school_id IS NULL AND t2.hist_pt_name IS NOT NULL;


