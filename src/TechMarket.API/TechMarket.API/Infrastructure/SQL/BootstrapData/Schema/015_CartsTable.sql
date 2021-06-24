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
	[UserId] INT NOT NULL
		CONSTRAINT FK_Users_Id FOREIGN KEY REFERENCES dbo.Users([Id]),
	[ProductId] INT NOT NULL
		CONSTRAINT FK_Products_Id FOREIGN KEY REFERENCES dbo.Products([Id]),
	[Quantuty] INT NOT NULL,
	[TotalAmount] DECIMAL(10,2) NOT NULL,

	CONSTRAINT PK_Carts PRIMARY KEY ([UserId], [ProductId])
);
GO
--============================================================================