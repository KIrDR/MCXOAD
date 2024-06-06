-- Создание таблиц

CREATE TABLE "Specializations" (
    "id" INT NOT NULL,
    "spec_kode" NVARCHAR(255) NOT NULL,
    "faculty_id" INT NOT NULL,
    "department_id" INT NOT NULL,
    "fullName" NVARCHAR(255) NOT NULL,
    "shortName" NVARCHAR(255) NOT NULL
);

ALTER TABLE "Specializations" ADD CONSTRAINT "specializations_id_primary" PRIMARY KEY ("id");

CREATE UNIQUE INDEX "specialization" ON "Specializations" ("spec_kode");

CREATE TABLE "teachers_salary" (
    "id" INT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "work_time" INT NOT NULL,
    "salary" INT NOT NULL,
    "teacher_id" INT NOT NULL
);

ALTER TABLE "teachers_salary" ADD CONSTRAINT "teachers_salary_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Groups" (
    "id" INT NOT NULL,
    "faculty_id" INT NOT NULL,
    "group_name" NVARCHAR(255) NOT NULL,
    "curator" INT NOT NULL
);

ALTER TABLE "Groups" ADD CONSTRAINT "groups_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Subjects" (
    "id" INT NOT NULL,
    "departnemt_id" INT NOT NULL,
    "fullName" NVARCHAR(255) NOT NULL,
    "shortName" NVARCHAR(255) NOT NULL,
    "amount_of_hours" INT NOT NULL
);

ALTER TABLE "Subjects" ADD CONSTRAINT "subjects_id_primary" PRIMARY KEY ("id");

CREATE UNIQUE INDEX "subjects_fullname_unique" ON "Subjects" ("fullName");
CREATE UNIQUE INDEX "subjects_shortname_unique" ON "Subjects" ("shortName");

CREATE TABLE "Students" (
    "student_number" INT NOT NULL,
    "group_id" INT NOT NULL,
    "Name" NVARCHAR(255) NOT NULL,
    "Surname" NVARCHAR(255) NOT NULL,
    "patronymic" NVARCHAR(255) NOT NULL,
    "department_id" INT NOT NULL,
    "faculty_id" INT NOT NULL,
    "specialization_id" INT NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "date_of_admission" DATE NOT NULL,
    "date_of_expulsion" DATE NOT NULL
);

ALTER TABLE "Students" ADD CONSTRAINT "students_id_primary" PRIMARY KEY ("student_number");

CREATE TABLE "Facultes" (
    "id" INT NOT NULL,
    "faculty_shortName" NVARCHAR(255) NOT NULL,
    "fullName" NVARCHAR(255) NOT NULL
);

ALTER TABLE "Facultes" ADD CONSTRAINT "facultes_id_primary" PRIMARY KEY ("id");

CREATE TABLE "grades" (
    "id" INT NOT NULL,
    "subject_id" INT NOT NULL,
    "student_number" INT NOT NULL,
    "grade" INT NOT NULL,
    "exam_date" DATE NOT NULL,
    "teacher_number" INT NOT NULL
);

ALTER TABLE "grades" ADD CONSTRAINT "grades_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Department" (
    "id" INT NOT NULL,
    "faculty_id" INT NOT NULL,
    "fullName" NVARCHAR(255) NOT NULL,
    "shortName" NVARCHAR(255) NOT NULL
);

ALTER TABLE "Department" ADD CONSTRAINT "department_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Classes" (
    "id" INT NOT NULL,
    "subject_id" INT NOT NULL,
    "teacher_id" INT NOT NULL,
    "group_id" INT NOT NULL,
    "date" DATETIME2 NOT NULL
);

ALTER TABLE "Classes" ADD CONSTRAINT "classes_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Teachers" (
    "teacher_number" INT NOT NULL,
    "Name" NVARCHAR(255) NOT NULL,
    "Surname" NVARCHAR(255) NOT NULL,
    "Patronymic" NVARCHAR(255) NOT NULL,
    "Departmetn_id" INT NOT NULL,
    "date_of_birth" DATE NOT NULL
);

ALTER TABLE "Teachers" ADD CONSTRAINT "teachers_id_primary" PRIMARY KEY ("teacher_number");

CREATE TABLE "scholarship" (
    "id" INT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "scholarship" INT NOT NULL,
    "student_id" INT NOT NULL
);

ALTER TABLE "scholarship" ADD CONSTRAINT "scholarship_id_primary" PRIMARY KEY ("id");

