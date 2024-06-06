
-- Заполнение таблицы Facultes
INSERT INTO Facultes (id, faculty_shortName, fullName)
VALUES (1, 'FIT', 'Faculty of Information Technologies');

-- Заполнение таблицы Department
INSERT INTO Department (id, faculty_id, fullName, shortName)
VALUES (1, 1, 'Department of Computer Science', 'CS');

-- Заполнение таблицы Specializations
INSERT INTO Specializations (id, spec_kode, faculty_id, department_id, fullName, shortName)
VALUES 
(1, 'CS-001', 1, 1, 'Computer Science', 'CS'),
(2, 'SE-001', 1, 1, 'Software Engineering', 'SE'),
(3, 'IS-001', 1, 1, 'Information Systems', 'IS');


-- Заполнение таблицы Groups
INSERT INTO Groups (id, faculty_id, group_name, curator)
VALUES 
(1, 1, 'CS-101', 1),
(2, 1, 'SE-101', 2),
(3, 1, 'IS-101', 3);

INSERT INTO Students (student_number, group_id, Name, Surname, patronymic, department_id, faculty_id, specialization_id, date_of_birth, date_of_admission, date_of_expulsion)
VALUES 
(next value for teachers_ticket_number_sequence, 1, 'John2', 'Doe2', 'Ivanovich2', 1, 1, 1, '1990-01-01', '2019-09-01', '2023-06-30'),
(next value for teachers_ticket_number_sequence, 1, 'Jane2', 'Smith2', 'Petrovna2', 1, 1, 2, '1991-02-02', '2019-09-01', '2023-06-30'),
(next value for teachers_ticket_number_sequence, 1, 'Student2-1', 'Surname2-1', 'Patronymic2-1', 1, 1, 1, '1993-04-04', '2019-09-01', '2023-06-30'),
(next value for teachers_ticket_number_sequence, 1, 'Student2-2', 'Surname2-2', 'Patronymic2-2', 1, 1, 2, '1994-05-05', '2019-09-01', '2023-06-30'),
(next value for teachers_ticket_number_sequence, 1, 'Student2-3', 'Surname2-3', 'Patronymic2-3', 1, 1, 1, '1995-06-06', '2019-09-01', '2023-06-30'),
(next value for teachers_ticket_number_sequence, 1, 'Student2-4', 'Surname2-4', 'Patronymic2-4', 1, 1, 2, '1996-07-07', '2019-09-01', '2023-06-30')


INSERT INTO Students (student_number, group_id, Name, Surname, patronymic, department_id, faculty_id, specialization_id, date_of_birth, date_of_admission, date_of_expulsion)
VALUES 
(next value for teachers_ticket_number_sequence, 2, 'John3', 'Doe3', 'Ivanovich3', 1, 1, 1, '1990-01-01', '2019-09-01', '2023-06-30'),
(next value for teachers_ticket_number_sequence, 2, 'Jane3', 'Smith3', 'Petrovna3', 1, 1, 2, '1991-02-02', '2019-09-01', '2023-06-30'),
(next value for teachers_ticket_number_sequence, 2, 'Student3-1', 'Surname3-1', 'Patronymic3-1', 1, 1, 1, '1993-04-04', '2019-09-01', '2023-06-30'),
(next value for teachers_ticket_number_sequence, 2, 'Student3-2', 'Surname3-2', 'Patronymic3-2', 1, 1, 2, '1994-05-05', '2019-09-01', '2023-06-30'),
(next value for teachers_ticket_number_sequence, 2, 'Student3-3', 'Surname3-3', 'Patronymic3-3', 1, 1, 1, '1995-06-06', '2019-09-01', '2023-06-30'),
(next value for teachers_ticket_number_sequence, 2, 'Student3-4', 'Surname3-4', 'Patronymic3-4', 1, 1, 2, '1996-07-07', '2019-09-01', '2023-06-30')



-- Заполнение таблицы Subjects
INSERT INTO Subjects (id, departnemt_id, fullName, shortName, amount_of_hours)
VALUES 
(1, 1, 'Database Management', 'DBMS', 60),
(2, 1, 'Software Engineering', 'SE', 45),
(3, 1, 'Algorithms and Data Structures', 'ADS', 75);


