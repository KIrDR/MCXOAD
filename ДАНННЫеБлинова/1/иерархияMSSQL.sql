
  
CREATE SEQUENCE teachers_ticket_number_sequence
  START WITH 300000
  INCREMENT BY 1
  MAXVALUE 999999;



-- Добавляем столбец иерархического типа

ALTER TABLE Teachers
ADD HIERARCHY_COLUMN HIERARCHYID;

go

CREATE PROCEDURE ShowSubordinates
@Node HIERARCHYID
AS
BEGIN
    SELECT
        HIERARCHY_COLUMN.ToString() AS HierarchyPath,
        LEVEL = HIERARCHY_COLUMN.GetLevel(),
        * -- Выбираем все остальные столбцы по вашему усмотрению
    FROM Teachers
    WHERE HIERARCHY_COLUMN.IsDescendantOf(@Node) = 1;
END;
go

--drop procedure AddSubordinate; 
CREATE PROCEDURE AddSubordinate
@ParentNode HIERARCHYID,
@NewNode HIERARCHYID
AS
BEGIN
    INSERT INTO Teachers(teacher_number,HIERARCHY_COLUMN,Surname,Name,Patronymic, Departmetn_id,date_of_birth)
    VALUES (next value for teachers_ticket_number_sequence ,@ParentNode.GetDescendant(@NewNode, NULL), 'FirstName', 'LastName','otchectvo', 1, '12-11-1988' );
END;
go

--drop procedure MoveSubtree
CREATE PROCEDURE MoveSubtree
@SourceNode HIERARCHYID,
@TargetNode HIERARCHYID
AS
BEGIN

    UPDATE Teachers
    SET HIERARCHY_COLUMN = HIERARCHY_COLUMN.GetReparentedValue(@SourceNode, @TargetNode)
    WHERE HIERARCHY_COLUMN.IsDescendantOf(@SourceNode) = 1;
END;
go



EXEC ShowSubordinates '/';
EXEC AddSubordinate '/', '/1/';
EXEC AddSubordinate '/', '/4/';
EXEC AddSubordinate '/2/', '/2/0/';
EXEC AddSubordinate '/2/', '/2/1/';
EXEC AddSubordinate '/2/1/', '/2/1/0/';
EXEC AddSubordinate '/2/1/', '/2/1/1/';
EXEC ShowSubordinates '/2/';

EXEC ShowSubordinates '/5/';


EXEC MoveSubtree '/2/', '/5/1/';
EXEC ShowSubordinates '/5/';

go


insert into Facultes(id,faculty_shortName,fullName) values (1,'ПИ', 'программная инженерия') ; 

insert into Department(id,faculty_id,fullName,shortName) values (1, 1, 'факультет информационных технологий ', 'ФИТ') ; 


