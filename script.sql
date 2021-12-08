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



UPDATE [Companies] SET [CreatedDate] = '2021-12-03T05:35:46.8187200Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_ApplicationUpdates_CompanyId] ON [ApplicationUpdates] ([CompanyId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211203053548_ApplicationUpdate', N'2.2.6-servicing-10079');



ALTER TABLE [PurchaseOrderItems] ADD [ReceiveQuantity] int NOT NULL DEFAULT 0;



ALTER TABLE [PurchaseAttachments] ADD [Date] datetime2 NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-12-03T06:28:16.3338984Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211203062818_confirm-in-purchaseorder', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [LogisticId] uniqueidentifier NULL;



ALTER TABLE [PrintSettings] ADD [BankAccount1] nvarchar(max) NULL;



ALTER TABLE [PrintSettings] ADD [BankAccount2] nvarchar(max) NULL;



ALTER TABLE [PrintSettings] ADD [BankIcon1] nvarchar(max) NULL;



ALTER TABLE [PrintSettings] ADD [BankIcon2] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-12-03T10:42:56.9848236Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_Sales_LogisticId] ON [Sales] ([LogisticId]);



ALTER TABLE [Sales] ADD CONSTRAINT [FK_Sales_Logistics_LogisticId] FOREIGN KEY ([LogisticId]) REFERENCES [Logistics] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211203104259_LogisticCarRelationWithSaleInvoice', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [CustomerAddressWalkIn] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-12-06T07:03:27.3025982Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211206070329_CustomerNameWalkIn', N'2.2.6-servicing-10079');



ALTER TABLE [SalePayments] ADD [Name] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-12-06T11:32:11.8613017Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211206113213_name-insalepayment-db', N'2.2.6-servicing-10079');



ALTER TABLE [Terminals] ADD [PrinterName] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-12-06T13:05:44.6939042Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211206130546_printer-name-in-terminal', N'2.2.6-servicing-10079');



