USE [TechMarket];
GO

IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'ProductsWarehouses'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.ProductsWarehouses;
	END
GO
------------------------------------------------------------------------------

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.ProductsWarehouses (
	[ProductId] INT NOT NULL
		CONSTRAINT FK_Products_Id FOREIGN KEY REFERENCES dbo.Products([Id]),
	[WarehouseId] INT NOT NULL
		CONSTRAINT FK_Warehouses_Id FOREIGN KEY REFERENCES dbo.Warehouses([Id]),
	[Quantity] INT NOT NULL,

	CONSTRAINT PK_ProductsWarehouses PRIMARY KEY ([ProductId], [WarehouseId])
);
GO
--============================================================================