USE [TechMarket];
GO

IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'Warehouses'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.Warehouses;
	END
GO
------------------------------------------------------------------------------

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.Warehouses (
	[Id] INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_Warehouses PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL,
	[AddressId] INT NOT NULL
		CONSTRAINT FK_Addresses_Id FOREIGN KEY REFERENCES dbo.Addresses([Id])
);
GO
--============================================================================