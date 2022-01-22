DROP DATABASE medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db;

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    insurance TEXT,
    dob DATE NOT NULL
);

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors,
    patient_id INT REFERENCES patients,
    date DATE NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INT REFERENCES visits,
    disease_id INT REFERENCES diseases
);

INSERT INTO patients (name, insurance, dob)
    VALUES
    ('Elijah Rye', 'Anthem Blue Cross', '2020-12-06'),
    ('Peter Bedrosian', 'United Health Care', '1993-09-20');

INSERT INTO doctors (name)
    VALUES
    ('Nathan Daniels'),
    ('Amanda Daniels');

INSERT INTO diseases (name)
    VALUES
    ('Corona Virus COVID-19'),
    ('Spanish Flu');

INSERT INTO visits (doctor_id, patient_id, date)
    VALUES
    (1, 1, '2022-01-04'),
    (2, 1, '2022-01-06'),
    (1, 2, '2022-02-16');

INSERT INTO diagnoses (visit_id, disease_id)
    VALUES
    (1, 1),
    (2, 1),
    (3, 2);