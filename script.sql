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



