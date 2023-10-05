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

CREATE TABLE treatments (
    id SERIAL NOT NULL PRIMARY KEY,
    type VARCHAR(60),
    name VARCHAR(60)
);

CREATE TABLE invoice_items (
    id SERIAL NOT NULL PRIMARY KEY,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INTEGER NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    invoice_id INTEGER REFERENCES invoices(id),
    treatment_id INTEGER REFERENCES treatments(id)
);

CREATE TABLE medical_histories_treatments (
    PRIMARY KEY (medical_histories_id, treatments_id),
    medical_histories_id INTEGER REFERENCES medical_histories(id),
    treatments_id INTEGER REFERENCES treatments(id)
);

-- Indexes
CREATE INDEX idx_patient_id ON medical_histories(patient_id);
CREATE INDEX idx_medical_history_id ON invoices(medical_history_id);
CREATE INDEX idx_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_treatment_id ON invoice_items(treatment_id);
CREATE INDEX idx_medical_histories_id ON medical_histories_treatments(medical_histories_id);
CREATE INDEX idx_treatments_id ON medical_histories_treatments(treatments_id);
