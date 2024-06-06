CREATE TABLE "Specializations" (
    "id" NUMBER NOT NULL,
    "spec_kode" NVARCHAR2(255) NOT NULL,
    "faculty_id" NUMBER NOT NULL,
    "department_id" NUMBER NOT NULL,
    "fullName" NVARCHAR2(255) NOT NULL,
    "shortName" NVARCHAR2(255) NOT NULL
);

ALTER TABLE "Specializations" ADD CONSTRAINT "specializations_id_primary" PRIMARY KEY ("id");

CREATE UNIQUE INDEX "specialization" ON "Specializations" ("spec_kode");

CREATE TABLE "teachers_salary" (
    "id" NUMBER NOT NULL,
    "accountant_id" NUMBER NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "work_time" NUMBER NOT NULL,
    "salary" NUMBER NOT NULL,
    "teacher_id" NUMBER NOT NULL
);

ALTER TABLE "teachers_salary" ADD CONSTRAINT "teachers_salary_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Groups" (
    "id" NUMBER NOT NULL,
    "faculty_id" NUMBER NOT NULL,
    "group_name" NVARCHAR2(255) NOT NULL,
    "curator" NUMBER NOT NULL
);

ALTER TABLE "Groups" ADD CONSTRAINT "groups_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Subjects" (
    "id" NUMBER NOT NULL,
    "departnemt_id" NUMBER NOT NULL,
    "fullName" NVARCHAR2(255) NOT NULL,
    "shortName" NVARCHAR2(255) NOT NULL,
    "amount_of_hours" NUMBER NOT NULL
);

ALTER TABLE "Subjects" ADD CONSTRAINT "subjects_id_primary" PRIMARY KEY ("id");

CREATE UNIQUE INDEX "subjects_fullname_unique" ON "Subjects" ("fullName");
CREATE UNIQUE INDEX "subjects_shortname_unique" ON "Subjects" ("shortName");

CREATE TABLE "Students" (
    "id" NUMBER NOT NULL,
    "Student_number" NUMBER NOT NULL,
    "group_id" NUMBER NOT NULL,
    "Name" NVARCHAR2(255) NOT NULL,
    "Surname" NVARCHAR2(255) NOT NULL,
    "patronymic" NVARCHAR2(255) NOT NULL,
    "department_id" NUMBER NOT NULL,
    "faculty_id" NUMBER NOT NULL,
    "specialization_id" NUMBER NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "date_of_admission" DATE NOT NULL,
    "date_of_expulsion" DATE NOT NULL
);

ALTER TABLE "Students" ADD CONSTRAINT "students_id_primary" PRIMARY KEY ("id");

CREATE UNIQUE INDEX "students_student_number_unique" ON "Students" ("Student_number");

CREATE TABLE "Facultes" (
    "id" NUMBER NOT NULL,
    "faculty_shortName" NVARCHAR2(255) NOT NULL,
    "fullName" NVARCHAR2(255) NOT NULL
);

ALTER TABLE "Facultes" ADD CONSTRAINT "facultes_id_primary" PRIMARY KEY ("id");

CREATE TABLE "grades" (
    "id" NUMBER NOT NULL,
    "subject_id" NUMBER NOT NULL,
    "student_number" NUMBER NOT NULL,
    "student_id" NUMBER NOT NULL,
    "subject_name" NVARCHAR2(255) NOT NULL,
    "grade" NUMBER NOT NULL,
    "exam_date" DATE NOT NULL,
    "teacher_number" NUMBER NOT NULL,
    "teacher_id" NUMBER NOT NULL,
    "teacher_name" NVARCHAR2(255) NOT NULL
);

ALTER TABLE "grades" ADD CONSTRAINT "grades_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Department" (
    "id" NUMBER NOT NULL,
    "faculty_id" NUMBER NOT NULL,
    "fullName" NVARCHAR2(255) NOT NULL,
    "shortName" NVARCHAR2(255) NOT NULL
);

ALTER TABLE "Department" ADD CONSTRAINT "department_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Classes" (
    "id" NUMBER NOT NULL,
    "subject_id" NUMBER NOT NULL,
    "teacher_id" NUMBER NOT NULL,
    "group_id" NUMBER NOT NULL,
    "date" TIMESTAMP NOT NULL
);

ALTER TABLE "Classes" ADD CONSTRAINT "classes_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Teachers" (
    "id" NUMBER NOT NULL,
    "teacher_number" NUMBER NOT NULL,
    "Name" NVARCHAR2(255) NOT NULL,
    "Surname" NVARCHAR2(255) NOT NULL,
    "Patronymic" NVARCHAR2(255) NOT NULL,
    "Departmetn_id" NUMBER NOT NULL,
    "date_of_birth" DATE NOT NULL
);

