--============================================================================
USE [TechMarket];
GO
------------------------------------------------------------------------------
IF EXISTS (
    SELECT *
    FROM sys.tables
    WHERE [name] = 'SliderImages' AND SCHEMA_NAME(schema_id) = 'web')
BEGIN
    DROP TABLE web.SliderImages;
END
GO
------------------------------------------------------------------------------
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO
--============================================================================
CREATE TABLE web.SliderImages (
    [Id] INT NOT NULL IDENTITY(1, 1)
        CONSTRAINT PK_SliderImages PRIMARY KEY,
    [ImageUrl] NVARCHAR(100) NOT NULL,
    [LinkUrl] NVARCHAR(100) NULL
        CONSTRAINT DF_SliderImages_LinkUrl DEFAULT NULL
);
GO
--============================================================================