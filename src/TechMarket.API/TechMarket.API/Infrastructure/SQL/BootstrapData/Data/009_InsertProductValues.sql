--============================================================================
USE TechMarket;
GO
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.ProductValues ON;
--============================================================================
MERGE dbo.ProductValues AS target
    USING (VALUES 
            (1, 1, 'Silver'),
            (2, 1, 'Black'),
            (3, 1, 'White'),
            (4, 1, 'Gold'),
            (5, 1, 'Red'),
            (6, 1, 'Purple'),
            (7, 1, 'Gray'),
            (8, 2, '6.1"'),
            (9, 2, '5.8"'),
            (10, 2, '4.7"'),
            (11, 2, '5.4"'),
            (12, 2, '6.67"'),
            (13, 2, '6.81"'),
            (14, 2, '13"'),
            (15, 2, '16"'),
            (16, 2, '15.6'),
            (17, 2, '12.9"'),
            (18, 2, '10.9"'),
            (19, 2, '11"'),
            (20, 2, '10.2"'),
            (21, 3, '6GB'),
            (22, 3, '8GB'),
            (23, 3, '16GB'),
            (24, 3, '32GB'),
            (25, 4, '64GB'),
            (26, 4, '128GB'),
            (27, 4, '256GB'),
            (28, 4, '512GB'),
            (29, 4, '1TB'),
            (30, 4, '2TB'),
            (31, 5, '7GPU'),
            (32, 5, '8GPU'),
            (33, 5, 'IntelCore i7'),
            (34, 5, 'IntelCore i9')) 
            AS source ([Id], [AttributeId], [Value])
    ON (target.[Id] = source.[Id])
    WHEN MATCHED
        THEN UPDATE SET 
            target.[AttributeId] = source.[AttributeId],
            target.[Value] = source.[Value]
    WHEN NOT MATCHED BY target
        THEN INSERT (
            [Id],
            [AttributeId],
            [Value])
        VALUES (
            source.[Id],
            source.[AttributeId],
            source.[Value])
    WHEN NOT MATCHED BY source
        THEN DELETE;
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.ProductValues OFF;
--============================================================================