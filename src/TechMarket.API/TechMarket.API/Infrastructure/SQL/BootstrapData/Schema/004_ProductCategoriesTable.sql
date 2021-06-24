USE [TechMarket];
GO

IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'ProductCategories'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.ProductCategories;
	END
GO
------------------------------------------------------------------------------

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.ProductCategories (
	[Id] INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_ProductCategories_Id PRIMARY KEY,
	[Name] NVARCHAR(30) NOT NULL,
	[ParentId] INT NOT NULL
		CONSTRAINT FK_ProductCategories_ParentId REFERENCES dbo.ProductCategories([Id]),
	
	CONSTRAINT CH_ProductCategories_Id CHECK ([Id] <> [ParentId])
);
GO
--============================================================================