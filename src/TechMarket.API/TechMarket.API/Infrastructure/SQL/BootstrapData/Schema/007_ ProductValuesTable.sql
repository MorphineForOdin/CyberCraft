--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
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
		CONSTRAINT PK_ProductValue PRIMARY KEY,
	[AttributeId] INT NOT NULL
		CONSTRAINT FK_ProductValues_ProductAttributes FOREIGN KEY REFERENCES dbo.ProductAttributes([Id]),
	[Value] NVARCHAR(50) NOT NULL
);
GO
--============================================================================