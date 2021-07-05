--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'spProducts_Get'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'dbo')
    BEGIN
        DROP PROCEDURE dbo.spProducts_Get;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE spProducts_Get
    @Skip INT,
    @Take INT
AS
BEGIN
    SET NOCOUNT ON;

    --========================================================================
    -- Validation:
    --========================================================================
    IF @Skip IS NULL OR @Skip < 0
    BEGIN
        RAISERROR ('Must pass a valid @Offset', 11, 1);
        RETURN -1;
    END
    
    IF @Take IS NULL OR @Take <= 0
    BEGIN
        RAISERROR ('Must pass a valid @Fetch', 11, 2);
        RETURN -1;
    END

    --========================================================================
    -- Return:
    --========================================================================
    SELECT
        products.[Id],
        products.[CategoryId],
        products.[Name],
        products.[Description],
        products.[ImageUrl],
        products.[Price]
    FROM Products AS products
    ORDER BY Products.[Id]
        OFFSET @Skip ROWS
        FETCH NEXT @Take ROWS ONLY;
END
GO
--============================================================================