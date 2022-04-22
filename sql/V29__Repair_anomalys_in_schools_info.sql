DELETE FROM schools_info WHERE school_id IN
    (SELECT school_id FROM (SELECT *, row_number() OVER
        (PARTITION BY location_id, name ORDER BY length(parent_name), length(type) DESC) AS r
        FROM schools_info) AS t WHERE t.r != 1);