-- Заполнение таблицы Teachers
INSERT INTO Teachers (teacher_number, Name, Surname, Patronymic, Departmetn_id, date_of_birth)
VALUES 
(next value for teachers_ticket_number_sequence, 'Ivan', 'Ivanov', 'Ivanovich', 1, '1980-05-10'),
(next value for teachers_ticket_number_sequence, 'Maria', 'Petrova', 'Sergeevna', 1, '1982-07-15'),
(next value for teachers_ticket_number_sequence, 'Alexey', 'Sidorov', 'Nikolaevich', 1, '1975-03-20');



insert into grades (id,subject_id, student_number, grade, exam_date, teacher_number) 
values 
(1,1,300007, 8,'2023-12-12',300022),
(2,1,300008, 6,'2023-12-12',300022),
(3,1,300009, 4,'2023-12-12',300022),
(4,1,300010, 2,'2023-12-12',300022),
(6,1,300011, 6,'2023-12-12',300022),
(7,1,300012, 1,'2023-12-12',300022),
(8,1,300013, 5,'2023-12-12',300022),
(9,1,300014, 3,'2023-12-12',300022),
(10,1,300015, 4,'2023-12-12',300022),
(11,1,300016, 5,'1999-11-12',300022),
(12,1,300017, 9,'1999-11-12',300022),
(13,1,300018, 10,'1999-11-12',300022),
(14,1,300019, 8,'1999-11-12',300022),
(15,1,300020, 8,'1999-11-12',300022),
(16,1,300021, 8,'1999-11-12',300022)

-- Заполнение таблицы Grades
INSERT INTO Grades (id, subject_id, student_number, grade, exam_date, teacher_number) 
VALUES 
(27, 2, 300009, 8, '2023-10-05', 300023),
(28, 2, 300010, 6, '2023-10-05', 300023),
(29, 2, 300012, 4, '2023-10-05', 300023),
(30, 3, 300015, 2, '2023-10-05', 300023),
(31, 3, 300016, 6, '2023-10-05', 300023),
(32, 2, 300017, 1, '2023-10-05', 300023),
(33, 3, 300018, 5, '2023-10-05', 300023),
(34, 2, 300019, 3, '2023-10-05', 300023),
(35, 2, 300010, 4, '2023-10-05', 300023),
(36, 3, 300011, 5, '2022-10-10', 300023);

INSERT INTO Grades (id, subject_id, student_number, grade, exam_date, teacher_number) 
VALUES 
(37, 2, 300009, 8, '2023-10-05', 300023),
(38, 2, 300010, 6, '2023-10-05', 300023),
(39, 2, 300012, 4, '2023-10-05', 300023),
(40, 3, 300015, 2, '2023-10-05', 300023),
(41, 3, 300016, 6, '2023-10-05', 300023),
(42, 2, 300017, 1, '2023-10-05', 300023),
(43, 3, 300018, 5, '2023-10-05', 300023),
(44, 2, 300019, 3, '2023-10-05', 300023),
(45, 2, 300010, 4, '2023-10-05', 300023),
(46, 3, 300011, 5, '2022-10-10', 300023);


------------------------


-- Вычисление средней успеваемости студентов помесячно, за квартал, за полгода, за год.
SELECT distinct
    YEAR(exam_date) AS Год,
    CASE 
        WHEN MONTH(exam_date) BETWEEN 1 AND 6 THEN 1
        WHEN MONTH(exam_date) BETWEEN 7 AND 12 THEN 2
    END AS Полгода,
    DATEPART(QUARTER, exam_date) AS Квартал,
    MONTH(exam_date) AS Месяц,
    sum(grade) AS СредняяОценка
FROM [grades]
GROUP BY ROLLUP (
    YEAR(exam_date),
    CASE 
        WHEN MONTH(exam_date) BETWEEN 1 AND 6 THEN 1
        WHEN MONTH(exam_date) BETWEEN 7 AND 12 THEN 2
    END,
    DATEPART(QUARTER, exam_date),
    MONTH(exam_date)
)
ORDER BY 
    Год DESC,
    Полгода DESC,
    Квартал DESC,
    Месяц DESC;





