select * from "Groups";

select * from "Students";

insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval,2,'Павел','Арцыхович','Артёмович',1,1,2,'12-11-2005','01-09-2020','01-07-2025');
insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval,2,'Антон','Арцыхович','Артёмович',1,1,2,'12-11-2005','01-09-2020','01-07-2025');
insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval,2,'Дмитрикй','Палыч','Артёмович',1,1,2,'12-11-2005','01-09-2020','01-07-2025');
insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval,2,'Шаст','Норисон','Артёмович',1,1,2,'12-11-2005','01-09-2020','01-07-2025');
insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval,2,'Денис','Кудрявцев','Артёмович',1,1,2,'12-11-2005','01-09-2020','01-07-2025');
insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval,2,'Павел','Арцыхович','Артёмович',1,1,2,'12-11-2005','01-09-2020','01-07-2025');



insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval, 3, 'Иван', 'Иванов', 'Иванович', 1, 1, 2, '12-11-2005', '01-09-2020', '01-07-2025');
insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval, 3, 'Александр', 'Сергеев', 'Александрович', 1, 1, 2, '12-11-2005', '01-09-2020', '01-07-2025');
insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval, 3, 'Елена', 'Петрова', 'Игоревна', 1, 1, 2, '12-11-2005', '01-09-2020', '01-07-2025');
insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval, 3, 'Артем', 'Смирнов', 'Владимирович', 1, 1, 2, '12-11-2005', '01-09-2020', '01-07-2025');
insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval, 3, 'Марина', 'Ковалева', 'Андреевна', 1, 1, 2, '12-11-2005', '01-09-2020', '01-07-2025');
insert into "Students"
    ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion")
VALUES (STUDENT_TICKET_NUMBER_SEQUENCE.nextval, 3, 'Сергей', 'Сидоров', 'Сергеевич', 1, 1, 2, '12-11-2005', '01-09-2020', '01-07-2025');

-- создам объектный тип СТУДЕНТА
    -- studentObj
CREATE TYPE studentObj AS OBJECT (
    student_number int,
    group_id INT,
    name NVARCHAR2(50),
    Surname NVARCHAR2(50),
    patronymic NVARCHAR2(50),
    department_id INT,
    faculty_id INT,
    specialization_id INT,
    date_of_birth DATE,
    date_of_admission DATE,
    date_of_expulsion DATE,
    -- Дополнительный конструктор
    CONSTRUCTOR FUNCTION studentObj(
        student_number int DEFAULT NULL,
        group_id INT DEFAULT NULL,
        name NVARCHAR2 DEFAULT NULL,
        Surname NVARCHAR2 DEFAULT NULL,
        patronymic NVARCHAR2 DEFAULT NULL,
        department_id INT DEFAULT NULL,
        faculty_id INT DEFAULT NULL,
        specialization_id INT DEFAULT NULL,
        date_of_birth DATE DEFAULT NULL,
        date_of_admission DATE DEFAULT NULL,
        date_of_expulsion DATE DEFAULT NULL
    ) RETURN SELF AS RESULT,

    -- Метод сравнения типа MAP или ORDER
    MEMBER FUNCTION compare(p_student studentObj) RETURN INT,

    -- Метод экземпляра функцию
    MEMBER FUNCTION getFullName RETURN NVARCHAR2,

    -- Метод экземпляра процедуру
    MEMBER PROCEDURE displayStudentInfo
);

