ALTER TABLE [PrintSettings] ADD [InvoicePrint] nvarchar(max) NULL;

UPDATE [Companies] SET [CreatedDate] = '2021-12-10T07:38:45.4963770Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;


INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211210073847_invoice-print-setting-english-arabic', N'2.2.0-rtm-35687');



