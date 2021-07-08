--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'UsersAddresses'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.UsersAddresses;
	END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.UsersAddresses(
	[UserId] INT NOT NULL
		CONSTRAINT FK_UsersAddresses_Users FOREIGN KEY REFERENCES dbo.Users([Id]),
	[AddressId] INT NOT NULL
		CONSTRAINT FK_UsersAddresses_Addresses FOREIGN KEY REFERENCES dbo.Addresses([Id]),
	[Name] NVARCHAR(50) NOT NULL,

	CONSTRAINT PK_UsersAddresses PRIMARY KEY([UserId], [AddressId])
);
GO
--============================================================================