CREATE TYPE BODY studentObj AS
    -- Дополнительный конструктор
    CONSTRUCTOR FUNCTION studentObj(
        "student_number" int DEFAULT NULL,
        "group_id" INT DEFAULT NULL,
        "name" NVARCHAR2 DEFAULT NULL,
        "Surname" NVARCHAR2 DEFAULT NULL,
        "patronymic" NVARCHAR2 DEFAULT NULL,
        "department_id" INT DEFAULT NULL,
        "faculty_id" INT DEFAULT NULL,
        "specialization_id" INT DEFAULT NULL,
        "date_of_birth" DATE DEFAULT NULL,
        "date_of_admission" DATE DEFAULT NULL,
        "date_of_expulsion" DATE DEFAULT NULL
    ) RETURN SELF AS RESULT IS
    BEGIN
        SELF."student_number" := student_number;
        SELF."group_id" := group_id;
        SELF."name" := name;
        SELF."Surname" := Surname;
        SELF."patronymic" := patronymic;
        SELF."department_id" := department_id;
        SELF."faculty_id" := faculty_id;
        SELF."specialization_id" := specialization_id;
        SELF."date_of_birth" := date_of_birth;
        SELF."date_of_admission" := date_of_admission;
        SELF."date_of_expulsion" := date_of_expulsion;
    END;

    -- Метод сравнения типа MAP или ORDER
    MEMBER FUNCTION compare(p_student studentObj) RETURN INT IS
    BEGIN
        -- Реализация вашего сравнения, например, сравнение по идентификатору студента
        IF self."student_number" = p_student."student_number" THEN
            RETURN 0; -- Студенты равны
        ELSIF self."student_number" < p_student."student_number" THEN
            RETURN -1; -- self меньше p_student
        ELSE
            RETURN 1; -- self больше p_student
        END IF;
    END compare;

    -- Метод экземпляра функцию
    MEMBER FUNCTION getFullName RETURN NVARCHAR2 IS
    BEGIN
        RETURN "name" || ' ' || "Surname" || ' ' || "patronymic";
    END getFullName;

    -- Метод экземпляра процедуру
    MEMBER PROCEDURE displayStudentInfo IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Student Info:');
        DBMS_OUTPUT.PUT_LINE('Student Number: ' || "student_number");
        DBMS_OUTPUT.PUT_LINE('Full Name: ' || getFullName());
        DBMS_OUTPUT.PUT_LINE('Group ID: ' || "group_id");
        -- Добавьте вывод остальной информации по желанию
    END displayStudentInfo;
END;
/

CREATE TABLE StudentTable (
    student_data studentObj
);

declare
    st1 studentObj;
    begin
    st1 := studentObj(  STUDENT_TICKET_NUMBER_SEQUENCE.nextval,
        1,
        'John',
        'Doe',
        'Smith',
        1,
        1,
        2,
        TO_DATE('2000-01-01', 'YYYY-MM-DD'),
        TO_DATE('2022-09-01', 'YYYY-MM-DD'),
        TO_DATE('2026-07-01', 'YYYY-MM-DD'));
    st1.DISPLAYSTUDENTINFO();
end;

-- не понимаю почему не работает
-- проведу эксперемент
create or replace type person as object (
    name nvarchar2(20),
    birth_day date,
    constructor function person(
        name nvarchar2 default 'ooo',
        birth_day date default TO_DATE('2000-10-10', 'YYYY-MM-DD')
    ) return self as result ,
    order member function is_order (person person) return int,
    MEMBER FUNCTION GET_PERSON_INFO RETURN NVARCHAR2,
    MEMBER PROCEDURE DISPLAY_PERSON_INFO
);

create or replace type body person as
    constructor function person(
        name nvarchar2 default 'ooo',
        birth_day date default TO_DATE('2000-10-10', 'YYYY-MM-DD')
    ) return self as result is
    begin
        self.name := name;
        self.birth_day := birth_day;
        return;
    end;
    order member function is_order (person person) return int is
    begin
        if birth_day > person.birth_day
                then return -1;
            elsif birth_day < person.birth_day
                then return 1;
            else return 0 ;
        end if;
    end;

MEMBER FUNCTION GET_PERSON_INFO RETURN NVARCHAR2 IS
    BEGIN
        RETURN 'Name: ' || self.name || ', Birth Day: ' || TO_CHAR(self.birth_day, 'YYYY-MM-DD');
    END GET_PERSON_INFO;

MEMBER PROCEDURE DISPLAY_PERSON_INFO IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Person Info:');
        DBMS_OUTPUT.PUT_LINE('Name: ' || self.name);
        DBMS_OUTPUT.PUT_LINE('Birth Day: ' || TO_CHAR(self.birth_day, 'YYYY-MM-DD'));
    END DISPLAY_PERSON_INFO;
end;



declare
    ps1 person := person('Kirill', TO_DATE('2034-12-12', 'YYYY-MM-DD'));
    ps2 person := person('Pasha', TO_DATE('2004-12-12', 'YYYY-MM-DD'));
    ps3 person := person('Andrey', TO_DATE('2054-12-12', 'YYYY-MM-DD'));
