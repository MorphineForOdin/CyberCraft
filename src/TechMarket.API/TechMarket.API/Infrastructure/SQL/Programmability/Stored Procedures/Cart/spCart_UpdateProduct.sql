--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'spCart_UpdateProduct'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'dbo')
    BEGIN
        DROP PROCEDURE dbo.spCart_UpdateProduct;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE spCart_UpdateProduct
    @UserId INT,
    @ProductId INT,
    @Quantity INT 
AS
BEGIN
    SET NOCOUNT ON

    --=========================================================================
    -- Validation:
    --=========================================================================
    IF @UserId <= 0 
    BEGIN
        RAISERROR ('Must pass a valid user id.', 11, 1);
        RETURN -1;
    END
    
    IF @ProductId <= 0 
    BEGIN
        RAISERROR ('Must pass a valid product id.', 11, 2);
        RETURN -1;
    END

    IF @Quantity <= 0
    BEGIN
        RAISERROR ('Must pass a valid quantity', 11, 3);
        RETURN -1;
    END

    IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE [Id] = @UserId)
    BEGIN
        RAISERROR ('User was not found.', 11, 4);
        RETURN -1;
    END

     IF NOT EXISTS (SELECT 1 FROM dbo.Products WHERE [Id] = @ProductId)
    BEGIN
        RAISERROR ('Product was not found.', 11, 5);
        RETURN -1;
    END

    --========================================================================
    -- Update:
    --======================================================================== 
    UPDATE dbo.CartProducts
    SET [Quantity] = @Quantity
    WHERE UserId = @UserId
        AND ProductId = @ProductId;
    END
GO
--============================================================================