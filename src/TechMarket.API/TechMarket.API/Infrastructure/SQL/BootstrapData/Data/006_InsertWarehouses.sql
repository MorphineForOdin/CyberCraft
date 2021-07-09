--============================================================================
USE TechMarket;
GO
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.Warehouses ON;
--============================================================================
MERGE dbo.Warehouses AS target
    USING (
        VALUES 
            (1, 'WH-G1', 4),
            (2, 'WH-G2', 5),
            (3, 'WH-S1', 6)) 
            AS source ([Id], [Name], [AddressId])
    ON (target.[Id] = source.[Id])
    WHEN MATCHED
        THEN UPDATE SET target.[Name] = source.[Name], target.[AddressId] = source.[AddressId]
    WHEN NOT MATCHED BY target
        THEN INSERT ([Id], [Name], [AddressId])
        VALUES (source.[Id], source.[Name], source.[AddressId])
    WHEN NOT MATCHED BY source
        THEN DELETE;
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.Warehouses OFF;
--============================================================================