begin

    DBMS_OUTPUT.PUT_LINE(ps1.GET_PERSON_INFO);
    ps1.DISPLAY_PERSON_INFO;
    DBMS_OUTPUT.PUT_LINE( ps1.IS_ORDER(ps2));
end;


--
--student
       -- studentObj
    CREATE TYPE studentObj AS OBJECT (
        student_number int,
        group_id INT,
        name NVARCHAR2(50),
        Surname NVARCHAR2(50),
        patronymic NVARCHAR2(50),
        department_id INT,
        faculty_id INT,
        specialization_id INT,
        date_of_birth DATE,
        date_of_admission DATE,
        date_of_expulsion DATE,
        -- Дополнительный конструктор
        CONSTRUCTOR FUNCTION studentObj(
            student_number int DEFAULT NULL,
            group_id INT DEFAULT NULL,
            name NVARCHAR2 DEFAULT NULL,
            Surname NVARCHAR2 DEFAULT NULL,
            patronymic NVARCHAR2 DEFAULT NULL,
            department_id INT DEFAULT NULL,
            faculty_id INT DEFAULT NULL,
            specialization_id INT DEFAULT NULL,
            date_of_birth DATE DEFAULT NULL,
            date_of_admission DATE DEFAULT NULL,
            date_of_expulsion DATE DEFAULT NULL
        ) RETURN SELF AS RESULT,
        MEMBER FUNCTION compare(p_student studentObj) RETURN INT,
        MEMBER FUNCTION getFullName RETURN NVARCHAR2,
        MEMBER PROCEDURE displayStudentInfo
    );



    create or replace type body studentObj as
        constructor function studentObj(
            group_id INT DEFAULT NULL,
            name NVARCHAR2 DEFAULT NULL,
            Surname NVARCHAR2 DEFAULT NULL,
            patronymic NVARCHAR2 DEFAULT NULL,
            department_id INT DEFAULT NULL,
            faculty_id INT DEFAULT NULL,
            specialization_id INT DEFAULT NULL,
            date_of_birth DATE DEFAULT NULL,
            date_of_admission DATE DEFAULT NULL,
            date_of_expulsion DATE DEFAULT NULL
        ) return self as result is
        begin
            self.student_number := STUDENT_TICKET_NUMBER_SEQUENCE.nextval;
            SELF.group_id := group_id;
            self.name := name;
            SELF.Surname := Surname;
            self.patronymic := patronymic;
            department_id := department_id;
            faculty_id := faculty_id;
            specialization_id := specialization_id;
            date_of_birth := date_of_birth;
            date_of_admission := date_of_admission;
            date_of_expulsion := date_of_expulsion;
            return;
        end;
        order member function compare (student studentObj) return int is
        begin
            if student_number = student.student_number
                    then return 1;
                else return 0 ;
            end if;
        end;

    MEMBER FUNCTION getFullName RETURN NVARCHAR2 IS
        BEGIN
            RETURN 'Name: ' || self.name || ', Birth Day: ' || TO_CHAR(self.date_of_birth, 'YYYY-MM-DD');
        END getFullName;

    MEMBER PROCEDURE displayStudentInfo IS
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Person Info:' || SELF.student_number);
            DBMS_OUTPUT.PUT_LINE('Name: ' || self.name || '  ' || SELF.Surname);
        END displayStudentInfo;
    end;



declare
    ps1 person := person('Kirill', TO_DATE('2034-12-12', 'YYYY-MM-DD'));
    ps2 person := person('Pasha', TO_DATE('2004-12-12', 'YYYY-MM-DD'));
    ps3 person := person('Andrey', TO_DATE('2054-12-12', 'YYYY-MM-DD'));
begin

    DBMS_OUTPUT.PUT_LINE(ps1.GET_PERSON_INFO);
    ps1.DISPLAY_PERSON_INFO;
    DBMS_OUTPUT.PUT_LINE( ps1.IS_ORDER(ps2));
end;

