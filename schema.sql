/* Database schema to keep the structure of entire database. */

CREATE TABLE "Invoices" (
  "id" bigserial,
  "total_amount" decimal,
  "generated_at" timestamp,
  "payed_at" timestamp,
  "medical_history_id" int,
  PRIMARY KEY ("id")
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

