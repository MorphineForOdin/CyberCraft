--============================================================================
USE TechMarket;
GO
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.Products ON;
--============================================================================
MERGE dbo.Products AS target
    USING (VALUES 
            (1, 'Apple iPhone X', '6.1" 64GB Silver', 'http://tny.im/pb5', 2, 441.89),
            (2, 'Apple iPhone XR', '6.1" 128GB Black', 'http://tny.im/pb6', 2, 639.43),
            (3, 'Apple iPhone 11', '6.1" 256GB White', 'http://tny.im/pb7', 2, 898.86),
            (4, 'Apple iPhone 11 Pro', '5.8" 256GB Gold', 'http://tny.im/pb8', 2, 999.89),
            (5, 'Apple iPhone 11 Pro', '5.8" 64GB Silver', 'http://tny.im/pb9', 2, 845.13),
            (6, 'Apple iPhone SE', '4.7" 64GB Red', 'http://tny.im/pba', 2, 429.67),
            (7, 'Apple iPhone SE', '4.7" 128GB Black', 'http://tny.im/pbb', 2, 505.54),
            (8, 'Apple iPhone 12 Mini', '5.4" 64GB Black', 'http://tny.im/pbc', 2, 765.87),
            (9, 'Apple iPhone 12', '6.1" 128GB Purple', 'http://tny.im/pbd', 2, 929.75),
            (10, 'Apple iPhone 12 Pro', '6.1" 256GB Silver', 'http://tny.im/pbe', 2, 1179.55),
            (11, 'XIAOMI Redmi Note 10 Pro', '6.67" 6/128Gb Gray', 'http://tny.im/pbf', 2, 330.05),
            (12, 'XIAOMI Mi 11 Lite', '6.67" 6/128Gb Black', 'http://tny.im/pbg', 2, 330.05),
            (13, 'Xiaomi Redmi Note 9 Pro', '6.67" 6/64GB Grey', 'http://tny.im/pbh', 2, 220.02),
            (14, 'XIAOMI Mi 11i', '6.67" 8/256GB Black', 'http://tny.im/pbi', 2, 660.13),
            (15, 'XIAOMI Mi 11', '6.81" 8/256GB Gray', 'http://tny.im/pbj', 2, 916.86),
            (16, 'Apple MacBook Air', '13" M1 2021 16/1TB 7GPU Gray', 'http://tny.im/pbk', 1, 1979.80),
            (17, 'Apple MacBook Air', '13" M1 2021 8/256GB 7GPU Gold', 'http://tny.im/pbl', 1, 1049.23),
            (18, 'Apple MacBook Pro', '16" Space Gray 16/1TB 8GPU', 'http://tny.im/pbs', 1, 2349.60),
            (19, 'HP ZBook Create G7 Turbo', '15.6" Silver IntelCore i9 32/2TB" ', 'http://tny.im/pbt', 1, 4223.35),
            (20, 'DELL Latitude 9510', '15.6" Grey IntelCore i7 16/512GB', 'http://tny.im/pbu', 1, 2995.58),
            (21, 'Apple iPad Pro', '12.9" 2020 Gray 6/128GB', 'http://tny.im/pbv', 3, 939.64),
            (22, 'Apple iPad Pro', '12.9" 2020 Silver 6/256GB', 'http://tny.im/pbw', 3, 1009.78),
            (23, 'Apple iPad Air', '10.9" 2020 Silver 64GB', 'http://tny.im/pbx', 3, 609.83),
            (24, 'Apple iPad Pro', '11" M1 2021 Silver 256GB', 'http://tny.im/pby', 3, 999.42),
            (25, 'Apple iPad', '10.2" 2020 Gray 128GB ', 'http://tny.im/pbz', 3, 469.56)) 
            AS source ([Id], [Name], [Description], [ImageUrl], [CategoryId], [Price])
    ON (target.[Id] = source.[Id])
    WHEN MATCHED
        THEN UPDATE SET
            target.[Name] = source.[Name],
            target.[Description] = source.[Description],
            target.[ImageUrl] = source.[ImageUrl],
            target.[CategoryId] = source.[CategoryId],
            target.[Price] = source.[Price]
    WHEN NOT MATCHED BY target
        THEN INSERT (
            [Id],
            [Name],
            [Description],
            [ImageUrl],
            [CategoryId],
            [Price])
        VALUES (
            source.[Id],
            source.[Name],
            source.[Description],
            source.[ImageUrl],
            source.[CategoryId],
            source.[Price])
    WHEN NOT MATCHED BY source
        THEN DELETE;
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.Products OFF;
--============================================================================