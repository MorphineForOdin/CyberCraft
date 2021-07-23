--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'spUsers_GetByEmail'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'dbo')
    BEGIN
        DROP PROCEDURE dbo.spUsers_GetByEmail;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE dbo.spUsers_GetByEmail
    @Email NVARCHAR
AS
BEGIN
    SET NOCOUNT ON;

    --=========================================================================
    -- Validation:
    --=========================================================================
    IF @Email IS NULL 
    BEGIN
        RAISERROR ('Must pass a valid @Email parameter.', 11, 1);
        RETURN -1;
    END

    --=========================================================================
    -- Return:
    --=========================================================================
    SELECT
         users.[Id],
         users.[FirstName],
         users.[LastName],
         users.[RoleId],
         users.[Email],
         users.[Password]
    FROM dbo.Users AS users
    WHERE users.[Email] = @Email;
END
GO
--==============================================================================