SELECT
    DATEPART(MONTH, exam_date) AS periodMONTH,
    AVG(grade) AS average_gradeByMonths,
	DATEPART(QUARTER, exam_date) AS periodQUARTER,
    AVG(grade) AS average_gradeByQuarter,
	DATEPART(YEAR, exam_date) AS periodYEAR,
    AVG(grade) AS average_grade
FROM Grades
GROUP BY DATEPART(YEAR, exam_date),DATEPART(QUARTER, exam_date), DATEPART(MONTH, exam_date);
--rollup 

--Вычисление средней успеваемости студентов за определенный период:
--•	средний балл;
--•	сравнение среднего балла со средним баллом по факультету (в %);
--•	сравнение среднего балла с наилучшим баллом (в %).
			 WITH AVG_GRADE_FACULTY AS (
			 SELECT AVG(CAST(GRADE AS DECIMAL(10, 2))) AS AVG_GRADE_FACULTY FROM grades
					),
			avgStud_FACULTY AS (
			SELECT student_number, avg(CAST(GRADE AS DECIMAL(10, 2))) as
			MAX_AVG_GRADE_FACULTY FROM grades group by grades.student_number 
			),
			best_faculty as( 
			select max(MAX_AVG_GRADE_FACULTY) as best_faculty from avgStud_FACULTY)
SELECT * from(
select
	ROW_NUMBER() over(order by BEST_FACULTY.best_faculty) as row_numb,
	student_number ,
	ROW_NUMBER() OVER (PARTITION BY student_number ORDER BY AVG(CAST(GRADE AS DECIMAL(10, 2))) DESC) AS RowNum,
    AVG(CAST(GRADE AS DECIMAL(10, 2))) AS AVG_STUDENT,
    AVG_GRADE_FACULTY.AVG_GRADE_FACULTY,
    AVG(CAST(GRADE AS DECIMAL(10, 2))) / AVG_GRADE_FACULTY.AVG_GRADE_FACULTY * 100 AS "RANGE_FACULTY%",
	BEST_FACULTY.best_faculty ,
	AVG(CAST(GRADE AS DECIMAL(10, 2))) / BEST_FACULTY.best_faculty * 100 AS "best_FACULTY%"
FROM 
    grades 
CROSS JOIN 
    AVG_GRADE_FACULTY, BEST_FACULTY
GROUP BY 
    grades.student_number, AVG_GRADE_FACULTY.AVG_GRADE_FACULTY,BEST_FACULTY.best_faculty
	) as tablee
	where row_numb < 10 ;

	-- Вернуть для каждого студента средние баллы по трем предметам, которые изучались последними.
	select * from Subjects;
	select * from teachers;
	select * from Students;
	select * from Groups;
	select * from Classes; 
	select * from grades; 
	INSERT INTO Classes (id, subject_id, teacher_id, group_id, date) VALUES 
    (1, 1, 300023, 1, '2023-12-12'),
    (2, 1, 300023, 1, '2023-12-13'),
    (3, 1, 300023, 1, '2023-12-14'),
    (4, 1, 300023, 1, '2023-12-15'),
    (5, 1, 300023, 1, '2023-12-16'),
    (6, 1, 300023, 1, '2023-12-17'),
    (7, 1, 300023, 1, '2023-12-18'),
    (8, 1, 300023, 1, '2023-12-19'),
    (9, 1, 300023, 1, '2023-12-20'),
    (10, 1, 300023, 1, '2023-12-21'),
    (11, 1, 300023, 1, '2023-12-22'),
    (12, 1, 300023, 1, '2023-12-23'),
    (13, 1, 300023, 1, '2023-12-24'),
    (14, 1, 300023, 1, '2023-12-25'),
    (15, 1, 300023, 1, '2023-12-26'),
    (16, 1, 300023, 1, '2023-12-27'),
    (17, 1, 300023, 1, '2023-12-28'),
    (18, 1, 300023, 1, '2023-12-29'),
    (19, 1, 300023, 1, '2023-12-30'),
    (20, 1, 300023, 1, '2023-12-31');	
	INSERT INTO Classes (id, subject_id, teacher_id, group_id, date) VALUES 
    (21, 2, 300023, 2, '2023-12-12'),
    (22, 2, 300023, 2, '2023-12-13'),
    (23, 2, 300023, 2, '2023-12-14'),
    (24, 2, 300023, 2, '2023-12-15'),
    (25, 2, 300023, 2, '2023-12-16'),
    (26, 2, 300023, 2, '2023-12-17'),
    (27, 3, 300023, 2, '2023-12-18'),
    (28, 3, 300023, 2, '2023-12-19'),
    (29, 3, 300023, 2, '2023-12-20'),
    (30, 2, 300023, 2, '2023-12-21'),
    (31, 3, 300023, 2, '2023-12-22'),
    (32, 2, 300023, 2, '2023-12-23'),
    (33, 2, 300023, 2, '2023-12-24'),
    (34, 3, 300023, 2, '2023-12-25'),
    (35, 3, 300023, 2, '2023-12-26'),
    (36, 3, 300023, 2, '2023-12-27'),
    (37, 3, 300023, 2, '2023-12-28'),
    (38, 2, 300023, 2, '2023-12-29'),
    (39, 3, 300023, 1, '2023-12-30'),
    (40, 2, 300023, 2, '2023-12-31');
	
		-- Вернуть для каждого студента средние баллы по трем предметам, которые изучались последними.
		select  *
		from Students join Groups on Groups.id = group_id join 
		classes on Groups.id = Classes.group_id  join
		grades on grades.student_number = students.student_number;
	
	WITH RankedSubjects AS (
			SELECT
				student_number,
				grades.subject_id,
				AVG(CAST(grade AS DECIMAL(10, 2))) AS avg_grade,
				ROW_NUMBER() OVER (PARTITION BY student_number ORDER BY MAX(date) DESC) AS rn
			FROM
				classes
			JOIN
				Teachers ON Classes.teacher_id = Teachers.teacher_number 
			join 
				grades on Teachers.teacher_number = grades.teacher_number
			GROUP BY
				student_number,  grades.subject_id
)SELECT
    Students.*,
    Groups.group_name,
    RankedSubjects.subject_id,
    RankedSubjects.avg_grade
