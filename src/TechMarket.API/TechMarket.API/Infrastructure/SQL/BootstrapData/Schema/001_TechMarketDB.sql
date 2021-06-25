--============================================================================
IF EXISTS (SELECT * FROM sys.databases WHERE [name] = 'TechMarket')
BEGIN
	DROP DATABASE TechMarket;
END
GO
------------------------------------------------------------------------------
CREATE DATABASE TechMarket;
GO
--============================================================================