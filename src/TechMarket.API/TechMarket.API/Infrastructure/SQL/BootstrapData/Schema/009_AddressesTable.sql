--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'Addresses'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.Addresses;
	END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.Addresses (
	[Id] INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_Addresses PRIMARY KEY,
	[Name] NVARCHAR(30) NOT NULL,
	[Country] NVARCHAR(30) NOT NULL,
	[City] NVARCHAR(30) NOT NULL,
	[Address] NVARCHAR(100) NOT NULL,
	[ContactInfo] NVARCHAR(100) NOT NULL
);
GO
--============================================================================