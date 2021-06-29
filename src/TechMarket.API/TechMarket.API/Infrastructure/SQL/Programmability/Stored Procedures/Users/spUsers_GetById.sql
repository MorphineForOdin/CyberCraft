--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'spUsers_GetById'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'dbo')
    BEGIN
        DROP PROCEDURE dbo.spUsers_GetById;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE dbo.spUsers_GetById
	@UserId INT
AS
BEGIN
	SET NOCOUNT ON;

    --=========================================================================
    -- Validation:
    --=========================================================================
	IF @UserId IS NULL OR @UserId <= 0
    BEGIN
        RAISERROR ('Must pass a valid @UserId parameter.', 11, 1);
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
         users.[Email]
	FROM dbo.Users AS users
    WHERE users.[Id] = @UserId;
END
GO
--==============================================================================