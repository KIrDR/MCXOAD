select * from "teachers_salary";


insert into "Facultes"("id","faculty_shortName","fullName") values (1,'ПИ', 'программная инженерия') ;

insert into "Department"("id","faculty_id","fullName","shortName") values (1, 1, 'факультет информационных технологий ', 'ФИТ') ;


ALTER TABLE "Teachers"
ADD HIERARCHY_COLUMN VARCHAR2(4000);

ALTER TABLE "Teachers"
ADD PARENT_NODE VARCHAR2(4000);


CREATE OR REPLACE PROCEDURE ShowSubordinates(
    Node IN VARCHAR2
)
AS
BEGIN
    FOR Rec IN (
        SELECT
            t.HIERARCHY_COLUMN || '/' || t."teacher_number" AS HierarchyPath,
            LEVEL AS HierarchyLevel,
            t.*
        FROM "Teachers" t
        START WITH PARENT_NODE = Node
        CONNECT BY PRIOR HIERARCHY_COLUMN = PARENT_NODE
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'HierarchyPath: ' || Rec.HierarchyPath ||
            ', Other Columns: ' || Rec."Surname" || ' ' || Rec."Name"
        );
    END LOOP;
END;
/CREATE OR REPLACE PROCEDURE ShowSubordinates(
    Node IN VARCHAR2
)
AS
BEGIN
    FOR Rec IN (
        SELECT
            SYS_CONNECT_BY_PATH(HIERARCHY_COLUMN, '/') AS HierarchyPath,
            LEVEL AS HierarchyLevel,
            t.*
        FROM "Teachers" t
        WHERE CONNECT_BY_ISLEAF = 1
        START WITH PARENT_NODE = Node
        CONNECT BY PRIOR HIERARCHY_COLUMN = PARENT_NODE
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'HierarchyPath: ' || Rec.HierarchyPath ||
            ', HierarchyLevel: ' || Rec.HierarchyLevel ||
            ', Other Columns: ' || Rec."Surname" || ' ' || Rec."Name"

        );
    END LOOP;
END;
/
/


/

CREATE OR REPLACE PROCEDURE AddSubordinate(
    ParentNode IN VARCHAR2,
    NewNode IN VARCHAR2
)
AS
BEGIN
    INSERT INTO "Teachers"(
        "teacher_number",
        HIERARCHY_COLUMN,
        PARENT_NODE,
        "Surname",
        "Name",
        "Patronymic",
        "Departmetn_id",
        "date_of_birth"
    )
    VALUES (
        TEACHERS_NUMBER_SEQUENC.NEXTVAL,
        ParentNode || NewNode,
        ParentNode,
        'FirstName',
        'LastName',
        'otchectvo',
        1,
        TO_DATE('12-11-1988', 'DD-MM-YYYY')
    );
END;
/


CREATE OR REPLACE PROCEDURE MoveSubtree(
    SourceNode IN VARCHAR2,
    TargetNode IN VARCHAR2
)
AS
BEGIN
    UPDATE "Teachers"
    SET HIERARCHY_COLUMN = REPLACE(HIERARCHY_COLUMN, SourceNode, TargetNode)
    WHERE PARENT_NODE LIKE SourceNode || '%';
END;
/


-- Демонстрация работы процедуры AddSubordinate
begin

AddSubordinate('/', '/1/');
AddSubordinate('/', '/4/');
AddSubordinate('/1/', '/1/1/');
AddSubordinate('/1/', '/1/2/');
AddSubordinate('/4/', '/4/1/');

end;
select * from "Teachers";
begin
AddSubordinate('/1/2/1/', '/1/2/1/7/');
end;
-- Демонстрация работы процедуры ShowSubordinates
select HIERARCHY_COLUMN, "teacher_number" from "Teachers";

    begin
ShowSubordinates('/1/2/');
end;
    begin
ShowSubordinates('/1/');
end;

-- Демонстрация работы процедуры MoveSubtree
begin
     MoveSubtree('/4/', '/1/2/1/7/');
end;

select * from "Teachers";
