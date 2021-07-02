--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'Users'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.Users;
	END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.Users (
	[Id] INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_Users PRIMARY KEY,
	[FirstName] NVARCHAR(20) NOT NULL,
	[LastName] NVARCHAR(20) NOT NULL,
	[RoleId] INT NOT NULL
		CONSTRAINT FK_Users_UserRoles FOREIGN KEY REFERENCES dbo.UserRoles([Id]),
	[Email] NVARCHAR(40) NOT NULL,
	[Password] NVARCHAR(100) NOT NULL
);
GO
--============================================================================