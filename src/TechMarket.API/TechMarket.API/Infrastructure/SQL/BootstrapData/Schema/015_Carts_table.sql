USE [TechMarket];
GO

IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'Carts'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.Carts;
	END
GO
------------------------------------------------------------------------------

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.Carts (
	[UserId] INT
		CONSTRAINT FK_Carts_UserId FOREIGN KEY (UserId) REFERENCES dbo.Users([Id]),
	[ProductId] INT
		CONSTRAINT FK_Carts_ProductId FOREIGN KEY (ProductId) REFERENCES dbo.Products([Id]),
	[Quantuty] INT,
	TotalAmount DECIMAL(10,2) NOT NULL,
		
	CONSTRAINT PK_Carts PRIMARY KEY ([UserId], [ProductId])
);
GO
--============================================================================