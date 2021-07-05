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
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    --========================================================================
    -- Validation:
    --========================================================================
    IF @Id IS NULL OR @Id < 0
    BEGIN
        RAISERROR ('Must pass a valid @Id', 11, 1);
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
    WHERE Id = @Id;

    SELECT
        attributes.[Id],
        attributes.[Name],
        productValues.[Id] AS 'ValueId',
        productValues.[Value]
    FROM dbo.ProductsAttributesValues AS attributesValues
        INNER JOIN dbo.ProductAttributes AS attributes
            ON attributesValues.[AttributeId] = attributes.[Id]
        INNER JOIN dbo.ProductValues AS productValues
            ON attributesValues.[ValueId] = productValues.[Id]
    WHERE attributesValues.[ProductId] = @Id;
END
GO
--============================================================================