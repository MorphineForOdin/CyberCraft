--============================================================================
USE TechMarket;
GO
------------------------------------------------------------------------------
SET IDENTITY_INSERT web.SliderImages ON;
--============================================================================
MERGE web.SliderImages AS target
    USING (
        VALUES
            (1, 'https://s6.gifyu.com/images/img11868491b5834c0e4.jpg', '/products'),
            (2, 'https://s6.gifyu.com/images/img24c5a58cb98f4a7e7.jpg', NULL),
            (3, 'https://s6.gifyu.com/images/img304c07182168414a3.jpg', NULL))
        AS source ([Id], [ImageUrl], [LinkUrl])
    ON (target.[Id] = source.[Id])
    WHEN MATCHED
        THEN UPDATE SET
            target.[ImageUrl] = source.[ImageUrl],
            target.[LinkUrl] = source.[LinkUrl]
    WHEN NOT MATCHED BY target
        THEN INSERT([Id], [ImageUrl], [LinkUrl])
            VALUES (source.[Id], source.[ImageUrl], source.[LinkUrl])
    WHEN NOT MATCHED BY source
        THEN DELETE;
------------------------------------------------------------------------------
SET IDENTITY_INSERT web.SliderImages OFF;
--============================================================================