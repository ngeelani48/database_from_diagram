/* Database schema to keep the structure of entire database. */

CREATE TABLE "Invoices" (
  "id" bigserial,
  "total_amount" decimal,
  "generated_at" timestamp,
  "payed_at" timestamp,
  "medical_history_id" int,
  PRIMARY KEY ("id")
  CONSTRAINT "FK_Invoices.medical_history_id"
    FOREIGN KEY ("medical_history_id")
      REFERENCES "medical_histories"("id"),
);

CREATE TABLE "Treatment" (
  "id" bigserial,
  "type" varchar(100),
  "name" varchar(150),
  PRIMARY KEY ("id")
);

CREATE TABLE "Invoice_items" (
  "id" bigserial,
  "unit_price" decimal,
  "quantity" int,
  "total_price" decimal,
  "invoice_id" int,
  "treatment_id" int,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Invoice_items.invoice_id"
    FOREIGN KEY ("invoice_id")
      REFERENCES "Invoices"("id"),
  CONSTRAINT "FK_Invoice_items.treatment_id"
    FOREIGN KEY ("treatment_id")
      REFERENCES "Treatment"("id")
);

CREATE TABLE "Patients" (
  "id" bigserial,
  "name" varchar(150),
  "date_of_birth" date,
  PRIMARY KEY ("id")
);


CREATE TABLE "Medical_histories" (
  "id" bigserial,
  "admitted_at" timestamp,
  "patient_id" int,
  "status" varchar(50),
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Medical_histories.patient_id"
    FOREIGN KEY ("patient_id")
      REFERENCES "Patients"("id")
);

CREATE TABLE "Treatment_histories" (
  "medical_histories_id" int,
  "treatment_id" int,
    CONSTRAINT "FK_Treatment_histories.medical_histories_id"
    FOREIGN KEY ("medical_histories_id")
      REFERENCES "Medical_histories"("id"),
    CONSTRAINT "FK_Treatment_histories.treatment_id"
    FOREIGN KEY ("treatment_id")
      REFERENCES "Treatment"("id"),
);

