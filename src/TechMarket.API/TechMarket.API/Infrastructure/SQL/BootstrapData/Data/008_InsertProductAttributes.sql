--============================================================================
USE TechMarket;
GO
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.ProductAttributes ON;
--============================================================================
MERGE dbo.ProductAttributes AS target
    USING (
        VALUES 
            (1, 'Color'),
            (2, 'Display Diagonal'),
            (3, 'RAM'),
            (4, 'Memory'),
            (5, 'CPU')) 
        AS source ([Id], [Name])
    ON (target.[Id] = source.[Id])
    WHEN MATCHED
        THEN UPDATE SET target.[Name] = source.[Name]
    WHEN NOT MATCHED BY target
        THEN INSERT ([Id], [Name])
        VALUES (source.[Id], source.[Name])
    WHEN NOT MATCHED BY source
        THEN DELETE;
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.ProductAttributes OFF;
--============================================================================