----
CREATE TYPE studentObj AS OBJECT (
    student_number INT,
    group_id INT,
    name NVARCHAR2(50),
    Surname NVARCHAR2(50),
    patronymic NVARCHAR2(50),
    department_id INT,
    faculty_id INT,
    specialization_id INT,
    date_of_birth DATE,
    date_of_admission DATE,
    date_of_expulsion DATE,

    -- Дополнительный конструктор
    CONSTRUCTOR FUNCTION studentObj(
        student_number INT DEFAULT NULL,
        group_id INT DEFAULT NULL,
        name NVARCHAR2 DEFAULT NULL,
        Surname NVARCHAR2 DEFAULT NULL,
        patronymic NVARCHAR2 DEFAULT NULL,
        department_id INT DEFAULT NULL,
        faculty_id INT DEFAULT NULL,
        specialization_id INT DEFAULT NULL,
        date_of_birth DATE DEFAULT NULL,
        date_of_admission DATE DEFAULT NULL,
        date_of_expulsion DATE DEFAULT NULL
    ) RETURN SELF AS RESULT,
    -- Метод сравнения
    MEMBER FUNCTION compare(p_student studentObj) RETURN INT,
    -- Метод получения полного имени
    MEMBER FUNCTION getFullName RETURN NVARCHAR2,
    -- Метод вывода информации
    MEMBER PROCEDURE displayStudentInfo
);

CREATE OR REPLACE TYPE BODY studentObj AS
    CONSTRUCTOR FUNCTION studentObj(
        student_number INT DEFAULT NULL,
        group_id INT DEFAULT NULL,
        name NVARCHAR2 DEFAULT NULL,
        Surname NVARCHAR2 DEFAULT NULL,
        patronymic NVARCHAR2 DEFAULT NULL,
        department_id INT DEFAULT NULL,
        faculty_id INT DEFAULT NULL,
        specialization_id INT DEFAULT NULL,
        date_of_birth DATE DEFAULT NULL,
        date_of_admission DATE DEFAULT NULL,
        date_of_expulsion DATE DEFAULT NULL
    ) RETURN SELF AS RESULT IS
    BEGIN
        SELF.student_number := COALESCE(student_number, STUDENT_TICKET_NUMBER_SEQUENCE.nextval);
        SELF.group_id := group_id;
        SELF.name := name;
        SELF.Surname := Surname;
        SELF.patronymic := patronymic;
        SELF.department_id := department_id;
        SELF.faculty_id := faculty_id;
        SELF.specialization_id := specialization_id;
        SELF.date_of_birth := date_of_birth;
        SELF.date_of_admission := date_of_admission;
        SELF.date_of_expulsion := date_of_expulsion;
        RETURN;
    END;

    MEMBER FUNCTION compare(p_student studentObj) RETURN INT IS
    BEGIN
        IF SELF.student_number = p_student.student_number THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END compare;

    MEMBER FUNCTION getFullName RETURN NVARCHAR2 IS
    BEGIN
        RETURN 'Name: ' || SELF.name || ', '|| Self.SURNAME || self.PATRONYMIC;
    END getFullName;

    MEMBER PROCEDURE displayStudentInfo IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Student Number: ' || SELF.student_number);
        DBMS_OUTPUT.PUT_LINE('Full Name: ' || SELF.name || ' ' || SELF.Surname || ' ' || SELF.patronymic);
    END displayStudentInfo;

END;
/

DECLARE
    stud1 studentObj := studentObj(1,1, 'Паша', 'авдеев', 'Петрович', 1, 1, 1, TO_DATE('2000-10-10', 'YYYY-MM-DD'), TO_DATE('2020-09-01', 'YYYY-MM-DD'), TO_DATE('2024-07-10', 'YYYY-MM-DD'));
    stud2 studentObj := studentObj(1,1, 'Кирилл', 'авдеев', 'Петрович', 1, 1, 1, TO_DATE('2000-10-10', 'YYYY-MM-DD'), TO_DATE('2020-09-01', 'YYYY-MM-DD'), TO_DATE('2024-07-10', 'YYYY-MM-DD'));
BEGIN
    stud1.DISPLAYSTUDENTINFO();
    DBMS_OUTPUT.PUT_LINE(stud2.GETFULLNAME());
END;
/

