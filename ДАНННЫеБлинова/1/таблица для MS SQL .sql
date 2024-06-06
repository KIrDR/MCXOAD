CREATE TABLE "Specializations"(
    "id" INT NOT NULL,
    "spec_kode" NVARCHAR(255) NOT NULL,
    "faculty_id" INT NOT NULL,
    "department_id" INT NOT NULL,
    "fullName" NVARCHAR(255) NOT NULL,
    "shortName" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Specializations" ADD CONSTRAINT "specializations_id_primary" PRIMARY KEY("id");
CREATE TABLE "teachers_salary"(
    "id" INT NOT NULL,
    "accountant_id" INT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "work_time" FLOAT NOT NULL,
    "salary" FLOAT NOT NULL,
    "teacher_id" INT NOT NULL
);
ALTER TABLE
    "teachers_salary" ADD CONSTRAINT "teachers_salary_id_primary" PRIMARY KEY("id");
CREATE TABLE "Groups"(
    "id" INT NOT NULL,
    "faculty_id" INT NOT NULL,
    "group_name" NVARCHAR(255) NOT NULL,
    "curator" INT NOT NULL
);
ALTER TABLE
    "Groups" ADD CONSTRAINT "groups_id_primary" PRIMARY KEY("id");
CREATE TABLE "Subjects"(
    "id" INT NOT NULL,
    "departnemt_id" INT NOT NULL,
    "fullName" NVARCHAR(255) NOT NULL,
    "shortName" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Subjects" ADD CONSTRAINT "subjects_id_primary" PRIMARY KEY("id");
CREATE TABLE "Students"(
    "id" INT NOT NULL,
    "Student_number" INT NOT NULL,
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
ALTER TABLE
    "Students" ADD CONSTRAINT "students_id_primary" PRIMARY KEY("id");
CREATE TABLE "Facultes"(
    "id" INT NOT NULL,
    "faculty_shortName" NVARCHAR(255) NOT NULL,
    "fullName" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Facultes" ADD CONSTRAINT "facultes_id_primary" PRIMARY KEY("id");
CREATE TABLE "Library"(
    "id" INT NOT NULL,
    "Autor" NVARCHAR(255) NOT NULL,
    "publication_date" DATE NOT NULL,
    "Name" NVARCHAR(255) NOT NULL,
    "Quantity" INT NOT NULL
);
ALTER TABLE
    "Library" ADD CONSTRAINT "library_id_primary" PRIMARY KEY("id");
CREATE TABLE "Department"(
    "id" INT NOT NULL,
    "faculty_id" INT NOT NULL,
    "fullName" NVARCHAR(255) NOT NULL,
    "shortName" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Department" ADD CONSTRAINT "department_id_primary" PRIMARY KEY("id");
CREATE TABLE "Classes"(
    "id" INT NOT NULL,
    "subject_id" INT NOT NULL,
    "teacher_id" INT NOT NULL,
    "group_id" INT NOT NULL,
    "date" DATETIME NOT NULL
);
ALTER TABLE
    "Classes" ADD CONSTRAINT "classes_id_primary" PRIMARY KEY("id");
CREATE TABLE "Teachers"(
    "id" INT NOT NULL,
    "teacher_number" INT NOT NULL,
    "Name" NVARCHAR(255) NOT NULL,
    "Surname" NVARCHAR(255) NOT NULL,
    "Patronymic" NVARCHAR(255) NOT NULL,
    "Departmetn_id" INT NOT NULL,
    "date_of_birth" DATE NOT NULL
);
ALTER TABLE
    "Teachers" ADD CONSTRAINT "teachers_id_primary" PRIMARY KEY("id");
CREATE TABLE "List_of_issued_books"(
    "id" INT NOT NULL,
    "student_id" INT NOT NULL,
    "book_id" INT NOT NULL,
    "date_of_issued" DATE NOT NULL,
    "return_date" DATE NOT NULL
);
ALTER TABLE
    "List_of_issued_books" ADD CONSTRAINT "list_of_issued_books_id_primary" PRIMARY KEY("id");
CREATE TABLE "scholarship"(
    "id" INT NOT NULL,
    "accountant_id" INT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "scholarship" FLOAT NOT NULL,
    "student_id" INT NOT NULL
);
ALTER TABLE
    "scholarship" ADD CONSTRAINT "scholarship_id_primary" PRIMARY KEY("id");
CREATE TABLE "Accountant"(
    "id" INT NOT NULL,
    "name" NVARCHAR(255) NOT NULL,
    "surname" NVARCHAR(255) NOT NULL,
    "column_4" BIGINT NOT NULL
);
ALTER TABLE
    "Accountant" ADD CONSTRAINT "accountant_id_primary" PRIMARY KEY("id");
ALTER TABLE
    "Teachers" ADD CONSTRAINT "teachers_departmetn_id_foreign" FOREIGN KEY("Departmetn_id") REFERENCES "Department"("id");
ALTER TABLE
    "Department" ADD CONSTRAINT "department_faculty_id_foreign" FOREIGN KEY("faculty_id") REFERENCES "Facultes"("id");
ALTER TABLE
    "teachers_salary" ADD CONSTRAINT "teachers_salary_accountant_id_foreign" FOREIGN KEY("accountant_id") REFERENCES "Accountant"("id");
ALTER TABLE
    "Students" ADD CONSTRAINT "students_group_id_foreign" FOREIGN KEY("group_id") REFERENCES "Groups"("id");
ALTER TABLE
    "Groups" ADD CONSTRAINT "groups_curator_foreign" FOREIGN KEY("curator") REFERENCES "Teachers"("id");
ALTER TABLE
    "List_of_issued_books" ADD CONSTRAINT "list_of_issued_books_student_id_foreign" FOREIGN KEY("student_id") REFERENCES "Students"("id");
ALTER TABLE
    "scholarship" ADD CONSTRAINT "scholarship_student_id_foreign" FOREIGN KEY("student_id") REFERENCES "Students"("id");
ALTER TABLE
    "Classes" ADD CONSTRAINT "classes_teacher_id_foreign" FOREIGN KEY("teacher_id") REFERENCES "Teachers"("id");
ALTER TABLE
    "Students" ADD CONSTRAINT "students_faculty_id_foreign" FOREIGN KEY("faculty_id") REFERENCES "Facultes"("id");
ALTER TABLE
    "Specializations" ADD CONSTRAINT "specializations_department_id_foreign" FOREIGN KEY("department_id") REFERENCES "Department"("id");
ALTER TABLE
    "Classes" ADD CONSTRAINT "classes_group_id_foreign" FOREIGN KEY("group_id") REFERENCES "Groups"("id");
ALTER TABLE
    "List_of_issued_books" ADD CONSTRAINT "list_of_issued_books_book_id_foreign" FOREIGN KEY("book_id") REFERENCES "Library"("id");
ALTER TABLE
    "Classes" ADD CONSTRAINT "classes_subject_id_foreign" FOREIGN KEY("subject_id") REFERENCES "Subjects"("id");
ALTER TABLE
    "scholarship" ADD CONSTRAINT "scholarship_accountant_id_foreign" FOREIGN KEY("accountant_id") REFERENCES "Accountant"("id");
ALTER TABLE
    "Students" ADD CONSTRAINT "students_specialization_id_foreign" FOREIGN KEY("specialization_id") REFERENCES "Specializations"("id");
ALTER TABLE
    "Specializations" ADD CONSTRAINT "specializations_faculty_id_foreign" FOREIGN KEY("faculty_id") REFERENCES "Facultes"("id");
ALTER TABLE
    "teachers_salary" ADD CONSTRAINT "teachers_salary_teacher_id_foreign" FOREIGN KEY("teacher_id") REFERENCES "Teachers"("id");