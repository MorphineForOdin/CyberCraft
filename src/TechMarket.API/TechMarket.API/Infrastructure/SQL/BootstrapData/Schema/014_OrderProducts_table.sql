USE [TechMarket];
GO

IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'OrderProducts'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.OrderProducts;
	END
GO
------------------------------------------------------------------------------

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.OrderProducts (
	[Id] INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_OrderProducts_Id PRIMARY KEY,
	[OrderId] INT
		CONSTRAINT FK_OrderProducts_OrderId FOREIGN KEY (OrderId) REFERENCES dbo.Orders([Id]),
	[ProductId] INT
		CONSTRAINT FK_OrderProducts_ProductId FOREIGN KEY (ProductId) REFERENCES dbo.Products([Id]),
	[Quantuty] INT
);
GO
--============================================================================