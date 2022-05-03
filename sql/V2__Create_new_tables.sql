--
-- Create new tables
--

CREATE TABLE locations (
    location_id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    region_name CHAR(64) NULL,
    area_name CHAR(64) NULL,
    territory_name CHAR(64) NULL,
    territory_type CHAR(32) NULL
);

CREATE TABLE schools (
    school_id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    location_id INTEGER NULL,
    name CHAR(256) NULL,
    type CHAR(64) NULL,
    parent_name CHAR(256) NULL,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);


CREATE TABLE tests (
    student_id CHAR(64) NOT NULL,
    school_id INTEGER NULL,
    name CHAR(32) NOT NULL,
    status CHAR(20) NULL,
    score_200 REAL NULL,
	score_12 REAL NULL,
	score REAL NULL,
	lang CHAR(16) NULL,
    dpa_level CHAR(24) NULL,
	adapt_scale INTEGER NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
	FOREIGN KEY (school_id) REFERENCES schools(school_id)
);


