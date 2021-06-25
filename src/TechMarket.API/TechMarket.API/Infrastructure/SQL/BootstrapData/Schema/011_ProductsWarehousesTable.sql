--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
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
		CONSTRAINT FK_ProductsWarehouses_Products FOREIGN KEY REFERENCES dbo.Products([Id]),
	[WarehouseId] INT NOT NULL
		CONSTRAINT FK_ProductsWarehouses_Warehouses FOREIGN KEY REFERENCES dbo.Warehouses([Id]),
	[Quantity] INT NOT NULL
		CONSTRAINT CH_ProductsWarehouses_Quantity CHECK ([Quantity] > 0),

	CONSTRAINT PK_ProductsWarehouses PRIMARY KEY ([ProductId], [WarehouseId])
);
GO
--============================================================================