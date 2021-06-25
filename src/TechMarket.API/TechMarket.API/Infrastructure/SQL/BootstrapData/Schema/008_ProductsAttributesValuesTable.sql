--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'ProductsAttributesValues'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.ProductsAttributesValues;
	END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.ProductsAttributesValues (
	[ProductId] INT NOT NULL
		CONSTRAINT FK_ProductsAttributesValues_Products REFERENCES dbo.Products([Id]),
	[AttributeId] INT NOT NULL
		CONSTRAINT FK_ProductsAttributesValues_ProductAttributes REFERENCES dbo.ProductAttributes([Id]),
	[ValueId] INT NOT NULL
		CONSTRAINT FK_ProductsAttributesValues_ProductValues REFERENCES dbo.ProductValues([Id]),
		
	CONSTRAINT PK_ProductsAttributesValues PRIMARY KEY ([ProductId], [AttributeId], [ValueId])
);
GO
--============================================================================