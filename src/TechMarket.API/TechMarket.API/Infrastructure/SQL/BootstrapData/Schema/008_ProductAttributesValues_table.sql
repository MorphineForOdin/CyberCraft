USE [TechMarket];
GO

IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'ProductAttributesValues'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.ProductAttributesValues;
	END
GO
------------------------------------------------------------------------------

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.ProductAttributesValues (
	[ProductId] INT NOT NULL
		CONSTRAINT FK_ProductAttributesValues_ProductId FOREIGN KEY (ProductId) REFERENCES dbo.Products([Id]),
	[AttributeId] INT NOT NULL
		CONSTRAINT FK_ProductAttributesValues_AttributeId FOREIGN KEY (AttributeId) REFERENCES dbo.ProductAttributes([Id]),
	[ValueId] INT NOT NULL
		CONSTRAINT FK_ProductAttributesValues_ValueId FOREIGN KEY (ValueId) REFERENCES dbo.ProductValues([Id]),
		
	CONSTRAINT PK_ProductAttributesValues_Id PRIMARY KEY ([ProductId], [AttributeId], [ValueId])
);
GO
--============================================================================