CREATE TABLE Specializations (
    id NUMERIC(10, 0) NOT NULL,
    spec_kode VARCHAR2(255 CHAR) NOT NULL,
    faculty_id NUMERIC(10, 0) NOT NULL,
    department_id NUMERIC(10, 0) NOT NULL,
    fullName VARCHAR2(255 CHAR) NOT NULL,
    shortName VARCHAR2(255 CHAR) NOT NULL,
    CONSTRAINT specializations_id_primary PRIMARY KEY (id)
);

CREATE TABLE teachers_salary (
    id NUMERIC(10, 0) NOT NULL,
    accountant_id NUMERIC(10, 0) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    work_time NUMERIC(10, 2) NOT NULL,
    salary NUMERIC(10, 2) NOT NULL,
    teacher_id NUMERIC(10, 0) NOT NULL,
    CONSTRAINT teachers_salary_id_primary PRIMARY KEY (id)
);

CREATE TABLE Groups (
    id NUMERIC(10, 0) NOT NULL,
    faculty_id NUMERIC(10, 0) NOT NULL,
    group_name VARCHAR2(255 CHAR) NOT NULL,
    curator NUMERIC(10, 0) NOT NULL,
    CONSTRAINT groups_id_primary PRIMARY KEY (id)
);

CREATE TABLE Subjects (
    id NUMERIC(10, 0) NOT NULL,
    departnemt_id NUMERIC(10, 0) NOT NULL,
    fullName VARCHAR2(255 CHAR) NOT NULL,
    shortName VARCHAR2(255 CHAR) NOT NULL,
    CONSTRAINT subjects_id_primary PRIMARY KEY (id)
);

CREATE TABLE Students (
    id NUMERIC(10, 0) NOT NULL,
    Student_number NUMERIC(10, 0) NOT NULL,
    group_id NUMERIC(10, 0) NOT NULL,
    Name VARCHAR2(255 CHAR) NOT NULL,
    Surname VARCHAR2(255 CHAR) NOT NULL,
    patronymic VARCHAR2(255 CHAR) NOT NULL,
    department_id NUMERIC(10, 0) NOT NULL,
    faculty_id NUMERIC(10, 0) NOT NULL,
    specialization_id NUMERIC(10, 0) NOT NULL,
    date_of_birth DATE NOT NULL,
    date_of_admission DATE NOT NULL,
    date_of_expulsion DATE NOT NULL,
    CONSTRAINT students_id_primary PRIMARY KEY (id)
);

CREATE TABLE Facultes (
    id NUMERIC(10, 0) NOT NULL,
    faculty_shortName VARCHAR2(255 CHAR) NOT NULL,
    fullName VARCHAR2(255 CHAR) NOT NULL,
    CONSTRAINT facultes_id_primary PRIMARY KEY (id)
);

CREATE TABLE Library (
    id NUMERIC(10, 0) NOT NULL,
    Autor VARCHAR2(255 CHAR) NOT NULL,
    publication_date DATE NOT NULL,
    Name VARCHAR2(255 CHAR) NOT NULL,
    Quantity NUMERIC(10, 0) NOT NULL,
    CONSTRAINT library_id_primary PRIMARY KEY (id)
);

CREATE TABLE Department (
    id NUMERIC(10, 0) NOT NULL,
    faculty_id NUMERIC(10, 0) NOT NULL,
    fullName VARCHAR2(255 CHAR) NOT NULL,
    shortName VARCHAR2(255 CHAR) NOT NULL,
    CONSTRAINT department_id_primary PRIMARY KEY (id)
);

CREATE TABLE Classes (
    id NUMERIC(10, 0) NOT NULL,
    subject_id NUMERIC(10, 0) NOT NULL,
    teacher_id NUMERIC(10, 0) NOT NULL,
    group_id NUMERIC(10, 0) NOT NULL,
    date_classes DATE NOT NULL,
    CONSTRAINT classes_id_primary PRIMARY KEY (id)
);