FROM
    Students
JOIN
    Groups ON Students.group_id = Groups.id
JOIN
    RankedSubjects ON Students.student_number = RankedSubjects.student_number
WHERE
    rn <= 3;



	WITH RankedSubjects AS (
    SELECT
        student_number,
        grades.subject_id,
        ROW_NUMBER() OVER (PARTITION BY student_number ORDER BY MAX(date) DESC) AS rn
    FROM
    	classes
			JOIN
				Teachers ON Classes.teacher_id = Teachers.teacher_number 
			join 
				grades on Teachers.teacher_number = grades.teacher_number
			GROUP BY
				student_number,  grades.subject_id
)
SELECT
    Students.student_number,
    RankedSubjects.subject_id AS subject_1,
    (SELECT subject_id FROM RankedSubjects WHERE student_number = Students.student_number AND rn = 2) AS subject_2,
    (SELECT subject_id FROM RankedSubjects WHERE student_number = Students.student_number AND rn = 3) AS subject_3
FROM
    Students
JOIN
    RankedSubjects ON Students.student_number = RankedSubjects.student_number;



	WITH RankedSubjects AS (
    SELECT
        student_number,
        grades.subject_id,
        ROW_NUMBER() OVER (PARTITION BY student_number ORDER BY MAX(date) DESC) AS rn
    FROM
    	classes
			JOIN
				Teachers ON Classes.teacher_id = Teachers.teacher_number 
			join 
				grades on Teachers.teacher_number = grades.teacher_number
			GROUP BY
				student_number,  grades.subject_id
)
SELECT
    Students.student_number,
    MAX(CASE WHEN rn = 1 THEN subject_id END) AS subject_1,
    MAX(CASE WHEN rn = 2 THEN subject_id END) AS subject_2,
    MAX(CASE WHEN rn = 3 THEN subject_id END) AS subject_3
FROM
    Students
JOIN
    RankedSubjects ON Students.student_number = RankedSubjects.student_number
