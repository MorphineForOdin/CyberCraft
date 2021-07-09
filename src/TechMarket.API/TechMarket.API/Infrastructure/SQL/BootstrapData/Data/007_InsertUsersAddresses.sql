--============================================================================
USE TechMarket;
GO
--============================================================================
MERGE dbo.UsersAddresses AS target
    USING (
        VALUES 
            (1, 1, 'Baza'),
            (1, 3, 'Office'),
            (2, 2, 'Home'),
            (2, 3, 'Robota'),
            (3, 3, 'Work')) 
        AS source ([UserId], [AddressId], [Name])
    ON (target.[UserId] = source.[UserId])
    WHEN MATCHED
        THEN UPDATE SET target.[AddressId] = source.[AddressId], target.[Name] = source.[Name]
    WHEN NOT MATCHED BY target
        THEN INSERT ([UserId], [AddressId], [Name])
        VALUES (source.[UserId], source.[AddressId], source.[Name])
    WHEN NOT MATCHED BY source
        THEN DELETE;
--============================================================================