CREATE TABLE Teachers (
    id NUMERIC(10, 0) NOT NULL,
    teacher_number NUMERIC(10, 0) NOT NULL,
    Name VARCHAR2(255 CHAR) NOT NULL,
    Surname VARCHAR2(255 CHAR) NOT NULL,
    Patronymic VARCHAR2(255 CHAR) NOT NULL,
    Departmetn_id NUMERIC(10, 0) NOT NULL,
    date_of_birth DATE NOT NULL,
    CONSTRAINT teachers_id_primary PRIMARY KEY (id)
);

CREATE TABLE List_of_issued (
    id NUMERIC(10, 0) NOT NULL,
    student_id NUMERIC(10, 0) NOT NULL,
    book_id NUMERIC(10, 0) NOT NULL,
    date_of_issued DATE NOT NULL,
    return_date DATE NOT NULL,
    CONSTRAINT list_of_issue PRIMARY KEY (id)
);

CREATE TABLE scholarship (
    id NUMERIC(10, 0) NOT NULL,
    accountant_id NUMERIC(10, 0) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    scholarship NUMERIC(10, 2) NOT NULL,
    student_id NUMERIC(10, 0) NOT NULL,
    CONSTRAINT scholarship_id_primary PRIMARY KEY (id)
);

CREATE TABLE Accountant (
    id NUMERIC(10, 0) NOT NULL,
    name VARCHAR2(255 CHAR) NOT NULL,
    surname VARCHAR2(255 CHAR) NOT NULL,
    column_4 NUMERIC(19, 0) NOT NULL,
    CONSTRAINT accountant_id_primary PRIMARY KEY (id)
);

ALTER TABLE Teachers
ADD CONSTRAINT teachers_departmetn_id_foreign FOREIGN KEY (Departmetn_id) REFERENCES Department(id);

ALTER TABLE Department
ADD CONSTRAINT department_faculty_id_foreign FOREIGN KEY (faculty_id) REFERENCES Facultes(id);

ALTER TABLE teachers_salary
ADD CONSTRAINT teachers_salary_acc FOREIGN KEY (accountant_id) REFERENCES Accountant(id);

ALTER TABLE Students
ADD CONSTRAINT students_group_id_foreign FOREIGN KEY (group_id) REFERENCES Groups(id);

ALTER TABLE Groups
ADD CONSTRAINT groups_curator_foreign FOREIGN KEY (curator) REFERENCES Teachers(id);

ALTER TABLE List_of_issued
ADD CONSTRAINT list_of_issued_books_stud FOREIGN KEY (student_id) REFERENCES Students(id);

ALTER TABLE scholarship
ADD CONSTRAINT scholarship_student_id_foreign FOREIGN KEY (student_id) REFERENCES Students(id);

ALTER TABLE Classes
ADD CONSTRAINT classes_teacher_id_foreign FOREIGN KEY (teacher_id) REFERENCES Teachers(id);

ALTER TABLE Students
ADD CONSTRAINT students_faculty_id_foreign FOREIGN KEY (faculty_id) REFERENCES Facultes(id);

ALTER TABLE Specializations
ADD CONSTRAINT specializations_id_foreign FOREIGN KEY (department_id) REFERENCES Department(id);

ALTER TABLE Classes
ADD CONSTRAINT classes_group_id_foreign FOREIGN KEY (group_id) REFERENCES Groups(id);

ALTER TABLE List_of_issued
ADD CONSTRAINT list_of_id_foreign FOREIGN KEY (book_id) REFERENCES Library(id);

ALTER TABLE Classes
ADD CONSTRAINT classes_foreign FOREIGN KEY (subject_id) REFERENCES Subjects(id);

ALTER TABLE scholarship
ADD CONSTRAINT scholarship_foreign FOREIGN KEY (accountant_id) REFERENCES Accountant(id);

ALTER TABLE Students
ADD CONSTRAINT stud_foreign FOREIGN KEY (specialization_id) REFERENCES Specializations(id);

ALTER TABLE Specializations
ADD CONSTRAINT specializa_foreign FOREIGN KEY (faculty_id) REFERENCES Facultes(id);

ALTER TABLE teachers_salary
ADD CONSTRAINT teachers_sala FOREIGN KEY (teacher_id) REFERENCES Teachers(id);
