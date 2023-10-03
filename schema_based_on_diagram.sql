CREATE TABLE patients (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
    id SERIAL NOT NULL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id),
    admitted_at timestamp NOT NULL,
    status VARCHAR(60) NOT NULL
);

CREATE TABLE invoices(
    id SERIAL NOT NULL PRIMARY KEY,
    total_amount DECIMAL(10,2) NOT NULL,
    generated_at timestamp NOT NULL,
    payed_at timestamp NOT NULL,
    medical_history_id INTEGER NOT NULL REFERENCES medical_histories(id)
);

