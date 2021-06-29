--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'sp_Products_GetAll'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'dbo')
    BEGIN
        DROP PROCEDURE dbo.sp_Products_GetAll;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE sp_Products_GetAll
    @Offset INT,
    @Fetch INT
AS
BEGIN
    SET NOCOUNT ON;

    --========================================================================
    -- Validation:
    --========================================================================
    IF @Offset IS NULL OR @Offset < 0
    BEGIN
        RAISERROR ('Must pass a valid @Offset', 11, 1);
        RETURN -1;
    END
    
    IF @Fetch IS NULL OR @Fetch <= 0
    BEGIN
        RAISERROR ('Must pass a valid @Fetch', 11, 2);
        RETURN -1;
    END

    --========================================================================
    -- Return:
    --========================================================================
	SELECT
        Products.[Id],
        Products.[Name] AS 'Product',
        Products.[CategoryId],
        Products.[Description],
        Products.[Price]
	FROM Products
    ORDER BY Products.[Id]
        OFFSET @Offset ROWS
        FETCH NEXT @Fetch ROWS ONLY;
END
GO
--============================================================================