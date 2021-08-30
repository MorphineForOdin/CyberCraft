--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
MERGE dbo.ProductsWarehouses AS target
    USING (
        VALUES
            (1, 2, 44),
            (2, 3, 39),
            (3, 2, 86),
            (4, 1, 99),
            (5, 1, 45),
            (6, 1, 29),
            (7, 3, 50),
            (8, 3, 76),
            (9, 3, 92),
            (10, 3, 79),
            (11, 3, 33),
            (12, 2, 53),
            (13, 3, 22),
            (14, 3, 66),
            (15, 3, 91),
            (16, 2, 79),
            (17, 2, 83),
            (18, 2, 34),
            (19, 2, 42),
            (20, 2, 95),
            (21, 1, 39),
            (22, 1, 78),
            (23, 1, 60),
            (24, 1, 42),
            (25, 1, 69))
        AS sourse ([ProductId], [WarehouseId], [Quantity])
    ON (target.[ProductId] = sourse.[ProductId] AND target.[WarehouseId] = sourse.[WarehouseId])
    WHEN MATCHED
        THEN UPDATE SET
            target.[Quantity] = sourse.[Quantity]
    WHEN NOT MATCHED BY target
        THEN INSERT (
            [ProductId],
            [WarehouseId],
            [Quantity])
        VALUES (
            sourse.[ProductId],
            sourse.[WarehouseId],
            sourse.[Quantity])
    WHEN NOT MATCHED BY source
        THEN DELETE;
--============================================================================