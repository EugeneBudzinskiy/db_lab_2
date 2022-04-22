CREATE TABLE locations_info (
    location_id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    region_name CHAR(256) NULL,
    area_name CHAR(256) NULL,
    territory_name CHAR(256) NULL,
    territory_type CHAR(100) NULL
);