ALTER TABLE "Teachers" ADD CONSTRAINT "teachers_id_primary" PRIMARY KEY ("id");

CREATE UNIQUE INDEX "teachers_teacher_number_unique" ON "Teachers" ("teacher_number");

CREATE TABLE "scholarship" (
    "id" NUMBER NOT NULL,
    "accountant_id" NUMBER NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "scholarship" NUMBER NOT NULL,
    "student_id" NUMBER NOT NULL
);

ALTER TABLE "scholarship" ADD CONSTRAINT "scholarship_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Study_plan" (
    "id" NUMBER NOT NULL,
    "Specialization" NVARCHAR2(255) NOT NULL,
    "Department_id" NUMBER NOT NULL,
    "Faculty_id" NUMBER NOT NULL,
    "semester_number" NUMBER NOT NULL,
    "subject_id" NUMBER NOT NULL,
    "hours" NUMBER NOT NULL,
    "subj_name" NVARCHAR2(255) NOT NULL
);

-- Создание уникального ключа для столбца "spec_kode" в таблице "Study_plan"
ALTER TABLE "Study_plan" ADD CONSTRAINT "spec_kode_unique" UNIQUE ("Specialization");

-- Создание уникального ключа для столбца "teacher_number" в таблице "grades"
ALTER TABLE "grades" ADD CONSTRAINT "teacher_number_unique" UNIQUE ("teacher_number");

-- Создание уникального ключа для столбца "shortName" в таблице "Subjects"
ALTER TABLE "Subjects" ADD CONSTRAINT "shortName_unique" UNIQUE ("shortName");

-- Создание уникального ключа для столбца "Student_number" в таблице "Students"
ALTER TABLE "Students" ADD CONSTRAINT "Student_number_unique" UNIQUE ("Student_number");

-- Создание уникального ключа для столбца "subj_name" в таблице "Study_plan"
ALTER TABLE "Study_plan" ADD CONSTRAINT "subj_name_unique" UNIQUE ("subj_name");

-- Создание уникального ключа для столбца "some_other_column" в таблице "grades"
ALTER TABLE "grades" ADD CONSTRAINT "some_other_column_unique" UNIQUE ("subject_name");


-- Создание уникального ключа для столбца "student_number" в таблице "grades"
ALTER TABLE "grades" ADD CONSTRAINT "student_number_unique" UNIQUE ("student_number");


ALTER TABLE "Specializations" ADD CONSTRAINT "special_foreign" FOREIGN KEY ("spec_kode") REFERENCES "Study_plan" ("Specialization");

ALTER TABLE "Teachers" ADD CONSTRAINT "teac_foreign" FOREIGN KEY ("teacher_number") REFERENCES "grades" ("teacher_number");

ALTER TABLE "Subjects" ADD CONSTRAINT "subjetname_foreign" FOREIGN KEY ("shortName") REFERENCES "Study_plan" ("subj_name");

ALTER TABLE "Subjects" ADD CONSTRAINT "subjects_s" FOREIGN KEY ("shortName") REFERENCES "grades" ("subject_name");

ALTER TABLE "Students" ADD CONSTRAINT "students_sber_foreign" FOREIGN KEY ("Student_number") REFERENCES "grades" ("student_number");




-- работа с иерархией учителей 

--CREATE TABLE "Teachers" (
--    "id" NUMBER NOT NULL,
--    "teacher_number" NUMBER NOT NULL,
--    "Name" NVARCHAR2(255) NOT NULL,
--    "Surname" NVARCHAR2(255) NOT NULL,
--    "Patronymic" NVARCHAR2(255) NOT NULL,
--   "Departmetn_id" NUMBER NOT NULL,
--    "date_of_birth" DATE NOT NULL
--);



CREATE SEQUENCE teachers_ticket_number_sequence
  START WITH 300000
  INCREMENT BY 1
  MAXVALUE 999999;
  
CREATE SEQUENCE teachersId
  START WITH 1 INCREMENT BY 1
  MAXVALUE 999999;


alter table "Teachers" add "hierarchyIDy" hierarchyid , hierLevel as "hierarchyIDy".ToString() ; 

select * from Teachers; 


insert into Teachers values ( 
NEXT VALUE FOR teachersId,NEXT VALUE FOR teachers_ticket_number_sequence, 'Vera', 'Monika' ,'vitalevna', 1, '12-11-2004', hierarchyid::GetRoot())  



