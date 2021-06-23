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
		CONSTRAINT PK_Warehouses_Id PRIMARY KEY,
	[Name] NVARCHAR(30) NOT NULL,
	[AddressId] INT NOT NULL
		CONSTRAINT FK_Warehouses_AddressId FOREIGN KEY (AddressId) REFERENCES dbo.Addresses([Id])
);
GO
--============================================================================