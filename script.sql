

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



