--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
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
		CONSTRAINT PK_OrderProducts PRIMARY KEY,
	[OrderId] INT NOT NULL
		CONSTRAINT FK_OrderProducts_Orders FOREIGN KEY REFERENCES dbo.Orders([Id]),
	[ProductId] INT NOT NULL
		CONSTRAINT FK_OrderProducts_Products FOREIGN KEY REFERENCES dbo.Products([Id]),
	[Quantity] INT NOT NULL
		CONSTRAINT CH_OrderProducts_Quantity CHECK ([Quantity] > 0)
);
GO
--============================================================================