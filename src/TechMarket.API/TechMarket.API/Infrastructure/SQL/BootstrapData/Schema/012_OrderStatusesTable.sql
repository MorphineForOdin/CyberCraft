--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'OrderStatuses'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.OrderStatuses;
	END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.OrderStatuses (
	[Id] INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_OrderStatuses PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL
);
GO
--============================================================================