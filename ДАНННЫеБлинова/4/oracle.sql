-- Заполнение таблицы Facultes
INSERT INTO "Facultes" ("id", "faculty_shortName", "fullName")
VALUES (1, 'FIT', 'Faculty of Information Technologies');

-- Заполнение таблицы Department
INSERT INTO "Department" ("id", "faculty_id", "fullName", "shortName")
VALUES (1, 1, 'Department of Computer Science', 'CS');

-- Заполнение таблицы Specializations
INSERT ALL
  INTO "Specializations" ("id", "spec_kode", "faculty_id", "department_id", "fullName", "shortName") VALUES (1, 'CS-001', 1, 1, 'Computer Science', 'CS')
  INTO "Specializations" ("id", "spec_kode", "faculty_id", "department_id", "fullName", "shortName") VALUES (2, 'SE-001', 1, 1, 'Software Engineering', 'SE')
  INTO "Specializations" ("id", "spec_kode", "faculty_id", "department_id", "fullName", "shortName") VALUES (3, 'IS-001', 1, 1, 'Information Systems', 'IS')
SELECT * FROM dual;

-- Заполнение таблицы Groups
INSERT ALL
  INTO "Groups" ("id", "faculty_id", "group_name", "curator") VALUES (1, 1, 'CS-101', 1)
  INTO "Groups" ("id", "faculty_id", "group_name", "curator") VALUES (2, 1, 'SE-101', 2)
  INTO "Groups" ("id", "faculty_id", "group_name", "curator") VALUES (3, 1, 'IS-101', 3)
SELECT * FROM dual;

select * from "Students";
-- Заполнение таблицы Students
INSERT INTO "Students" ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion") VALUES (TEACHERS_NUMBER_SEQUENC.nextval, 1, 'John2', 'Doe2', 'Ivanovich2', 1, 1, 1, TO_DATE('1990-01-01', 'YYYY-MM-DD'), TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'));
 INSERT INTO "Students" ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion") VALUES (TEACHERS_NUMBER_SEQUENC.nextval, 1, 'Jane2', 'Smith2', 'Petrovna2', 1, 1, 2, TO_DATE('1991-02-02', 'YYYY-MM-DD'), TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'));
 INSERT INTO "Students" ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion") VALUES (TEACHERS_NUMBER_SEQUENC.nextval, 1, 'Student2-1', 'Surname2-1', 'Patronymic2-1', 1, 1, 1, TO_DATE('1993-04-04', 'YYYY-MM-DD'), TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'));
 INSERT INTO "Students" ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion") VALUES (TEACHERS_NUMBER_SEQUENC.nextval, 1, 'Student2-2', 'Surname2-2', 'Patronymic2-2', 1, 1, 2, TO_DATE('1994-05-05', 'YYYY-MM-DD'), TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'));
 INSERT INTO "Students" ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion") VALUES (TEACHERS_NUMBER_SEQUENC.nextval, 1, 'Student2-3', 'Surname2-3', 'Patronymic2-3', 1, 1, 1, TO_DATE('1995-06-06', 'YYYY-MM-DD'), TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'));
 INSERT INTO "Students" ("student_number", "group_id", "Name", "Surname", "patronymic", "department_id", "faculty_id", "specialization_id", "date_of_birth", "date_of_admission", "date_of_expulsion") VALUES (TEACHERS_NUMBER_SEQUENC.nextval, 1, 'Student2-4', 'Surname2-4', 'Patronymic2-4', 1, 1, 2, TO_DATE('1996-07-07', 'YYYY-MM-DD'), TO_DATE('2019-09-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'));

select * from "Subjects";
-- Заполнение таблицы Subjects
INSERT INTO "Subjects" ("id", "departnemt_id", "fullName", "shortName", "amount_of_hours")
VALUES
(1, 1, 'Database Management', 'DBMS', 60);
INSERT INTO "Subjects" ("id", "departnemt_id", "fullName", "shortName", "amount_of_hours")
VALUES
(2, 1, 'Software Engineering', 'SE', 45);
INSERT INTO "Subjects" ("id", "departnemt_id", "fullName", "shortName", "amount_of_hours")
VALUES
(3, 1, 'Algorithms and Data Structures', 'ADS', 75);

