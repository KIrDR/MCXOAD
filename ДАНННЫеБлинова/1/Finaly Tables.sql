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
    "student_number" NUMBER NOT NULL,
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

ALTER TABLE "Students" ADD CONSTRAINT "students_id_primary" PRIMARY KEY ("student_number");

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
    "grade" NUMBER NOT NULL,
    "exam_date" DATE NOT NULL,
    "teacher_number" NUMBER NOT NULL
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
    "teacher_number" NUMBER NOT NULL,
    "Name" NVARCHAR2(255) NOT NULL,
    "Surname" NVARCHAR2(255) NOT NULL,
    "Patronymic" NVARCHAR2(255) NOT NULL,
    "Departmetn_id" NUMBER NOT NULL,
    "date_of_birth" DATE NOT NULL
);

ALTER TABLE "Teachers" ADD CONSTRAINT "teachers_id_primary" PRIMARY KEY ("teacher_number");


CREATE TABLE "scholarship" (
    "id" NUMBER NOT NULL,
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



-- Внешний ключ для связи "Specializations" -> "Facultes"
ALTER TABLE "Specializations"
ADD CONSTRAINT fk_specializations_faculty
FOREIGN KEY ("faculty_id")
REFERENCES "Facultes" ("id");

-- Внешний ключ для связи "Specializations" -> "Department"
ALTER TABLE "Specializations"
ADD CONSTRAINT fk_specializations_department
FOREIGN KEY ("department_id")
REFERENCES "Department" ("id");

-- Внешний ключ для связи "teachers_salary" -> "Teachers"
ALTER TABLE "teachers_salary"
ADD CONSTRAINT fk_teachers_salary_teacher
FOREIGN KEY ("teacher_id")
REFERENCES "Teachers" ("teacher_number");

-- Внешний ключ для связи "Groups" -> "Facultes"
ALTER TABLE "Groups"
ADD CONSTRAINT fk_groups_faculty
FOREIGN KEY ("faculty_id")
REFERENCES "Facultes" ("id");

-- Внешний ключ для связи "Subjects" -> "Department"
ALTER TABLE "Subjects"
ADD CONSTRAINT fk_subjects_department
FOREIGN KEY ("departnemt_id")
REFERENCES "Department" ("id");

-- Внешний ключ для связи "Students" -> "Groups"
ALTER TABLE "Students"
ADD CONSTRAINT fk_students_group
FOREIGN KEY ("group_id")
REFERENCES "Groups" ("id");

-- Внешний ключ для связи "Students" -> "Department"
ALTER TABLE "Students"
ADD CONSTRAINT fk_students_department
FOREIGN KEY ("department_id")
REFERENCES "Department" ("id");

-- Внешний ключ для связи "Students" -> "Faculty"
ALTER TABLE "Students"
ADD CONSTRAINT fk_students_faculty
FOREIGN KEY ("faculty_id")
REFERENCES "Facultes" ("id");

-- Внешний ключ для связи "Students" -> "Specializations"
ALTER TABLE "Students"
ADD CONSTRAINT fk_students_specializations
FOREIGN KEY ("specialization_id")
REFERENCES "Specializations" ("id");

-- Внешний ключ для связи "grades" -> "Subjects"
ALTER TABLE "grades"
ADD CONSTRAINT fk_grades_subject
FOREIGN KEY ("subject_id")
REFERENCES "Subjects" ("id");

-- Внешний ключ для связи "grades" -> "Students"
ALTER TABLE "grades"
ADD CONSTRAINT fk_grades_student
FOREIGN KEY ("student_number")
REFERENCES "Students" ("student_number");

-- Внешний ключ для связи "grades" -> "Teachers"
ALTER TABLE "grades"
ADD CONSTRAINT fk_grades_teacher
FOREIGN KEY ("teacher_number")
REFERENCES "Teachers" ("teacher_number");

-- Внешний ключ для связи "Department" -> "Faculty"
ALTER TABLE "Department"
ADD CONSTRAINT fk_department_faculty
FOREIGN KEY ("faculty_id")
REFERENCES "Facultes" ("id");

-- Внешний ключ для связи "Classes" -> "Subjects"
ALTER TABLE "Classes"
ADD CONSTRAINT fk_classes_subject
FOREIGN KEY ("subject_id")
REFERENCES "Subjects" ("id");

-- Внешний ключ для связи "Classes" -> "Teachers"
ALTER TABLE "Classes"
ADD CONSTRAINT fk_classes_teacher
FOREIGN KEY ("teacher_id")
REFERENCES "Teachers" ("teacher_number");

-- Внешний ключ для связи "Classes" -> "Groups"
ALTER TABLE "Classes"
ADD CONSTRAINT fk_classes_group
FOREIGN KEY ("group_id")
REFERENCES "Groups" ("id");

-- Внешний ключ для связи "Teachers" -> "Department"
ALTER TABLE "Teachers"
ADD CONSTRAINT fk_teachers_department
FOREIGN KEY ("Departmetn_id")
REFERENCES "Department" ("id");

-- Внешний ключ для связи "scholarship" -> "Students"
ALTER TABLE "scholarship"
ADD CONSTRAINT fk_scholarship_student
FOREIGN KEY ("student_id")
REFERENCES "Students" ("student_number");

-- Внешний ключ для связи "Study_plan" -> "Department"
ALTER TABLE "Study_plan"
ADD CONSTRAINT fk_study_plan_department
FOREIGN KEY ("Department_id")
REFERENCES "Department" ("id");

-- Внешний ключ для связи "Study_plan" -> "Faculty"
ALTER TABLE "Study_plan"
ADD CONSTRAINT fk_study_plan_faculty
FOREIGN KEY ("Faculty_id")
REFERENCES "Facultes" ("id");

-- Внешний ключ для связи "Study_plan" -> "Subjects"
ALTER TABLE "Study_plan"
ADD CONSTRAINT fk_study_plan_subject
FOREIGN KEY ("subject_id")
REFERENCES "Subjects" ("id");


















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






CREATE VIEW StudentGrades AS
SELECT
    S."id" AS StudentID,
    S."Name" AS StudentName,
    S."Surname" AS StudentSurname,
    G."subject_id" AS SubjectID,
    G."grade" AS StudentGrade
FROM "Students" S
JOIN "grades" G ON S."Student_number" = G."student_number";



CREATE VIEW TeacherSalaries AS
SELECT
    T."id" AS TeacherID,
    T."Name" AS TeacherName,
    T."Surname" AS TeacherSurname,
    TS."salary" AS TeacherSalary
FROM "Teachers" T
JOIN "teachers_salary" TS ON T."teacher_number" = TS."teacher_id";

select * from "Teachers";

CREATE VIEW GroupStudents AS
SELECT
    g."id" AS GroupID,
    G."group_name" AS GroupName,
    S."id" AS StudentID,
    S."Name" AS StudentName,
    S."Surname" AS StudentSurname
FROM "Groups" G
JOIN "Students" S ON G."id" = S."group_id";





CREATE INDEX idx_grades_SubjectID ON "grades"("subject_id");
CREATE INDEX idx_teachers_salary_StartDate ON "teachers_salary"("start_date");
CREATE INDEX idx_scholarship_StudentID ON "scholarship"("student_id");
CREATE INDEX idx_scholarship_StartDate ON "scholarship"("start_date");
CREATE INDEX idx_Classes_TeacherID ON "Classes"("teacher_id");
CREATE INDEX idx_Classes_Date ON "Classes"("date");

CREATE SEQUENCE student_ticket_number_sequence
  START WITH 288673
  INCREMENT BY 1
  MAXVALUE 999999
  ;




CREATE SEQUENCE teachers_number_sequenc
  START WITH 300000
  INCREMENT BY 1
  MAXVALUE 999999;




