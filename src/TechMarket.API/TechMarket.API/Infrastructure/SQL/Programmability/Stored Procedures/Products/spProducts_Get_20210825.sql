--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'spProducts_Get_20210825'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'dbo')
    BEGIN
        DROP PROCEDURE dbo.spProducts_Get_20210825;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE spProducts_Get_20210825
    @Skip INT,
    @Take INT,
    @CategoryId INT = NULL
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

    IF @CategoryId IS NOT NULL AND @CategoryId < 0
    BEGIN
        RAISERROR ('Must pass a valid @CategoryId', 11, 3);
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
        products.[Price],
        products.[ImageUrl],
        warehouse.[Quantity]
    FROM Products AS products
        LEFT JOIN dbo.ProductsWarehouses AS warehouse
            ON products.[Id] = warehouse.[ProductId]
    WHERE (@CategoryId IS NULL) OR (products.[CategoryId] = @CategoryId)
    ORDER BY Products.[Id]
        OFFSET @Skip ROWS
        FETCH NEXT @Take ROWS ONLY
END
GO
--============================================================================