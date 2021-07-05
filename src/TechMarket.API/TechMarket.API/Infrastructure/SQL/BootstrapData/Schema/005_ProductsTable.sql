--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'Products'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.Products;
	END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.Products (
	[Id] INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_Products PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(400) NOT NULL,
    [ImageUrl] NVARCHAR(200) NOT NULL,
	[CategoryId] INT NOT NULL
		CONSTRAINT FK_Products_ProductCategories FOREIGN KEY REFERENCES dbo.ProductCategories([Id]),
	[Price] DECIMAL(10, 2) NOT NULL
        CONSTRAINT CH_Products_Price CHECK ([Price] > 0)
);
GO
--============================================================================