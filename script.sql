ALTER TABLE [Terminals] ADD [PrinterName] nvarchar(max) NULL;


UPDATE [Companies] SET [CreatedDate] = '2021-12-06T13:05:44.6939042Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211206130546_printer-name-in-terminal', N'2.2.6-servicing-10079');


