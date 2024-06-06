
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
    MEMBER FUNCTION getFullName RETURN NVARCHAR2 deterministic,
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


--- работа с groups

--- работа с groups

--- работа с groups

--- работа с groups

--- работа с groups

CREATE OR REPLACE TYPE groupObj AS OBJECT (
    id INT,
    faculty_id INT,
    group_name NVARCHAR2(50),

    CONSTRUCTOR FUNCTION groupObj(
        id INT DEFAULT NULL,
        faculty_id INT DEFAULT NULL,
        group_name NVARCHAR2 DEFAULT NULL
    ) RETURN SELF AS RESULT,

    MEMBER FUNCTION nameLength RETURN INT deterministic,
    MEMBER FUNCTION compare1(p_group groupObj) RETURN INT,
    MEMBER FUNCTION getGroupName RETURN NVARCHAR2,
    ORDER MEMBER FUNCTION compare2(p_group groupObj) RETURN INT,
    MEMBER PROCEDURE displayInfo
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
        RETURN LENGTH(SELF.group_name);
    END nameLength;

    MEMBER FUNCTION compare1(p_group groupObj) RETURN INT IS
    BEGIN
        IF SELF.group_name = p_group.group_name THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END compare1;

    MEMBER FUNCTION getGroupName RETURN NVARCHAR2 IS
    BEGIN
        RETURN SELF.group_name;
    END getGroupName;

    ORDER MEMBER FUNCTION compare2(p_group groupObj) RETURN INT IS
    BEGIN
        RETURN compare1(p_group);
    END compare2;

    MEMBER PROCEDURE displayInfo IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Number: ' || SELF.id);
        DBMS_OUTPUT.PUT_LINE('Full Name: ' || SELF.group_name);
    END displayInfo;
END;
/


create table GROUPOBJ2 (
    Ogrouppp groupObj
);
insert into GROUPOBJ2 (OGROUPPP)
select groupObj(
    "id",
    "faculty_id",
    "group_name"
           ) from "Groups";

    select * from GROUPOBJ2;


select t.Ogrouppp.ID,
       t.Ogrouppp.FACULTY_ID,
       t.Ogrouppp.GROUP_NAME
from GROUPOBJ2 t;



select t.Ogrouppp.NAMELENGTH()
from GROUPOBJ2 t;

select t.Ogrouppp.COMPARE1(t.Ogrouppp)
from GROUPOBJ2 t;

create view  funrierfn as
    select * from GROUPOBJ2;

select * from funrierfn;


select v.Ogrouppp.GROUP_NAME, v.Ogrouppp.FACULTY_ID, v.Ogrouppp.ID from funrierfn v;




-- Создаем индекс по атрибуту
CREATE INDEX idx_id ON GROUPOBJ2(Ogrouppp.ID);


select * from GROUPOBJ2;
-- Создаем индекс по результату метода

CREATE INDEX idx_nameLeng    ON GROUPOBJ2((Ogrouppp.NAMELENGTH()));




