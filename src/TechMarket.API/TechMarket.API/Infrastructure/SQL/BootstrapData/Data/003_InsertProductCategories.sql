--============================================================================
USE TechMarket;
GO
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.ProductCategories ON;
--============================================================================
MERGE dbo.ProductCategories AS target
    USING (
        VALUES 
            (1, 'Tech', NULL),
            (2, 'Laptop', 1),
            (3, 'Mobile', 1),
            (4, 'Tablet', 1)) 
        AS source ([Id], [Name], [ParentId])
    ON (target.[Id] = source.[Id])
    WHEN MATCHED
        THEN UPDATE SET target.[Name] = source.[Name], target.[ParentId] = source.[ParentId]
    WHEN NOT MATCHED BY target
        THEN INSERT ([Id], [Name], [ParentId])
        VALUES (source.[Id], source.[Name], source.[ParentId])
    WHEN NOT MATCHED BY source
        THEN DELETE;
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.ProductCategories OFF;
--============================================================================