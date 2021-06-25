--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'spProductCategories_GetProductCategories'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'dbo')
    BEGIN
        DROP PROCEDURE dbo.spProductCategories_GetProductCategories;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE dbo.spProductCategories_GetProductCategories
AS
BEGIN
	SELECT
         ProductCategories.[Id],
         ProductCategories.[Name],
         ProductCategories.[ParentId]
	FROM dbo.ProductCategories
END
GO
--==============================================================================
