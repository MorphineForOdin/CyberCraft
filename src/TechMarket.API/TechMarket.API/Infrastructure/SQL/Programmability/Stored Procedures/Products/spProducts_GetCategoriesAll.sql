--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'spProducts_GetCategoriesAll'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'dbo')
    BEGIN
        DROP PROCEDURE dbo.spProducts_GetCategoriesAll;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE dbo.spProducts_GetCategoriesAll
AS
BEGIN
    SET NOCOUNT ON;

    --=========================================================================
    -- Return:
    --=========================================================================
    SELECT
         categories.[Id],
         categories.[Name],
         categories.[ParentId]
    FROM dbo.ProductCategories AS categories;
END
GO
--==============================================================================