GROUP BY
    Students.student_number;

	------------- 3
		-- Вернуть для каждого студента средние баллы по трем предметам, которые изучались последними.
WITH StudentGrades AS (
    SELECT 
        g.student_number, 
        g.Grade, 
        g.exam_date,
        ROW_NUMBER() OVER (PARTITION BY g.student_number ORDER BY g.exam_date DESC) as rn
    FROM Grades g
)
SELECT 
    sg.student_number, 
    AVG(sg.Grade) as AverageGrade
FROM StudentGrades sg
WHERE sg.rn <= 3
GROUP BY sg.student_number;

---- 3.1 	Продемонстрируйте применение функции ранжирования ROW_NUMBER() 
-- для разбиения результатов запроса на страницы (по 20 строк на каждую страницу).
WITH StudentGrades AS (
    SELECT 
        g.student_number, 
        g.Grade, 
        g.exam_date,
        ROW_NUMBER() OVER (PARTITION BY g.student_number ORDER BY g.exam_date DESC) as rn
    FROM Grades g
)
, RankedStudents AS (
    SELECT 
        sg.student_number, 
        AVG(sg.Grade) as AverageGrade,
        ROW_NUMBER() OVER (ORDER BY MAX(sg.exam_date) DESC) as page_number
    FROM StudentGrades sg
    WHERE sg.rn <= 3
    GROUP BY sg.student_number
)
SELECT 
    student_number, 
    AverageGrade
FROM RankedStudents
WHERE page_number <= 5;



-- 3.2	Продемонстрируйте применение функции ранжирования ROW_NUMBER() для удаления дубликатов.
-- Создаем временную таблицу
INSERT INTO Grades (id, subject_id, student_number, grade, exam_date, teacher_number) 
VALUES 
(67, 2, 300009, 8, '2023-10-05', 300023),
(68, 2, 300009, 8, '2023-10-05', 300023)
(48, 2, 300010, 6, '2023-10-05', 300023),
(49, 2, 300012, 4, '2023-10-05', 300023),
(50, 3, 300015, 2, '2023-10-05', 300023),
(51, 3, 300016, 6, '2023-10-05', 300023),
(52, 2, 300017, 1, '2023-10-05', 300023),
(53, 3, 300018, 5, '2023-10-05', 300023),
(54, 2, 300019, 3, '2023-10-05', 300023),
(55, 2, 300010, 4, '2023-10-05', 300023),
(56, 3, 300011, 5, '2022-10-10', 300023);


drop table #RankedStudents; 
CREATE TABLE #RankedStudents (
    student_number INT,
    AverageGrade FLOAT,
    rn INT
);


select * from grades; 
-- Заполняем временную таблицу
INSERT INTO #RankedStudents (student_number, AverageGrade, rn)
SELECT rg.student_number, AVG(rg.Grade) as AverageGrade, rg.rn
FROM (
    SELECT 
        g.student_number, 
        g.Grade,
        ROW_NUMBER() OVER (PARTITION BY g.student_number ORDER BY g.exam_date DESC) as rn
    FROM Grades g
) rg
WHERE rg.rn <= 3
GROUP BY rg.student_number, rg.rn
ORDER BY rg.student_number, rg.rn
OFFSET 0 ROWS FETCH NEXT 20 ROWS ONLY;


SELECT * FROM #RankedStudents; 
select * from grades;
-- Удаляем дубликаты из основной таблицы через временную таблицу
DELETE rs
FROM  #RankedStudents rs
WHERE rs.rn > 1;



-- Удаляем временную таблицу
DROP TABLE #RankedStudents;




---4 
-- Какой студент сдавал экзамен наибольшее число раз по определенному предмету? Вернуть для всех предметов.

	WITH RankedGrades AS (
		SELECT 
			g.subject_id, 
			g.student_number, 
			COUNT(*) as ExamCount,
			ROW_NUMBER() OVER (PARTITION BY g.subject_id ORDER BY COUNT(*) DESC) as rn
		FROM Grades g
		GROUP BY g.subject_id, g.student_number
	)
	SELECT 
		rg.subject_id, 
		rg.student_number, 
		rg.ExamCount
	FROM RankedGrades rg
	WHERE rg.rn = 1;


