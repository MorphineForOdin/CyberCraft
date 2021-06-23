USE [TechMarket];
GO

IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'ProductWarehouse'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.ProductWarehouse;
	END
GO
------------------------------------------------------------------------------

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.ProductWarehouse (
	[ProductId] INT
		CONSTRAINT FK_ProductWarehouse_ProductId FOREIGN KEY (ProductId) REFERENCES dbo.Products([Id]),
	[WarehouseId] INT
		CONSTRAINT FK_ProductWarehouse_WarehouseId FOREIGN KEY (WarehouseId) REFERENCES dbo.Warehouses([Id]),
	[Quantity] INT

	CONSTRAINT PK_ProductWarehouse PRIMARY KEY ([ProductId], [WarehouseId])
);
GO
--============================================================================