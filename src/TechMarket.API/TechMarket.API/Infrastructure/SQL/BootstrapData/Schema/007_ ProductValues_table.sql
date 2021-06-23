USE [TechMarket];
GO

IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'ProductValues'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.ProductValues;
	END
GO
------------------------------------------------------------------------------

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.ProductValues (
	[Id] INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_ProductValue_Id PRIMARY KEY (Id),
	[Attribute] INT NOT NULL
		CONSTRAINT FK_ProductValue_Attribute FOREIGN KEY (Attribute) REFERENCES dbo.ProductAttributes([Id]),
	[Name] NVARCHAR(30) NOT NULL
);
GO
--============================================================================