CREATE TABLE "Study_plan" (
    "id" INT NOT NULL,
    "Specialization" NVARCHAR(255) NOT NULL,
    "Department_id" INT NOT NULL,
    "Faculty_id" INT NOT NULL,
    "semester_number" INT NOT NULL,
    "subject_id" INT NOT NULL,
    "hours" INT NOT NULL,
    "subj_name" NVARCHAR(255) NOT NULL
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




CREATE VIEW StudentGradesView AS
SELECT
    S."student_number" AS "StudentNumber",
    S."Name" AS "StudentName",
    S."Surname" AS "StudentSurname",
    G."subject_id" AS "SubjectID",
    G."grade" AS "Grade"
FROM "Students" S
JOIN "grades" G ON S."student_number" = G."student_number";

CREATE VIEW TeacherScheduleView AS
SELECT
    T."teacher_number" AS "TeacherNumber",
    T."Name" AS "TeacherName",
    T."Surname" AS "TeacherSurname",
    C."date" AS "ClassDate",
    C."subject_id" AS "SubjectID",
    G."group_id" AS "GroupID"
FROM "Teachers" T
JOIN "Classes" C ON T."teacher_number" = C."teacher_id"
JOIN "Groups" G ON C."group_id" = G."id";


CREATE VIEW StudentGradesView AS
SELECT
    S.student_number AS StudentNumber,
    S.Name AS StudentName,
    S.Surname AS StudentSurname,
    G.subject_id AS SubjectID,
    G.grade AS Grade
FROM Students S
JOIN grades G ON S.student_number = G.student_number;


CREATE VIEW TeacherScheduleView AS
SELECT
    T.teacher_number AS TeacherNumber,
    T.Name AS TeacherName,
    T.Surname AS TeacherSurname,
    C.date AS ClassDate,
    C.subject_id AS SubjectID,
    G.id AS GroupID
FROM Teachers T
JOIN Classes C ON T.teacher_number = C.teacher_id
JOIN Groups G ON C.group_id = G.id;


CREATE OR REPLACE PROCEDURE InsertFaculty(
    p_id IN NUMBER,
    p_shortName IN NVARCHAR2,
    p_fullName IN NVARCHAR2
)
AS
BEGIN
    INSERT INTO "Facultes" ("id", "faculty_shortName", "fullName")
    VALUES (p_id, p_shortName, p_fullName);
    COMMIT;
END InsertFaculty;
/
CREATE OR REPLACE PROCEDURE InsertSpecialization(
    p_id IN NUMBER,
    p_spec_kode IN NVARCHAR2,
    p_faculty_id IN NUMBER,
    p_department_id IN NUMBER,
    p_fullName IN NVARCHAR2,
    p_shortName IN NVARCHAR2
)
AS
BEGIN
    INSERT INTO "Specializations" ("id", "spec_kode", "faculty_id", "department_id", "fullName", "shortName")
    VALUES (p_id, p_spec_kode, p_faculty_id, p_department_id, p_fullName, p_shortName);
    COMMIT;
END InsertSpecialization;
/
CREATE OR REPLACE PROCEDURE InsertTeacher(
    p_teacher_number IN NUMBER,
    p_name IN NVARCHAR2,
    p_surname IN NVARCHAR2,
    p_patronymic IN NVARCHAR2,
    p_department_id IN NUMBER,
    p_date_of_birth IN DATE
)
AS
BEGIN
    INSERT INTO "Teachers" ("teacher_number", "Name", "Surname", "Patronymic", "Departmetn_id", "date_of_birth")
    VALUES (p_teacher_number, p_name, p_surname, p_patronymic, p_department_id, p_date_of_birth);
    COMMIT;
END InsertTeacher;
/

CREATE PROCEDURE InsertFaculty
    @id INT,
    @faculty_shortName NVARCHAR(255),
    @fullName NVARCHAR(255)
AS
BEGIN
    INSERT INTO Facultes (id, faculty_shortName, fullName)
    VALUES (@id, @faculty_shortName, @fullName);
END;

CREATE PROCEDURE InsertSpecialization
    @id INT,
    @spec_kode NVARCHAR(255),
    @faculty_id INT,
    @department_id INT,
    @fullName NVARCHAR(255),
    @shortName NVARCHAR(255)
AS
BEGIN
    INSERT INTO Specializations (id, spec_kode, faculty_id, department_id, fullName, shortName)
    VALUES (@id, @spec_kode, @faculty_id, @department_id, @fullName, @shortName);
END;

CREATE PROCEDURE InsertTeacher
    @teacher_number INT,
    @Name NVARCHAR(255),
    @Surname NVARCHAR(255),
    @Patronymic NVARCHAR(255),
    @Departmetn_id INT,
    @date_of_birth DATE
AS
BEGIN
    INSERT INTO Teachers (teacher_number, Name, Surname, Patronymic, Departmetn_id, date_of_birth)
    VALUES (@teacher_number, @Name, @Surname, @Patronymic, @Departmetn_id, @date_of_birth);
END;
