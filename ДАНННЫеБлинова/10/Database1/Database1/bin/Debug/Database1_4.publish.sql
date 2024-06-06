/*
Скрипт развертывания для laba10telephone

Этот код был создан программным средством.
Изменения, внесенные в этот файл, могут привести к неверному выполнению кода и будут потеряны
в случае его повторного формирования.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "laba10telephone"
:setvar DefaultFilePrefix "laba10telephone"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Проверьте режим SQLCMD и отключите выполнение скрипта, если режим SQLCMD не поддерживается.
Чтобы повторно включить скрипт после включения режима SQLCMD выполните следующую инструкцию:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Для успешного выполнения этого скрипта должен быть включен режим SQLCMD.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Идет создание Определяемый пользователем тип [dbo].[PhoneNumber]…';


GO
CREATE TYPE [dbo].[PhoneNumber]
     EXTERNAL NAME [Database1].[PhoneNumber];


GO
PRINT N'Идет создание Процедура [dbo].[WriteDataToFile]…';


GO
CREATE PROCEDURE [dbo].[WriteDataToFile]
@data NVARCHAR (MAX) NULL, @filePath NVARCHAR (MAX) NULL
AS EXTERNAL NAME [Database1].[FileIO].[WriteDataToFile]


GO
PRINT N'Обновление завершено.';


GO
