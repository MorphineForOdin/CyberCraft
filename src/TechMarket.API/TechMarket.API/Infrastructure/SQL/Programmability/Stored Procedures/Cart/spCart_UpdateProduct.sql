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
    IF @UserId <= 0 AND @ProductId <= 0 AND @Quantity <= 0
    BEGIN
        RAISERROR ('Must pass a valid data', 11, 1);
        RETURN -1;
    END
    
    IF NOT EXISTS (
        SELECT *
        FROM dbo.Users
        WHERE [Id]=@UserId )
    BEGIN
        RAISERROR ('Data UserId=@UserId not found', 11, 2);
        RETURN -1;
    END

     IF NOT EXISTS (
        SELECT *
        FROM dbo.Products
        WHERE [Id]=@ProductId )
    BEGIN
        RAISERROR ('Data UserId=@ProductId not found', 11, 2);
        RETURN -1;
    END

--========================================================================
-- Return:
--========================================================================
    UPDATE dbo.CartProducts
    SET [Quantity]=Quantity+@Quantity
    WHERE UserId=@UserId
        AND ProductId=@ProductId;
    END

GO
--============================================================================