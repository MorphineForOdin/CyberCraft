--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'spWebsite_GetSliderImages'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'web')
BEGIN
    DROP PROCEDURE web.spWebsite_GetSliderImages;
END
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE web.spWebsite_GetSliderImages
AS
BEGIN
    SET NOCOUNT ON;

    --=========================================================================
    -- Return:
    --=========================================================================
    SELECT
        images.[Id],
        images.[ImageUrl],
        images.[LinkUrl]
    FROM web.SliderImages AS images;
END
GO
--============================================================================