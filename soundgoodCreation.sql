CREATE TABLE "person"
(
  "person_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "first_name" varchar(100) NOT NULL,
  "last_name" varchar(100) NOT NULL,
  "person_number" varchar(12) NOT NULL UNIQUE,
  "phone" varchar(20),
  "email" varchar(500) NOT NULL,
  "street" varchar(100) NOT NULL,
  "postal_code" varchar(20) NOT NULL,
  "city" varchar(500) NOT NULL
);

CREATE TABLE "instructor"
(
  "instructor_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "person_id" int NOT NULL UNIQUE REFERENCES "person"
);

CREATE TABLE "student"
(
  "student_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "person_id" int NOT NULL UNIQUE REFERENCES "person"
);

CREATE TABLE "activity_type"
(
  "activity_type_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "activity_type_name" varchar(100) NOT NULL UNIQUE,
  "maximum_students" int NOT NULL,
  "minimum_students" int NOT NULL
);

CREATE TABLE "skill_level"
(
  "skill_level_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "skill_level_name" varchar(100) NOT NULL
);
CREATE TABLE "instrument_type"
(
  "instrument_type_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "type_name" varchar(100) NOT NULL
);

CREATE TABLE "genre"
(
  "genre_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "genre_name" varchar(100) NOT NULL
);

CREATE TABLE "brand"
(
  "brand_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "brand_name" varchar(100) NOT NULL
);

CREATE TABLE "instrument"
(
  "instrument_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "instrument_type_id" int NOT NULL REFERENCES "instrument_type"
);

CREATE TABLE "activity_fee"
(
  "activity_fee_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "skill_level_id" int NOT NULL REFERENCES "skill_level",
  "activity_type_id" int NOT NULL REFERENCES "activity_type",
  "fee" DECIMAL(18,5) NOT NULL
);

CREATE TABLE "instructor_payment"
(
  "instructor_payment_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "activity_fee_id" int NOT NULL UNIQUE REFERENCES "activity_fee",
  "payment" DECIMAL(18,5) NOT NULL
);

CREATE TABLE "student_sibling"
(
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "sibling_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  PRIMARY KEY("student_id", "sibling_id")

);

CREATE TABLE "school_activity"
(
  "school_activity_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "instructor_id" int NOT NULL REFERENCES "instructor",
  "activity_type_id" int NOT NULL REFERENCES "activity_type",
  "genre_id" int REFERENCES "genre" ON DELETE CASCADE,
  "skill_level_id" int NOT NULL REFERENCES "skill_level",
  "activity_fee_id" int NOT NULL REFERENCES "activity_fee",
  "instructor_payment_id" int NOT NULL REFERENCES "instructor_payment",
  "date_and_time" timestamp NOT NULL,
  "duration_in_minutes" int NOT NULL
);

CREATE TABLE "rental_item"
(
  "rental_item_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "instrument_id" int NOT NULL REFERENCES "instrument",
  "brand_id" int NOT NULL REFERENCES "brand",
  "rental_fee" DECIMAL(18,5) NOT NULL
);

CREATE TABLE "instrument_rental"
(
  "rental_item_id" int NOT NULL REFERENCES "rental_item",
  "date_and_time" timestamp NOT NULL,
  "student_id" int NOT NULL UNIQUE REFERENCES "student",
  "duration_in_months" int NOT NULL,
  PRIMARY KEY("rental_item_id", "date_and_time")
);

CREATE TABLE "student_application"
(
  "student_application_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "instrument_id" int NOT NULL REFERENCES "instrument",
  "skill_level_id" int NOT NULL REFERENCES "skill_level",
  "email" varchar(500) NOT NULL
);

CREATE TABLE "school_activity_instrument"
(
  "school_activity_id" int NOT NULL REFERENCES "school_activity" ON DELETE CASCADE,
  "instrument_id" int NOT NULL REFERENCES "instrument" ON DELETE CASCADE,
  PRIMARY KEY("school_activity_id", "instrument_id")
);

CREATE TABLE "student_school_activity"
(
  "school_activity_id" int NOT NULL REFERENCES "school_activity" ON DELETE CASCADE,
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  PRIMARY KEY("school_activity_id", "student_id")
);

CREATE TABLE "instructor_instrument"
(
  "instrument_id" int NOT NULL REFERENCES "instrument" ON DELETE CASCADE,
  "instructor_id" int NOT NULL REFERENCES "instructor" ON DELETE CASCADE,
  PRIMARY KEY("instrument_id", "instructor_id")
);

CREATE TABLE "student_contact_person"
(
  "person_id" int NOT NULL REFERENCES "person"  ON DELETE CASCADE,
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  PRIMARY KEY("person_id", "student_id")
);