CREATE TABLE [ApplicationUpdates] (
    [Id] uniqueidentifier NOT NULL,
    [Status] nvarchar(max) NULL,
    [Version] nvarchar(max) NULL,
    [Detail] nvarchar(max) NULL,
    [DateTime] datetime2 NOT NULL,
    [CounterId] uniqueidentifier NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_ApplicationUpdates] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ApplicationUpdates_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);

GO

UPDATE [Companies] SET [CreatedDate] = '2021-12-03T05:35:46.8187200Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_ApplicationUpdates_CompanyId] ON [ApplicationUpdates] ([CompanyId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211203053548_ApplicationUpdate', N'2.2.6-servicing-10079');

GO

ALTER TABLE [PurchaseOrderItems] ADD [ReceiveQuantity] int NOT NULL DEFAULT 0;

GO

ALTER TABLE [PurchaseAttachments] ADD [Date] datetime2 NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2021-12-03T06:28:16.3338984Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211203062818_confirm-in-purchaseorder', N'2.2.6-servicing-10079');

GO

ALTER TABLE [Sales] ADD [LogisticId] uniqueidentifier NULL;

GO

ALTER TABLE [PrintSettings] ADD [BankAccount1] nvarchar(max) NULL;

GO

ALTER TABLE [PrintSettings] ADD [BankAccount2] nvarchar(max) NULL;

GO

ALTER TABLE [PrintSettings] ADD [BankIcon1] nvarchar(max) NULL;

GO

ALTER TABLE [PrintSettings] ADD [BankIcon2] nvarchar(max) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2021-12-03T10:42:56.9848236Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_Sales_LogisticId] ON [Sales] ([LogisticId]);

GO

ALTER TABLE [Sales] ADD CONSTRAINT [FK_Sales_Logistics_LogisticId] FOREIGN KEY ([LogisticId]) REFERENCES [Logistics] ([Id]) ON DELETE NO ACTION;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211203104259_LogisticCargoRelationWithSaleInvoice', N'2.2.6-servicing-10079');

GO

ALTER TABLE [Sales] ADD [CustomerAddressWalkIn] nvarchar(max) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2021-12-06T07:03:27.3025982Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211206070329_CustomerNameWalkIn', N'2.2.6-servicing-10079');

GO

ALTER TABLE [SalePayments] ADD [Name] nvarchar(max) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2021-12-06T11:32:11.8613017Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211206113213_name-insalepayment-db', N'2.2.6-servicing-10079');

GO

ALTER TABLE [Terminals] ADD [PrinterName] nvarchar(max) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2021-12-06T13:05:44.6939042Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211206130546_printer-name-in-terminal', N'2.2.6-servicing-10079');

GO

