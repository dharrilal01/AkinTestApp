IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221114181208_InitialCreate')
BEGIN
    CREATE TABLE [ExpenseTypes] (
        [ID] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_ExpenseTypes] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221114181208_InitialCreate')
BEGIN
    CREATE TABLE [Expenses] (
        [ID] int NOT NULL IDENTITY,
        [Description] nvarchar(max) NOT NULL,
        [DateIncurred] datetime2 NOT NULL,
        [Location] nvarchar(max) NOT NULL,
        [Price] decimal(18,2) NOT NULL,
        [ExpenseTypeID] int NOT NULL,
        [UserID] int NOT NULL,
        CONSTRAINT [PK_Expenses] PRIMARY KEY ([ID]),
        CONSTRAINT [FK_Expenses_ExpenseTypes_ExpenseTypeID] FOREIGN KEY ([ExpenseTypeID]) REFERENCES [ExpenseTypes] ([ID]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221114181208_InitialCreate')
BEGIN
    CREATE INDEX [IX_Expenses_ExpenseTypeID] ON [Expenses] ([ExpenseTypeID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221114181208_InitialCreate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221114181208_InitialCreate', N'7.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221114192845_newcolumn')
BEGIN
    ALTER TABLE [Expenses] ADD [DummyValue] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221114192845_newcolumn')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221114192845_newcolumn', N'7.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221114193714_newcolumn2')
BEGIN
    ALTER TABLE [Expenses] ADD [DummyValue2] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20221114193714_newcolumn2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20221114193714_newcolumn2', N'7.0.0');
END;
GO

COMMIT;
GO

