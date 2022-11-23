INSERT INTO person (first_name,last_name,person_number,phone,email,street,postal_code,city)
VALUES
  ('purus.','est,','1-SSN','(210) 208-8399','pretium.aliquet@hotmail.couk','616-4225 Mauris Road','855811','Semarang'),
  ('ligula.','vel','2-SSN','1-945-433-2816','nam.interdum@icloud.org','304-7376 Egestas. Ave','84874','Donetsk'),
  ('elementum','velit.','3-SSN','1-558-361-6443','sed.nulla.ante@protonmail.ca','Ap #487-4886 Enim, St.','805838','Hebei'),
  ('Mauris','nulla.','4-SSN','(608) 841-4398','cras.pellentesque@aol.org','Ap #232-7754 Duis St.','55114','Oslo'),
  ('Proin','massa','5-SSN','(165) 416-8381','elit.pretium@protonmail.ca','1797 Mattis Avenue','74122','Saravena'),
  ('someContact.','jackville,','6-SSN','(210) 208-8394','jackville@hotmail.couk','616-4225 Mauris Street','85511','Austria');

INSERT INTO instructor (person_id)
VALUES
  (1),
  (2);

INSERT INTO student (person_id)
VALUES
  (3),
  (4),
  (5);

INSERT INTO activity_type (activity_type_name,minimum_students, maximum_students)
VALUES
  ('individual',1,1),
  ('group',5,15),
  ('ensemble',7,12);

INSERT INTO skill_level (skill_level_name)
VALUES
  ('beginner'),
  ('intermediate'),
  ('advanced');

INSERT INTO instrument_type (type_name)
VALUES
  ('keyboard'),
  ('string'),
  ('percussion'),
  ('woodwind'),
  ('brass');

INSERT INTO genre (genre_name)
VALUES
  ('rock'),
  ('pop'),
  ('classical'),
  ('jazz'),
  ('disco');

INSERT INTO brand (brand_name)
VALUES
  ('steinway'),
  ('yamaha'),
  ('shure'),
  ('sennheiser');

INSERT INTO instrument (name,instrument_type_id)
VALUES
  ('piano',1),
  ('guitar',2),
  ('drums',3),
  ('saxophone',4),
  ('flute',4);

INSERT INTO activity_fee (skill_level_id,activity_type_id,fee)
VALUES
  (1,1,100),
  (1,2,200),
  (1,3,300),
  (2,1,400),
  (2,2,500),
  (2,3,600),
  (3,1,700),
  (3,2,800),
  (3,3,900);

INSERT INTO instructor_payment (activity_fee_id,payment)
VALUES
  (1,100),
  (2,200),
  (3,300),
  (4,400),
  (5,500),
  (6,600),
  (7,700),
  (8,800),
  (9,900);

INSERT INTO student_sibling (student_id, sibling_id)
VALUES
  (1,2),
  (2,1);

INSERT INTO school_activity (instructor_id,skill_level_id,activity_type_id,genre_id,activity_fee_id,instructor_payment_id,date_and_time,duration_in_minutes)
VALUES
  (1,1,2,NULL,2,2,'2022-12-20 17:30:00',90),
  (1,2,2,NULL,5,5,'2022-12-16 15:00:00',120),
  (2,3,1,NULL,7,7,'2022-12-12 12:00:00',80),
  (2,1,1,NULL,1,1,'2022-12-08 17:00:00',60);

INSERT INTO rental_item (instrument_id, brand_id, rental_fee)
VALUES
  (1,2, 1500),
  (1,1, 7500);

INSERT INTO instrument_rental (rental_item_id, date_and_time, student_id, duration_in_months)
VALUES
  (1,'2022-12-03 13:30:00', 1, 6);

INSERT INTO student_application (instrument_id,skill_level_id,email)
VALUES
  (4,1,'ut.pellentesque@outlook.net'),
  (3,3,'magna@google.couk'),
  (5,2,'facilisis.non@outlook.org'),
  (3,3,'a.nunc.in@google.com'),
  (2,1,'nec.tellus@yahoo.edu');
  
  
INSERT INTO school_activity_instrument (school_activity_id,instrument_id)
VALUES
  (1,1),
  (2,3),
  (3,2),
  (4,4);

INSERT INTO student_school_activity (school_activity_id,student_id)
VALUES
  (1,1),
  (1,2),
  (2,2),
  (2,3),
  (2,1),
  (3,1),
  (4,3);

INSERT INTO instructor_instrument (instrument_id, instructor_id)
VALUES
  (1,1),
  (2,1),
  (3,1),
  (4,1),
  (5,1),
  (1,2),
  (2,2),
  (3,2),
  (4,2);

INSERT INTO student_contact_person (student_id, person_id)
VALUES
  (1,6);

