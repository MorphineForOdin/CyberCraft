--============================================================================
USE TechMarket;
GO
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.Users ON;
--============================================================================
MERGE dbo.Users AS target
    USING (VALUES 
            (1, 'Vasyl', 'Sviastyn', 2, 'vs@gmail.com', 'pass111'),
            (2, 'Yurii', 'Borys', 2, 'yb@gmail.com', 'pass222'),
            (3, 'Sviatoslav', 'Malinovskyi', 1, 'sm@gmail.com', 'pass333')) 
            AS source ([Id], [FirstName], [LastName], [RoleId], [Email], [Password])
    ON (target.[Id] = source.[Id])
    WHEN MATCHED
        THEN UPDATE SET
            target.[FirstName] = source.[FirstName],
            target.[LastName] = source.[LastName],
            target.[RoleId] = source.[RoleId],
            target.[Email] = source.[Email],
            target.[Password] = source.[Password]
    WHEN NOT MATCHED BY target
        THEN INSERT (
            [Id],
            [FirstName],
            [LastName],
            [RoleId],
            [Email],
            [Password])
        VALUES (
            source.[Id],
            source.[FirstName],
            source.[LastName],
            source.[RoleId],
            source.[Email],
            source.[Password])
    WHEN NOT MATCHED BY source
        THEN DELETE;
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.Users OFF;
--============================================================================