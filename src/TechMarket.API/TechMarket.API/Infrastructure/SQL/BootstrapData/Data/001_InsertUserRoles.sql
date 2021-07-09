--============================================================================
USE TechMarket;
GO
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.UserRoles ON;
--============================================================================
MERGE dbo.UserRoles AS target
    USING (VALUES (1, 'Admin'), (2, 'User')) AS source ([Id], [Name])
    ON (target.[Id] = source.[Id])
    WHEN MATCHED
        THEN UPDATE SET target.[Name] = source.[Name]
    WHEN NOT MATCHED BY target
        THEN INSERT ([Id], [Name]) VALUES (source.[Id], source.[Name])
    WHEN NOT MATCHED BY source
        THEN DELETE;
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.UserRoles OFF;
--============================================================================