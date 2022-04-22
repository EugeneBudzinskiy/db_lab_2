CREATE TABLE schools_info (
    school_id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    location_id INT NULL,
    name CHAR(512) NULL,
    type CHAR(100) NULL,
    parent_name CHAR(256) NULL,
    FOREIGN KEY (location_id) REFERENCES locations_info(location_id)
);