--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS(
    SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE [ROUTINE_NAME] = 'spUsers_GetUserById'
        AND [ROUTINE_TYPE] = 'PROCEDURE'
        AND [ROUTINE_BODY] = 'SQL'
        AND [SPECIFIC_SCHEMA] = 'dbo')
    BEGIN
        DROP PROCEDURE dbo.spUsers_GetUserById;
    END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE PROCEDURE dbo.spUsers_GetUserById
	@UserId INT
AS
BEGIN
	SET NOCOUNT ON;
    --=========================================================================
    -- Validation:
    --=========================================================================
	IF @UserId IS NULL OR @UserId < 0
    BEGIN
        RAISERROR ('Must pass a valid @UserId parameter.', 11, 1);
        RETURN -1;
    END

    IF NOT EXISTS (SELECT 1 FROM [dbo].[Users] AS users WITH(NOLOCK) WHERE users.[ID] = @UserId)
    BEGIN
        RAISERROR ('Must pass an existing user via @UserId parameter.', 11, 2);
        RETURN -1;
    END
    --=========================================================================
    -- Return:
    --=========================================================================
	SELECT
         Users.[Id],
         Users.[FirstName],
         Users.[LastName],
         Users.[RoleId],
         Users.[Email]
	FROM dbo.Users
    WHERE Users.[Id]=@UserId;
END
GO
--==============================================================================
