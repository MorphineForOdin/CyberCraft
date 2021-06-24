IF EXISTS (SELECT * FROM sys.databases WHERE name = 'TechMarket')
	BEGIN
		DROP DATABASE TechMarket;  
	END;
	CREATE DATABASE TechMarket;
GO

--============================================================================