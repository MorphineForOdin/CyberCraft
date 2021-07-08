--============================================================================
USE TechMarket;
GO
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.Addresses ON;
--============================================================================
MERGE dbo.Addresses AS target
    USING (VALUES 
            (1, 'Ukraine', 'Lviv', 'Masaryka street', 'house 14, entrance 1, apartment 43'),
            (2, 'Ukraine', 'Lviv', 'Kopernyka street', 'house 20, entrance 1, apartment 25'),
            (3, 'Ukraine', 'Lviv', 'Yosypa Slipogo street', 'house 7, entrance 1, apartment 401'),
            (4, 'Ukraine', 'Lviv', 'Gorodotska street', 'house 280'),
            (5, 'Ukraine', 'Lviv', 'Stryiska street', 'house 109'),
            (6, 'Ukraine', 'Lviv', 'Zelena street', 'house 283')) 
            AS source ([Id], [Country], [City], [Address], [ContactInfo])
    ON (target.[Id] = source.[Id])
    WHEN MATCHED
        THEN UPDATE SET
            target.[Country] = source.[Country],
            target.[City] = source.[City],
            target.[Address] = source.[Address],
            target.[ContactInfo] = source.[ContactInfo]
    WHEN NOT MATCHED BY target
        THEN INSERT (
            [Id],
            [Country],
            [City],
            [Address],
            [ContactInfo])
        VALUES (
            source.[Id],
            source.[Country],
            source.[City],
            source.[Address],
            source.[ContactInfo])
    WHEN NOT MATCHED BY source
        THEN DELETE;
------------------------------------------------------------------------------
SET IDENTITY_INSERT dbo.Addresses OFF;
--============================================================================