DECLARE
    stud1 studentObj := studentObj(1,1, 'Паша', 'авдеев', 'Петрович', 1, 1, 1, TO_DATE('2000-10-10', 'YYYY-MM-DD'), TO_DATE('2020-09-01', 'YYYY-MM-DD'), TO_DATE('2024-07-10', 'YYYY-MM-DD'));
    stud2 studentObj := studentObj(1,1, 'Кирилл', 'авдеев', 'Петрович', 1, 1, 1, TO_DATE('2000-10-10', 'YYYY-MM-DD'), TO_DATE('2020-09-01', 'YYYY-MM-DD'), TO_DATE('2024-07-10', 'YYYY-MM-DD'));
   stud3 studentObj := studentObj(1274236,1, 'Кирилл', 'авдеев', 'Петрович', 1, 1, 1, TO_DATE('2000-10-10', 'YYYY-MM-DD'), TO_DATE('2020-09-01', 'YYYY-MM-DD'), TO_DATE('2024-07-10', 'YYYY-MM-DD'));
    result INT;
BEGIN
    result := stud1.COMPARE(stud2);
        DBMS_OUTPUT.PUT_LINE('Результат сравнения: ' || result);
    result := stud1.COMPARE(stud3);
        DBMS_OUTPUT.PUT_LINE('Результат сравнения: ' || result);
END;

----
select * from "Students";
create table ObjStudents (
    student studentObj
) ;

INSERT INTO ObjStudents (student)
SELECT studentObj(
    "student_number",
    "group_id",
    "Name",
    "Surname",
    "patronymic",
    "department_id",
    "faculty_id",
    "specialization_id",
    "date_of_birth",
    "date_of_admission",
    "date_of_expulsion"
)
FROM "Students";

    select * from ObjStudents;

SELECT
    obj.student.student_number,
    obj.student.group_id,
    obj.student.name,
    obj.student.surname,
    obj.student.patronymic,
    obj.student.department_id,
    obj.student.faculty_id,
    obj.student.specialization_id,
    obj.student.date_of_birth,
    obj.student.date_of_admission,
    obj.student.date_of_expulsion
FROM ObjStudents obj;


--- представление
CREATE VIEW StudentView AS
SELECT
    obj.student.student_number AS student_number,
    obj.student.group_id AS group_id,
    obj.student.name AS name,
    obj.student.surname AS surname,
    obj.student.patronymic AS patronymic,
    obj.student.department_id AS department_id,
    obj.student.faculty_id AS faculty_id,
    obj.student.specialization_id AS specialization_id,
    obj.student.date_of_birth AS date_of_birth,
    obj.student.date_of_admission AS date_of_admission,
    obj.student.date_of_expulsion AS date_of_expulsion
FROM ObjStudents obj;

create view StudentObjView as
    select obj.student as student from ObjStudents obj;
-- Пример использования объектного представления
SELECT o.student.getFullName() FROM StudentObjView o;

-- Создаем индекс по атрибуту
CREATE INDEX idx_name ON ObjStudents(student.name);


select * from OBJSTUDENTS;
-- Создаем индекс по результату метода
CREATE INDEX idx_full_name ON ObjStudents((student.getFullName()));


CREATE OR REPLACE TYPE groupObj AS OBJECT (
    id INT,
    faculty_id INT,
    group_name NVARCHAR2(50),

    CONSTRUCTOR FUNCTION groupObj(
        id INT DEFAULT NULL,
        faculty_id INT DEFAULT NULL,
        group_name NVARCHAR2 DEFAULT NULL
    ) RETURN SELF AS RESULT,

    MEMBER FUNCTION nameLength RETURN INT
);

CREATE OR REPLACE TYPE BODY groupObj AS
    CONSTRUCTOR FUNCTION groupObj(
        id INT DEFAULT NULL,
        faculty_id INT DEFAULT NULL,
        group_name NVARCHAR2 DEFAULT NULL
    ) RETURN SELF AS RESULT IS
    BEGIN
        SELF.id := id;
        SELF.faculty_id := faculty_id;
        SELF.group_name := group_name;
        RETURN;
    END;

    MEMBER FUNCTION nameLength RETURN INT IS
    BEGIN
        RETURN cos(LENGTH(SELF.group_name));
    END nameLength;
END;
/
create table GroupObj1 (
    groupO groupObj
) ;

create index NameLeng on GroupObj1(groupO.NAMELENGTH());