-- Заполнение таблицы Teachers
INSERT INTO "Teachers" ("teacher_number", "Name", "Surname", "Patronymic", "Departmetn_id", "date_of_birth")
VALUES
(TEACHERS_NUMBER_SEQUENC.nextval, 'Ivan', 'Ivanov', 'Ivanovich', 1, TO_DATE('1980-05-10', 'YYYY-MM-DD'));
INSERT INTO "Teachers" ("teacher_number", "Name", "Surname", "Patronymic", "Departmetn_id", "date_of_birth")
VALUES
(TEACHERS_NUMBER_SEQUENC.nextval, 'Maria', 'Petrova', 'Sergeevna', 1, TO_DATE('1982-07-15', 'YYYY-MM-DD'));
INSERT INTO "Teachers" ("teacher_number", "Name", "Surname", "Patronymic", "Departmetn_id", "date_of_birth")
VALUES
(TEACHERS_NUMBER_SEQUENC.nextval, 'Alexey', 'Sidorov', 'Nikolaevich', 1, TO_DATE('1975-03-20', 'YYYY-MM-DD'));

-- Заполнение таблицы Grades
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES
(1, 1, 300064, 8, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES
(2, 1, 300064, 6, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES
(3, 1, 300064, 4, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES
(4, 1, 300064, 2, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES
(6, 1, 300064, 6, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES
(7, 1, 300064, 1, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(8, 1, 300064, 5, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(9, 1, 300065, 3, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(10, 1, 300065, 4, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(11, 1, 300065, 5, TO_DATE('1999-11-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(12, 1, 300065, 9, TO_DATE('1999-11-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(13, 1, 300065, 10, TO_DATE('1999-11-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(14, 1, 300065, 8, TO_DATE('1999-11-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(15, 1, 300066, 8, TO_DATE('1999-11-12', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(16, 1, 300066, 8, TO_DATE('1999-11-12', 'YYYY-MM-DD'), 300070);

-- Дополнительные данные для таблицы Grades
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES
(37, 2, 300064, 8, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(38, 2, 300066, 6, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(39, 2, 300066, 4, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(40, 3, 300067, 2, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(41, 3, 300067, 6, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(42, 2, 300067, 1, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(43, 3, 300064, 5, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(44, 2, 300064, 3, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(45, 2, 300064, 4, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 300070);
INSERT INTO "grades" ("id", "subject_id", "student_number", "grade", "exam_date", "teacher_number")
VALUES(46, 3, 300064, 5, TO_DATE('2022-10-10', 'YYYY-MM-DD'), 300070);

-- Добавление записей в таблицу Classes (1-10)
INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES
    (1, 1, 300070, 1, TO_DATE('2023-12-12', 'YYYY-MM-DD'));
   INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES  (2, 1, 300070, 1, TO_DATE('2023-12-13', 'YYYY-MM-DD'));
 INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES    (3, 1, 300070, 1, TO_DATE('2023-12-14', 'YYYY-MM-DD'));
    INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES (4, 1, 300070, 1, TO_DATE('2023-12-15', 'YYYY-MM-DD'));
   INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES  (5, 1, 300070, 1, TO_DATE('2023-12-16', 'YYYY-MM-DD'));
    INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES (6, 1, 300070, 1, TO_DATE('2023-12-17', 'YYYY-MM-DD'));
    INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES (7, 1, 300070, 1, TO_DATE('2023-12-18', 'YYYY-MM-DD'));
   INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES  (8, 1, 300070, 1, TO_DATE('2023-12-19', 'YYYY-MM-DD'));
   INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES  (9, 1, 300070, 1, TO_DATE('2023-12-20', 'YYYY-MM-DD'));
INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES     (10, 1, 300070, 1, TO_DATE('2023-12-21', 'YYYY-MM-DD'));

-- Добавление записей в таблицу Classes (11-20)
INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES
    (11, 1, 300070, 1, TO_DATE('2023-12-22', 'YYYY-MM-DD'));
   INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES  (12, 1, 300070, 1, TO_DATE('2023-12-23', 'YYYY-MM-DD'));
    INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES (13, 1, 300070, 1, TO_DATE('2023-12-24', 'YYYY-MM-DD'));
    INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES (14, 1, 300070, 1, TO_DATE('2023-12-25', 'YYYY-MM-DD'));
    INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES (15, 1, 300070, 1, TO_DATE('2023-12-26', 'YYYY-MM-DD'));
    INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES (16, 1, 300070, 1, TO_DATE('2023-12-27', 'YYYY-MM-DD'));
    INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES (17, 1, 300070, 1, TO_DATE('2023-12-28', 'YYYY-MM-DD'));
    INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES (18, 1, 300070, 1, TO_DATE('2023-12-29', 'YYYY-MM-DD'));
   INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES  (19, 1, 300070, 1, TO_DATE('2023-12-30', 'YYYY-MM-DD'));
   INSERT INTO "Classes" ("id", "subject_id", "teacher_id", "group_id", "date")
VALUES  (20, 1, 300070, 1, TO_DATE('2023-12-31', 'YYYY-MM-DD'));





-- 1
SELECT
    TO_CHAR("exam_date", 'MM') AS periodMONTH,
    AVG("grade") AS average_gradeByMonths,
    CEIL(TO_NUMBER(TO_CHAR("exam_date", 'MM')) / 4) AS periodQUARTER,
    AVG("grade") AS average_gradeByQuarter,
    TO_CHAR("exam_date", 'YYYY') AS periodYEAR,
    AVG("grade") AS average_grade
FROM "grades"
GROUP BY TO_CHAR("exam_date", 'YYYY'), CEIL(TO_NUMBER(TO_CHAR("exam_date", 'MM')) / 4), TO_CHAR("exam_date", 'MM'), "exam_date";


-- 2
--Вычисление средней успеваемости студентов за определенный период:
--•	средний балл;
--•	сравнение среднего балла со средним баллом по факультету (в %);
--•	сравнение среднего балла с наилучшим баллом (в %).

WITH AVG_GRADE_FACULTY AS (
    SELECT AVG(CAST("grade" AS DECIMAL(10, 2))) AS AVG_GRADE_FACULTY FROM "grades"
),
avgStud_FACULTY AS (
    SELECT "student_number", AVG(CAST("grade" AS DECIMAL(10, 2))) AS MAX_AVG_GRADE_FACULTY
    FROM "grades"
    GROUP BY "grades"."student_number"
),
best_faculty AS (
    SELECT MAX(MAX_AVG_GRADE_FACULTY) AS best_faculty FROM avgStud_FACULTY
)
SELECT * FROM (
    SELECT
        ROW_NUMBER() OVER (ORDER BY BEST_FACULTY.best_faculty) AS row_numb,
        "student_number",
        ROW_NUMBER() OVER (PARTITION BY "student_number" ORDER BY AVG(CAST("grade" AS DECIMAL(10, 2))) DESC) AS RowNum,
        AVG(CAST("grade" AS DECIMAL(10, 2))) AS AVG_STUDENT,
        AVG_GRADE_FACULTY.AVG_GRADE_FACULTY,
        AVG(CAST("grade" AS DECIMAL(10, 2))) / AVG_GRADE_FACULTY.AVG_GRADE_FACULTY * 100 AS "RANGE_FACULTY%",
        BEST_FACULTY.best_faculty,
        AVG(CAST("grade" AS DECIMAL(10, 2))) / BEST_FACULTY.best_faculty * 100 AS "best_FACULTY%"
    FROM
        "grades"
    CROSS JOIN
        AVG_GRADE_FACULTY, BEST_FACULTY
    GROUP BY
        "student_number"
) AS tablee
WHERE row_numb < 10;


            -- 3

            WITH StudentGrades AS (
    SELECT
        g."student_number",
        g."grade",
        g."exam_date",
        ROW_NUMBER() OVER (PARTITION BY g."student_number" ORDER BY g."exam_date" DESC) AS rn
    FROM "grades" g
)
SELECT
    sg."student_number",
    AVG(sg."grade") AS AverageGrade
FROM StudentGrades sg
WHERE sg.rn <= 3
GROUP BY sg."student_number";


--- 4

	WITH RankedGrades AS (
		SELECT
			g."subject_id",
			g."student_number",
			COUNT(*) as ExamCount,
			ROW_NUMBER() OVER (PARTITION BY g."subject_id" ORDER BY COUNT(*) DESC) as rn
		FROM "grades" g
		GROUP BY g."subject_id", g."student_number"
	)
	SELECT
		rg."subject_id",
		rg."student_number",
		rg.ExamCount
	FROM RankedGrades rg
	WHERE rg.rn = 1;

