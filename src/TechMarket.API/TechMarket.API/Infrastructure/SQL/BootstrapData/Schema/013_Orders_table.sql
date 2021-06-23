USE [TechMarket];
GO

IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE name = 'Orders'
		AND SCHEMA_NAME(schema_id) = 'dbo')
	BEGIN
		DROP TABLE dbo.Orders;
	END
GO
------------------------------------------------------------------------------

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE dbo.Orders (
	[Id] INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_Orders_Id PRIMARY KEY,
	[UserId] INT
		CONSTRAINT FK_Orders_UserId FOREIGN KEY (UserId) REFERENCES dbo.Users([Id]),
	[AddressesId] INT
		CONSTRAINT FK_Orders_AddressesId FOREIGN KEY (AddressesId) REFERENCES dbo.Addresses([Id]),
	[StatusId] INT
		CONSTRAINT FK_Orders_StatusId FOREIGN KEY (StatusId) REFERENCES dbo.OrderStatuses([Id]),
	[Date] DATETIME
		CONSTRAINT DF_Orders_Date DEFAULT GETDATE()
);
GO
--============================================================================