--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'spProduct_GetById'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'dbo')
    BEGIN
        DROP PROCEDURE dbo.spProduct_GetById;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE spProduct_GetById
    @Product_Id INT

AS
BEGIN
    SET NOCOUNT ON;

    --========================================================================
    -- Validation:
    --========================================================================
    IF @Product_Id IS NULL OR @Product_Id < 0
    BEGIN
        RAISERROR ('Must pass a valid @Product_Id', 11, 1);
        RETURN -1;
    END

    --========================================================================
    -- Return:
    --========================================================================
    SELECT
        Products.[Name],
        Products.[ImageUrl],
        ProductAttributes.[Name] AS 'Attribute',
        ProductValues.[Name] AS 'Value',
        Products.[Price]
    FROM dbo.ProductAttributesValues AS productAttributesValues
        INNER JOIN dbo.Products AS products 
            ON  products.[Id] = productAttributesValues.[ProductId]
		INNER JOIN dbo.ProductAttributes AS productAttributes
            ON productAttributes.[Id] = productAttributesValues.[AttributeId]
		INNER JOIN dbo.ProductValues AS productValues
            ON productValues.[Id] = productAttributesValues.[ValueId]
    WHERE products.[Id] = @Product_Id
END
GO
--============================================================================