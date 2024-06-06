use Test

exec sp_configure 'show advanced options', 1;
go 
reconfigure
go 
exec sp_configure 'clr enabled',1;
exec sp_configure 'clr strict security', 0

DECLARE @result FLOAT;
EXEC dbo.CalculateAverageWithoutMinMax
    @values = '1,2,3,4,5',
    @result = @result OUTPUT;
SELECT @result AS Result;

DECLARE @result FLOAT;
EXEC dbo.CalculateAverageWithoutMinMax
    @values = '10,11,12,13,14',
    @result = @result OUTPUT;
SELECT @result AS Result;



DECLARE @result FLOAT;

SELECT @result = dbo.CalculateAverageWithoutx('1,2,3,4,5');

SELECT @result AS Result;


CREATE TABLE PassportTable
(
    ID INT PRIMARY KEY,
    Passport PassportData
);

INSERT INTO PassportTable (ID, Passport)
VALUES (1, 'AB 123456');
INSERT INTO PassportTable (ID, Passport)
VALUES (2, 'AB 999996');

INSERT INTO PassportTable (ID, Passport)
VALUES (3, 'HN 999996');

INSERT INTO PassportTable (ID, Passport)
VALUES (4, 'YH 999996');

SELECT * FROM PassportTable;
