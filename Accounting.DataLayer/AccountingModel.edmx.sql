
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/27/2023 19:46:35
-- Generated from EDMX file: C:\Users\Zhaleh\source\repos\Accounting\Accounting.DataLayer\AccountingModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Accounting_DB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Accounting_Customers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounting] DROP CONSTRAINT [FK_Accounting_Customers];
GO
IF OBJECT_ID(N'[dbo].[FK_Accounting_Customers1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounting] DROP CONSTRAINT [FK_Accounting_Customers1];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Accounting]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Accounting];
GO
IF OBJECT_ID(N'[dbo].[AccountingTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountingTypes];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Accounting'
CREATE TABLE [dbo].[Accounting] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [CustomerID] int  NOT NULL,
    [TypeID] int  NOT NULL,
    [Amount] int  NOT NULL,
    [Description] nvarchar(150)  NULL,
    [DateTitle] datetime  NOT NULL
);
GO

-- Creating table 'AccountingTypes'
CREATE TABLE [dbo].[AccountingTypes] (
    [TypeID] int  NOT NULL,
    [TypeTitle] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(50)  NOT NULL,
    [Mobile] nvarchar(50)  NOT NULL,
    [Emaill] nvarchar(50)  NULL,
    [Address] nvarchar(50)  NULL,
    [CustomerImage] varchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Accounting'
ALTER TABLE [dbo].[Accounting]
ADD CONSTRAINT [PK_Accounting]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [TypeID] in table 'AccountingTypes'
ALTER TABLE [dbo].[AccountingTypes]
ADD CONSTRAINT [PK_AccountingTypes]
    PRIMARY KEY CLUSTERED ([TypeID] ASC);
GO

-- Creating primary key on [CustomerID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TypeID] in table 'Accounting'
ALTER TABLE [dbo].[Accounting]
ADD CONSTRAINT [FK_Accounting_Customers]
    FOREIGN KEY ([TypeID])
    REFERENCES [dbo].[AccountingTypes]
        ([TypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Accounting_Customers'
CREATE INDEX [IX_FK_Accounting_Customers]
ON [dbo].[Accounting]
    ([TypeID]);
GO

-- Creating foreign key on [CustomerID] in table 'Accounting'
ALTER TABLE [dbo].[Accounting]
ADD CONSTRAINT [FK_Accounting_Customers1]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Accounting_Customers1'
CREATE INDEX [IX_FK_Accounting_Customers1]
ON [dbo].[Accounting]
    ([CustomerID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------