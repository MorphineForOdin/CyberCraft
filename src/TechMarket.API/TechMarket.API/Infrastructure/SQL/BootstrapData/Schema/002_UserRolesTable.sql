--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM sys.tables
    WHERE name = 'UserRoles'
        AND SCHEMA_NAME(schema_id) = 'dbo')
    BEGIN
        DROP TABLE dbo.UserRoles;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.UserRoles (
	[Id] INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_UserRoles PRIMARY KEY,
	[Name] NVARCHAR(20) NOT NULL
);
GO
--============================================================================