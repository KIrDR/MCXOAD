-- Создание таблицы "Specializations"
CREATE TABLE Specializations (
    id INT PRIMARY KEY,
    spec_kode NVARCHAR(255) NOT NULL,
    faculty_id INT NOT NULL,
    department_id INT NOT NULL,
    fullName NVARCHAR(255) NOT NULL,
    shortName NVARCHAR(255) NOT NULL
);

-- Создание таблицы "Faculties"
CREATE TABLE Faculties (
    id INT PRIMARY KEY,
    faculty_shortName NVARCHAR(255) NOT NULL,
    fullName NVARCHAR(255) NOT NULL
);

-- Создание таблицы "Department"
CREATE TABLE Department (
    id INT PRIMARY KEY,
    faculty_id INT NOT NULL,
    fullName NVARCHAR(255) NOT NULL,
    shortName NVARCHAR(255) NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES Faculties(id)
);

-- Создание таблицы "teachers_salary"
CREATE TABLE teachers_salary (
    id BIGINT PRIMARY KEY,
    accountant_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    work_time DECIMAL(10, 2) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    teacher_id INT NOT NULL
);


-- Создание таблицы "Teachers"
CREATE TABLE Teachers (
    id INT PRIMARY KEY,
    teacher_number INT NOT NULL,
    Name NVARCHAR(255) NOT NULL,
    Surname NVARCHAR(255) NOT NULL,
    Patronymic NVARCHAR(255) NOT NULL,
    Department_id INT NOT NULL,
    date_of_birth DATE NOT NULL,
    FOREIGN KEY (Department_id) REFERENCES Department(id)
);

-- Создание таблицы "Groups"
CREATE TABLE Groups (
    id INT PRIMARY KEY,
    faculty_id INT NOT NULL,
    group_name NVARCHAR(255) NOT NULL,
    curator INT NOT NULL,
    FOREIGN KEY (curator) REFERENCES Teachers(id)
);

-- Создание таблицы "Subjects"
CREATE TABLE Subjects (
    id INT PRIMARY KEY,
    department_id INT NOT NULL,
    fullName NVARCHAR(255) NOT NULL,
    shortName NVARCHAR(255) NOT NULL
);


-- Создание таблицы "Students"
CREATE TABLE Students (
    id INT PRIMARY KEY,
    Student_number INT NOT NULL,
    group_id INT NOT NULL,
    Name NVARCHAR(255) NOT NULL,
    Surname NVARCHAR(255) NOT NULL,
    patronymic NVARCHAR(255) NOT NULL,
    department_id INT NOT NULL,
    faculty_id INT NOT NULL,
    specialization_id INT NOT NULL,
    date_of_birth DATE NOT NULL,
    date_of_admission DATE NOT NULL,
    date_of_expulsion DATE NOT NULL,
    FOREIGN KEY (group_id) REFERENCES Groups(id),
    FOREIGN KEY (faculty_id) REFERENCES Faculties(id),
    FOREIGN KEY (specialization_id) REFERENCES Specializations(id)
);


-- Создание таблицы "Library"
CREATE TABLE Library (
    id BIGINT PRIMARY KEY,
    Autor NVARCHAR(255) NOT NULL,
    publication_date DATE NOT NULL,
    Name NVARCHAR(255) NOT NULL,
    Quantity INT NOT NULL
);


-- Создание таблицы "Classes"
CREATE TABLE Classes (
    id INT PRIMARY KEY,
    subject_id INT NOT NULL,
    teacher_id INT NOT NULL,
    group_id INT NOT NULL,
    date DATETIME NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subjects(id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id),
    FOREIGN KEY (group_id) REFERENCES Groups(id)
);

-- Создание таблицы "List_of_issued_books"
CREATE TABLE List_of_issued_books (
    id BIGINT PRIMARY KEY,
    student_id INT NOT NULL,
    book_id BIGINT NOT NULL,
    date_of_issued DATE NOT NULL,
    return_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (book_id) REFERENCES Library(id)
);


-- Создание таблицы "Accountant"
CREATE TABLE Accountant (
    id INT PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,	
    surname NVARCHAR(255) NOT NULL
);

-- Создание таблицы "Scholarship"
CREATE TABLE Scholarship (
    id BIGINT PRIMARY KEY,
    accountant_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    scholarship DECIMAL(10, 2) NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (accountant_id) REFERENCES Accountant(id),
    FOREIGN KEY (student_id) REFERENCES Students(id)
);


