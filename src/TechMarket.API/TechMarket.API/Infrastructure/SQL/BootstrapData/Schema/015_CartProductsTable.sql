--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'CartProducts'
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
CREATE TABLE dbo.CartProducts (
	[UserId] INT NOT NULL
		CONSTRAINT FK_CartProducts_Users FOREIGN KEY REFERENCES dbo.Users([Id]),
	[ProductId] INT NOT NULL
		CONSTRAINT FK_CartProducts_Products FOREIGN KEY REFERENCES dbo.Products([Id]),
	[Quantuty] INT NOT NULL
		CONSTRAINT CH_CartProducts_Quantity CHECK ([Quantity] > 0),

	CONSTRAINT PK_CartProducts PRIMARY KEY ([UserId], [ProductId])
);
GO
--============================================================================