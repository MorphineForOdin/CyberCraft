--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'spCart_InsertProduct'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'dbo')
    BEGIN
        DROP PROCEDURE dbo.spCart_InsertProduct;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE spCart_InsertProduct
    @UserId INT,
    @ProductId INT,
    @Quantity INT 
AS
BEGIN
    SET NOCOUNT ON;

--=========================================================================
-- Validation:
--=========================================================================
    IF @UserId <= 0 
    BEGIN
        RAISERROR ('Must pass a valid user id', 11, 1);
        RETURN -1;
    END
    
    IF @ProductId <= 0 
    BEGIN
        RAISERROR ('Must pass a valid product id', 11, 1);
        RETURN -1;
    END

      
    IF @Quantity <= 0
    BEGIN
        RAISERROR ('Must pass a valid quantity', 11, 1);
        RETURN -1;
    END

    IF NOT EXISTS (
        SELECT 1
        FROM dbo.Users
        WHERE [Id]=@UserId )
    BEGIN
        RAISERROR ('User was not found', 11, 2);
        RETURN -1;
    END

     IF NOT EXISTS (
        SELECT 1
        FROM dbo.Products
        WHERE [Id]=@ProductId )
    BEGIN
        RAISERROR ('Product was not found', 11, 2);
        RETURN -1;
    END

--========================================================================
-- Add:
--========================================================================
    INSERT INTO dbo.CartProducts ([UserId],[ProductId],[Quantity])
    VALUES (@UserId,@ProductId,@Quantity); 
END
GO
--============================================================================