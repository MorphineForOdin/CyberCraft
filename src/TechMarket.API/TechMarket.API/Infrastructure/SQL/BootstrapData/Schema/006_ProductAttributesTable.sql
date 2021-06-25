--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'ProductAttributes'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.ProductAttributes;
	END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.ProductAttributes (
	[Id] INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_ProductAttributes PRIMARY KEY,
	[Name] NVARCHAR(30) NOT NULL
);
GO
--============================================================================