-- Add new column to `students` table, + create FK
ALTER TABLE students
    ADD COLUMN am_school_id INTEGER NULL,
	ADD CONSTRAINT fk_am_school_id FOREIGN KEY (am_school_id) REFERENCES schools(school_id);




