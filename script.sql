IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;



CREATE TABLE [AccountTemplates] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(80) NULL,
    [Description] nvarchar(200) NULL,
    [Type] nvarchar(50) NULL,
    [JsonTemplate] nvarchar(max) NULL,
    CONSTRAINT [PK_AccountTemplates] PRIMARY KEY ([Id])
);



CREATE TABLE [AspNetRoles] (
    [Id] nvarchar(450) NOT NULL,
    [Name] nvarchar(256) NULL,
    [NormalizedName] nvarchar(256) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
);



CREATE TABLE [AspNetUsers] (
    [Id] nvarchar(450) NOT NULL,
    [UserName] nvarchar(256) NULL,
    [NormalizedUserName] nvarchar(256) NULL,
    [Email] nvarchar(256) NULL,
    [NormalizedEmail] nvarchar(256) NULL,
    [EmailConfirmed] bit NOT NULL,
    [PasswordHash] nvarchar(max) NULL,
    [SecurityStamp] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [PhoneNumber] nvarchar(max) NULL,
    [PhoneNumberConfirmed] bit NOT NULL,
    [TwoFactorEnabled] bit NOT NULL,
    [LockoutEnd] datetimeoffset NULL,
    [LockoutEnabled] bit NOT NULL,
    [AccessFailedCount] int NOT NULL,
    [FirstName] nvarchar(max) NULL,
    [LastName] nvarchar(max) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [EmployeeId] uniqueidentifier NULL,
    [TerminalId] uniqueidentifier NULL,
    [ImagePath] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
);



CREATE TABLE [Attachments] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Path] nvarchar(max) NOT NULL,
    [Description] nvarchar(150) NULL,
    CONSTRAINT [PK_Attachments] PRIMARY KEY ([Id])
);



CREATE TABLE [Companies] (
    [Id] uniqueidentifier NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [Blocked] bit NOT NULL,
    [LoPath] nvarchar(max) NULL,
    [HouseNumber] nvarchar(max) NULL,
    [CompanyRegNo] nvarchar(max) NULL,
    [NameEnglish] nvarchar(max) NULL,
    [NameArabic] nvarchar(max) NULL,
    [VatRegistrationNo] nvarchar(max) NULL,
    [CompanyEmail] nvarchar(max) NULL,
    [CityEnglish] nvarchar(max) NULL,
    [CityArabic] nvarchar(max) NULL,
    [CountryEnglish] nvarchar(max) NULL,
    [CountryArabic] nvarchar(max) NULL,
    [CateryInEnglish] nvarchar(max) NULL,
    [CateryInArabic] nvarchar(max) NULL,
    [AddressEnglish] nvarchar(max) NULL,
    [AddressArabic] nvarchar(max) NULL,
    [PhoneNo] nvarchar(max) NULL,
    [Landline] nvarchar(max) NULL,
    [Website] nvarchar(max) NULL,
    [Postcode] nvarchar(max) NULL,
    [Town] nvarchar(max) NULL,
    [ClientNo] nvarchar(max) NULL,
    [ParentId] uniqueidentifier NOT NULL,
    [ClientParentId] uniqueidentifier NULL,
    [BusinessParentId] uniqueidentifier NULL,
    CONSTRAINT [PK_Companies] PRIMARY KEY ([Id])
);



CREATE TABLE [ModulesNames] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [IsActive] bit NOT NULL,
    CONSTRAINT [PK_ModulesNames] PRIMARY KEY ([Id])
);



CREATE TABLE [NobleModules] (
    [Id] int NOT NULL IDENTITY,
    [Description] nvarchar(max) NULL,
    [ModuleName] nvarchar(max) NULL,
    [BusinessType] int NOT NULL,
    CONSTRAINT [PK_NobleModules] PRIMARY KEY ([Id])
);



CREATE TABLE [AspNetRoleClaims] (
    [Id] int NOT NULL IDENTITY,
    [RoleId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [AspNetUserClaims] (
    [Id] int NOT NULL IDENTITY,
    [UserId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [AspNetUserLogins] (
    [LoginProvider] nvarchar(450) NOT NULL,
    [ProviderKey] nvarchar(450) NOT NULL,
    [ProviderDisplayName] nvarchar(max) NULL,
    [UserId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
    CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [AspNetUserRoles] (
    [UserId] nvarchar(450) NOT NULL,
    [RoleId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [AspNetUserTokens] (
    [UserId] nvarchar(450) NOT NULL,
    [LoginProvider] nvarchar(450) NOT NULL,
    [Name] nvarchar(450) NOT NULL,
    [Value] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [AccountsLevelOne] (
    [Id] uniqueidentifier NOT NULL,
    [Code] nvarchar(450) NOT NULL,
    [Name] nvarchar(100) NOT NULL,
    [Description] nvarchar(100) NULL,
    [IsActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_AccountsLevelOne] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AccountsLevelOne_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [AccountsLevelTwo] (
    [Id] uniqueidentifier NOT NULL,
    [Code] nvarchar(max) NULL,
    [Name] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [IsActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_AccountsLevelTwo] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AccountsLevelTwo_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [AccountTypes] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(200) NOT NULL,
    [IsActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_AccountTypes] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AccountTypes_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Brands] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [Code] nvarchar(max) NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Brands] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Brands_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [BundleCateries] (
    [Id] uniqueidentifier NOT NULL,
    [Offer] nvarchar(max) NULL,
    [Buy] decimal(18,2) NOT NULL,
    [Get] decimal(18,2) NOT NULL,
    [isActive] bit NOT NULL,
    [QuantityLimit] int NOT NULL,
    [QuantityOut] decimal(18,2) NOT NULL,
    [StockLimit] decimal(18,2) NOT NULL,
    [ToDate] datetime2 NULL,
    [FromDate] datetime2 NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_BundleCateries] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_BundleCateries_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [CashCustomer] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NOT NULL,
    [Mobile] nvarchar(max) NOT NULL,
    [Code] nvarchar(max) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_CashCustomer] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CashCustomer_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Colors] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [Code] nvarchar(max) NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Colors] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Colors_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [CompanyAccountSetups] (
    [Id] uniqueidentifier NOT NULL,
    [InventoryAccountId] uniqueidentifier NOT NULL,
    [VatPayableAccountId] uniqueidentifier NOT NULL,
    [VatReceiableAccountId] uniqueidentifier NOT NULL,
    [SaleAccountId] uniqueidentifier NOT NULL,
    [DiscountPayableAccountId] uniqueidentifier NOT NULL,
    [DiscountReceivableAccountId] uniqueidentifier NOT NULL,
    [FreeofCostAccountId] uniqueidentifier NOT NULL,
    [StockInAccountId] uniqueidentifier NOT NULL,
    [StockOutAccountId] uniqueidentifier NOT NULL,
    [BundleAccountId] uniqueidentifier NOT NULL,
    [PromotionAccountId] uniqueidentifier NOT NULL,
    [BankId] uniqueidentifier NOT NULL,
    [CashId] uniqueidentifier NOT NULL,
    [CurrencyId] nvarchar(max) NULL,
    [BarcodeType] nvarchar(max) NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_CompanyAccountSetups] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CompanyAccountSetups_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [CompanyAttachments] (
    [Id] uniqueidentifier NOT NULL,
    [CommercialRegistration] nvarchar(max) NULL,
    [BusinessLicence] nvarchar(max) NULL,
    [CivilDefenceLicense] nvarchar(max) NULL,
    [CctvLicence] nvarchar(max) NULL,
    [Lo] nvarchar(max) NULL,
    [Date] datetime2 NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_CompanyAttachments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CompanyAttachments_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [companyInformations] (
    [Id] uniqueidentifier NOT NULL,
    [NameArabic] nvarchar(max) NULL,
    [CommercialRegNo] nvarchar(max) NULL,
    [VatRegistrationNo] nvarchar(max) NULL,
    [CityArabic] nvarchar(max) NULL,
    [CountryArabic] nvarchar(max) NULL,
    [Mobile] nvarchar(max) NULL,
    [PhoneNo] nvarchar(max) NULL,
    [Email] nvarchar(max) NULL,
    [Website] nvarchar(max) NULL,
    [AddressArabic] nvarchar(max) NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CompanyId] uniqueidentifier NULL,
    CONSTRAINT [PK_companyInformations] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_companyInformations_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [CompanyLicences] (
    [Id] uniqueidentifier NOT NULL,
    [FromDate] datetime2 NOT NULL,
    [ToDate] datetime2 NOT NULL,
    [IsBlock] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NumberOfUsers] int NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CompanyType] int NOT NULL,
    [NoOfTransactionsAllow] decimal(18,2) NOT NULL,
    CONSTRAINT [PK_CompanyLicences] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CompanyLicences_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [Currencies] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Sign] nvarchar(max) NULL,
    [Image] nvarchar(max) NULL,
    [IsActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Currencies] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Currencies_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [CustomerDiscount] (
    [Id] uniqueidentifier NOT NULL,
    [DiscountName] nvarchar(100) NOT NULL,
    [Discount] float NOT NULL,
    [FreightDiscount] float NOT NULL,
    [ExtraDiscount] float NOT NULL,
    [OtherDiscount] float NOT NULL,
    [OpenDiscount] float NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_CustomerDiscount] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CustomerDiscount_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [DailyExpenses] (
    [Id] uniqueidentifier NOT NULL,
    [VoucherNo] nvarchar(max) NULL,
    [Date] datetime2 NOT NULL,
    [Description] nvarchar(max) NULL,
    [IsDraft] bit NOT NULL,
    [BusinessId] uniqueidentifier NOT NULL,
    [ClientId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CounterId] uniqueidentifier NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [DayId] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [UserId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_DailyExpenses] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DailyExpenses_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [DayStarts] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NULL,
    [SaleId] uniqueidentifier NOT NULL,
    [CounterId] uniqueidentifier NOT NULL,
    [LocationId] uniqueidentifier NOT NULL,
    [OpeningCash] decimal(18,2) NOT NULL,
    [CashInHand] decimal(18,2) NOT NULL,
    [VerifyCash] decimal(18,2) NOT NULL,
    [FromTime] datetime2 NULL,
    [ToTime] datetime2 NULL,
    [IsActive] bit NOT NULL,
    [DayStartUser] nvarchar(max) NULL,
    [DayEndUser] nvarchar(max) NULL,
    [CarryCash] decimal(18,2) NOT NULL,
    [Reason] nvarchar(max) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_DayStarts] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DayStarts_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Departments] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(150) NULL,
    [Code] nvarchar(30) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Departments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Departments_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Designations] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(150) NULL,
    [Code] nvarchar(30) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Designations] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Designations_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [EmployeeRegistrations] (
    [Id] uniqueidentifier NOT NULL,
    [Code] nvarchar(max) NULL,
    [EnglishName] nvarchar(max) NULL,
    [ArabicName] nvarchar(max) NULL,
    [RegistrationDate] datetime2 NULL,
    [Gender] nvarchar(max) NULL,
    [MartialStatus] nvarchar(max) NULL,
    [Nationality] nvarchar(max) NULL,
    [DateOfBirth] datetime2 NULL,
    [MobileNo] nvarchar(max) NULL,
    [OtherContact] nvarchar(max) NULL,
    [Email] nvarchar(max) NULL,
    [BloodGroup] nvarchar(max) NULL,
    [Address] nvarchar(max) NULL,
    [City] nvarchar(max) NULL,
    [Country] nvarchar(max) NULL,
    [PrimaryNameOfPerson] nvarchar(max) NULL,
    [PrimaryRelation] nvarchar(max) NULL,
    [PrimaryContactNumber] nvarchar(max) NULL,
    [PrimaryReferenceEmail] nvarchar(max) NULL,
    [SecondaryNameOfPerson] nvarchar(max) NULL,
    [SecondaryRelation] nvarchar(max) NULL,
    [SecondaryContactNumber] nvarchar(max) NULL,
    [SecondaryReferenceEmail] nvarchar(max) NULL,
    [HomePersonName] nvarchar(max) NULL,
    [HomeRelation] nvarchar(max) NULL,
    [HomeContactNumber] nvarchar(max) NULL,
    [HomeReferenceEmail] nvarchar(max) NULL,
    [HomeCity] nvarchar(max) NULL,
    [HomeCountry] nvarchar(max) NULL,
    [IDNumber] nvarchar(max) NULL,
    [IDType] nvarchar(max) NULL,
    [Title] nvarchar(max) NULL,
    [ExpiryDate] nvarchar(max) NULL,
    [PassportNumber] nvarchar(max) NULL,
    [PassportIssueDate] nvarchar(max) NULL,
    [PassportExpiryDate] nvarchar(max) NULL,
    [PassportIssuingAuthority] nvarchar(max) NULL,
    [DrivingLicenseNumber] nvarchar(max) NULL,
    [DrivingLicenseType] nvarchar(max) NULL,
    [DrivingExpiryDate] nvarchar(max) NULL,
    [DrivingIssuingAuthority] nvarchar(max) NULL,
    [MedicalPolicNumber] nvarchar(max) NULL,
    [MedicalPolicType] nvarchar(max) NULL,
    [MedicalPolicProvider] nvarchar(max) NULL,
    [MedicalPolicExpiryDate] datetime2 NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_EmployeeRegistrations] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_EmployeeRegistrations_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [JournalVouchers] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [VoucherNumber] nvarchar(max) NULL,
    [Comments] nvarchar(max) NULL,
    [Narration] nvarchar(max) NULL,
    [ApprovalStatus] int NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_JournalVouchers] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_JournalVouchers_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [LoginPermissions] (
    [Id] uniqueidentifier NOT NULL,
    [UserId] uniqueidentifier NOT NULL,
    [ChangePriceDuringSale] bit NOT NULL,
    [GiveDicountDuringSale] bit NOT NULL,
    [ViewCounterDetails] bit NOT NULL,
    [TransferCounter] bit NOT NULL,
    [CloseCounter] bit NOT NULL,
    [HoldCounter] bit NOT NULL,
    [CloseDay] bit NOT NULL,
    [StartDay] bit NOT NULL,
    [ProcessSaleReturn] bit NOT NULL,
    [DailyExpenseList] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_LoginPermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_LoginPermissions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [MobileOrders] (
    [Id] uniqueidentifier NOT NULL,
    [CustomerId] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [OrderNo] nvarchar(max) NULL,
    [OrderDate] datetime2 NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_MobileOrders] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_MobileOrders_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [MonthlyCosts] (
    [Id] uniqueidentifier NOT NULL,
    [MonthlyRent] decimal(18,2) NOT NULL,
    [MonthlySaleries] decimal(18,2) NOT NULL,
    [MonthlyUtilityBills] decimal(18,2) NOT NULL,
    [MonthlyvtFees] decimal(18,2) NOT NULL,
    [MonthlyvtZakat] decimal(18,2) NOT NULL,
    [vtFeeForLabour] decimal(18,2) NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_MonthlyCosts] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_MonthlyCosts_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [NobleRoles] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [NormalizedName] nvarchar(50) NOT NULL,
    [IsActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_NobleRoles] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_NobleRoles_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Origins] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [Code] nvarchar(max) NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Origins] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Origins_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [PaymentOptions] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Image] nvarchar(max) NULL,
    [IsActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_PaymentOptions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PaymentOptions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [PromotionOffers] (
    [Id] uniqueidentifier NOT NULL,
    [Offer] nvarchar(max) NULL,
    [DiscountPercentage] decimal(18,2) NOT NULL,
    [FixedDiscount] decimal(18,2) NOT NULL,
    [Quantity] decimal(18,2) NOT NULL,
    [QuantityOut] decimal(18,2) NOT NULL,
    [StockLimit] decimal(18,2) NOT NULL,
    [ToDate] datetime2 NULL,
    [FromDate] datetime2 NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_PromotionOffers] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PromotionOffers_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Sizes] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [Code] nvarchar(max) NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Sizes] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Sizes_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [TaxRates] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Rate] decimal(18,2) NOT NULL,
    [Description] nvarchar(max) NULL,
    [Code] nvarchar(max) NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_TaxRates] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_TaxRates_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Transporters] (
    [Id] uniqueidentifier NOT NULL,
    [City] nvarchar(50) NULL,
    [Name] nvarchar(50) NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Transporters] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Transporters_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Units] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [Code] nvarchar(max) NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Units] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Units_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Warehouses] (
    [Id] uniqueidentifier NOT NULL,
    [StoreID] nvarchar(max) NULL,
    [Name] nvarchar(max) NULL,
    [Address] nvarchar(max) NULL,
    [City] nvarchar(max) NULL,
    [Country] nvarchar(max) NULL,
    [ContactNo] nvarchar(max) NULL,
    [Email] nvarchar(max) NULL,
    [LicenseNo] nvarchar(max) NULL,
    [LicenseExpiry] datetime2 NOT NULL,
    [CivilDefenceLicenseNo] nvarchar(max) NULL,
    [CivilDefenceLicenseExpiry] datetime2 NOT NULL,
    [CCTVLicenseNo] nvarchar(max) NULL,
    [CCTVLicenseExpiry] datetime2 NOT NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Warehouses] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Warehouses_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Zones] (
    [Id] uniqueidentifier NOT NULL,
    [City] nvarchar(50) NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Zones] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Zones_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [ModulesRights] (
    [Id] uniqueidentifier NOT NULL,
    [ModuleId] uniqueidentifier NOT NULL,
    [Description] nvarchar(max) NOT NULL,
    [IsActive] bit NOT NULL,
    CONSTRAINT [PK_ModulesRights] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ModulesRights_ModulesNames_ModuleId] FOREIGN KEY ([ModuleId]) REFERENCES [ModulesNames] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [CompanyPermissions] (
    [Id] int NOT NULL IDENTITY,
    [Description] nvarchar(max) NULL,
    [Catery] nvarchar(max) NULL,
    [NobleModuleId] int NOT NULL,
    [BusinessType] int NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_CompanyPermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CompanyPermissions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_CompanyPermissions_NobleModules_NobleModuleId] FOREIGN KEY ([NobleModuleId]) REFERENCES [NobleModules] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [NoblePermissions] (
    [Id] int NOT NULL IDENTITY,
    [Description] nvarchar(max) NULL,
    [Catery] nvarchar(max) NULL,
    [NobleModuleId] int NOT NULL,
    CONSTRAINT [PK_NoblePermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_NoblePermissions_NobleModules_NobleModuleId] FOREIGN KEY ([NobleModuleId]) REFERENCES [NobleModules] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [CostCenters] (
    [Id] uniqueidentifier NOT NULL,
    [Code] nvarchar(450) NOT NULL,
    [Name] nvarchar(100) NOT NULL,
    [Description] nvarchar(100) NULL,
    [VatDeductible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [AccountTypeId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_CostCenters] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CostCenters_AccountTypes_AccountTypeId] FOREIGN KEY ([AccountTypeId]) REFERENCES [AccountTypes] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_CostCenters_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [BundleCateryItems] (
    [Id] uniqueidentifier NOT NULL,
    [BundleCateryId] uniqueidentifier NULL,
    [ProductId] uniqueidentifier NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_BundleCateryItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_BundleCateryItems_BundleCateries_BundleCateryId] FOREIGN KEY ([BundleCateryId]) REFERENCES [BundleCateries] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_BundleCateryItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [OtherCurrencies] (
    [Id] uniqueidentifier NOT NULL,
    [CurrencyId] uniqueidentifier NOT NULL,
    [Rate] decimal(18,2) NOT NULL,
    [Amount] decimal(18,2) NOT NULL,
    CONSTRAINT [PK_OtherCurrencies] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_OtherCurrencies_Currencies_CurrencyId] FOREIGN KEY ([CurrencyId]) REFERENCES [Currencies] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [DailyExpenseDetails] (
    [Id] uniqueidentifier NOT NULL,
    [Description] nvarchar(max) NULL,
    [Amount] decimal(18,2) NOT NULL,
    [DailyExpenseId] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_DailyExpenseDetails] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DailyExpenseDetails_DailyExpenses_DailyExpenseId] FOREIGN KEY ([DailyExpenseId]) REFERENCES [DailyExpenses] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [EmployeeRegistrationAttachments] (
    [Id] uniqueidentifier NOT NULL,
    [Photo] nvarchar(max) NULL,
    [CNIC] nvarchar(max) NULL,
    [Passport] nvarchar(max) NULL,
    [DrivingLicense] nvarchar(max) NULL,
    [Date] datetime2 NOT NULL,
    [EmployeeId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_EmployeeRegistrationAttachments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_EmployeeRegistrationAttachments_EmployeeRegistrations_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [EmployeeRegistrations] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [NobleUserRoles] (
    [Id] uniqueidentifier NOT NULL,
    [RoleId] uniqueidentifier NOT NULL,
    [UserId] nvarchar(max) NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_NobleUserRoles] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_NobleUserRoles_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_NobleUserRoles_NobleRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [NobleRoles] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [RolesPermissions] (
    [Id] uniqueidentifier NOT NULL,
    [RoleId] uniqueidentifier NOT NULL,
    [ModuleName] nvarchar(max) NULL,
    [Save] bit NOT NULL,
    [Edit] bit NOT NULL,
    [Delete] bit NOT NULL,
    [List] bit NOT NULL,
    [Print] bit NOT NULL,
    [Draft] bit NOT NULL,
    [Approved] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_RolesPermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_RolesPermissions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_RolesPermissions_NobleRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [NobleRoles] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [PromotionOfferItems] (
    [Id] uniqueidentifier NOT NULL,
    [PromotionOfferId] uniqueidentifier NULL,
    [ProductId] uniqueidentifier NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_PromotionOfferItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PromotionOfferItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PromotionOfferItems_PromotionOffers_PromotionOfferId] FOREIGN KEY ([PromotionOfferId]) REFERENCES [PromotionOffers] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [StockAdjustments] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [Code] nvarchar(max) NULL,
    [Narration] nvarchar(200) NOT NULL,
    [isDraft] bit NOT NULL,
    [WarehouseId] uniqueidentifier NOT NULL,
    [StockAdjustmentType] int NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_StockAdjustments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_StockAdjustments_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_StockAdjustments_Warehouses_WarehouseId] FOREIGN KEY ([WarehouseId]) REFERENCES [Warehouses] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [WareHouseTransfers] (
    [Id] uniqueidentifier NOT NULL,
    [Code] nvarchar(max) NULL,
    [FromWareHouseId] uniqueidentifier NOT NULL,
    [ToWareHouseId] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_WareHouseTransfers] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_WareHouseTransfers_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_WareHouseTransfers_Warehouses_ToWareHouseId] FOREIGN KEY ([ToWareHouseId]) REFERENCES [Warehouses] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [Employees] (
    [Id] uniqueidentifier NOT NULL,
    [EmployeeNo] nvarchar(max) NOT NULL,
    [FirstName] nvarchar(30) NOT NULL,
    [LastName] nvarchar(30) NULL,
    [PhoneNumber] nvarchar(14) NULL,
    [EmailAddress] nvarchar(max) NULL,
    [Address] nvarchar(250) NULL,
    [ImagePath] nvarchar(max) NULL,
    [Nic] nvarchar(13) NOT NULL,
    [JobType] nvarchar(max) NULL,
    [SearchingKey] nvarchar(300) NULL,
    [ParentId] uniqueidentifier NULL,
    [DesignationId] uniqueidentifier NULL,
    [ZoneId] uniqueidentifier NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Employees] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Employees_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Employees_Designations_DesignationId] FOREIGN KEY ([DesignationId]) REFERENCES [Designations] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Employees_Employees_ParentId] FOREIGN KEY ([ParentId]) REFERENCES [Employees] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Employees_Zones_ZoneId] FOREIGN KEY ([ZoneId]) REFERENCES [Zones] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [NobleRolePermissions] (
    [Id] int NOT NULL IDENTITY,
    [IsActive] bit NOT NULL,
    [RoleId] uniqueidentifier NOT NULL,
    [PermissionId] int NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_NobleRolePermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_NobleRolePermissions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_NobleRolePermissions_CompanyPermissions_PermissionId] FOREIGN KEY ([PermissionId]) REFERENCES [CompanyPermissions] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_NobleRolePermissions_NobleRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [NobleRoles] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [Accounts] (
    [Id] uniqueidentifier NOT NULL,
    [Code] nvarchar(450) NOT NULL,
    [Name] nvarchar(100) NOT NULL,
    [Description] nvarchar(100) NULL,
    [IsActive] bit NOT NULL,
    [CostCenterId] uniqueidentifier NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Accounts] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Accounts_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Accounts_CostCenters_CostCenterId] FOREIGN KEY ([CostCenterId]) REFERENCES [CostCenters] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [EmployeeAttachments] (
    [Id] uniqueidentifier NOT NULL,
    [EmployeeId] uniqueidentifier NOT NULL,
    [AttachmentId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_EmployeeAttachments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_EmployeeAttachments_Attachments_AttachmentId] FOREIGN KEY ([AttachmentId]) REFERENCES [Attachments] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_EmployeeAttachments_Employees_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [Employees] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [EmployeeDepartments] (
    [Id] uniqueidentifier NOT NULL,
    [EmployeeId] uniqueidentifier NOT NULL,
    [DepartmentId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_EmployeeDepartments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_EmployeeDepartments_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_EmployeeDepartments_Employees_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [Employees] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [Banks] (
    [Id] uniqueidentifier NOT NULL,
    [BankName] nvarchar(max) NULL,
    [Code] nvarchar(max) NULL,
    [IsActive] nvarchar(max) NULL,
    [AccoutName] nvarchar(max) NULL,
    [AccountId] uniqueidentifier NOT NULL,
    [BranchName] nvarchar(max) NULL,
    [AccountNumber] nvarchar(max) NULL,
    [IBNNumber] nvarchar(max) NULL,
    [Location] nvarchar(max) NULL,
    [ContactPerson] nvarchar(max) NULL,
    [ContactName] nvarchar(max) NULL,
    [ManagerName] nvarchar(max) NULL,
    [ManagerContectualNumber] nvarchar(max) NULL,
    [AccounType] nvarchar(max) NULL,
    [Currency] nvarchar(max) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Banks] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Banks_Accounts_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Accounts] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Banks_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Cateries] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(150) NULL,
    [Code] nvarchar(30) NULL,
    [isActive] bit NOT NULL,
    [PurchaseAccountId] uniqueidentifier NULL,
    [COGSAccountId] uniqueidentifier NOT NULL,
    [InventoryAccountId] uniqueidentifier NOT NULL,
    [IncomeAccountId] uniqueidentifier NULL,
    [SaleAccountId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Cateries] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Cateries_Accounts_COGSAccountId] FOREIGN KEY ([COGSAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Cateries_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Cateries_Accounts_IncomeAccountId] FOREIGN KEY ([IncomeAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Cateries_Accounts_InventoryAccountId] FOREIGN KEY ([InventoryAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Cateries_Accounts_PurchaseAccountId] FOREIGN KEY ([PurchaseAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Cateries_Accounts_SaleAccountId] FOREIGN KEY ([SaleAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Contacts] (
    [Id] uniqueidentifier NOT NULL,
    [Code] nvarchar(max) NULL,
    [Catery] nvarchar(max) NULL,
    [EnglishName] nvarchar(max) NULL,
    [ArabicName] nvarchar(max) NULL,
    [CommercialRegistrationNo] nvarchar(max) NULL,
    [VatNo] nvarchar(max) NULL,
    [ContactPerson1] nvarchar(max) NULL,
    [ContactPerson2] nvarchar(max) NULL,
    [ContactNo1] nvarchar(max) NULL,
    [ContactNo2] nvarchar(max) NULL,
    [Address] nvarchar(max) NULL,
    [City] nvarchar(max) NULL,
    [PaymentTerms] nvarchar(max) NULL,
    [Remarks] nvarchar(max) NULL,
    [RegistrationDate] nvarchar(max) NULL,
    [SupplierType] int NULL,
    [ExpiryDate] datetime2 NULL,
    [Email] nvarchar(max) NULL,
    [CustomerType] nvarchar(max) NULL,
    [ContactNumber] nvarchar(max) NULL,
    [Country] nvarchar(max) NULL,
    [DeliveryTerm] nvarchar(max) NULL,
    [CreditDays] nvarchar(max) NULL,
    [CreditLimit] nvarchar(max) NULL,
    [IsExpire] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [Status] bit NOT NULL,
    [ActiveDate] datetime2 NULL,
    [CaptureDate] datetime2 NULL,
    [Reason] nvarchar(max) NULL,
    [AccountId] uniqueidentifier NULL,
    [IsCustomer] bit NOT NULL,
    [CreditPeriod] nvarchar(max) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Contacts] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Contacts_Accounts_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Contacts_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [PaymentVouchers] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [VoucherNumber] nvarchar(max) NOT NULL,
    [Narration] nvarchar(200) NOT NULL,
    [ChequeNumber] nvarchar(max) NULL,
    [isDraft] bit NOT NULL,
    [PaymentVoucherType] int NOT NULL,
    [BankCashAccountId] uniqueidentifier NOT NULL,
    [BusinessId] uniqueidentifier NOT NULL,
    [ClientId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CounterId] uniqueidentifier NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [DayId] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [UserId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_PaymentVouchers] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PaymentVouchers_Accounts_BankCashAccountId] FOREIGN KEY ([BankCashAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PaymentVouchers_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Terminals] (
    [Id] uniqueidentifier NOT NULL,
    [Code] nvarchar(max) NULL,
    [MACAddress] nvarchar(max) NULL,
    [IPAddress] nvarchar(max) NULL,
    [IsActive] bit NOT NULL,
    [AccountId] uniqueidentifier NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Terminals] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Terminals_Accounts_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Terminals_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Transactions] (
    [Id] uniqueidentifier NOT NULL,
    [DocumentId] uniqueidentifier NOT NULL,
    [DocumentNumber] nvarchar(max) NOT NULL,
    [TransactionType] int NOT NULL,
    [Date] datetime2 NOT NULL,
    [Description] nvarchar(max) NULL,
    [Year] nvarchar(max) NULL,
    [Debit] decimal(18,4) NOT NULL,
    [Credit] decimal(18,4) NOT NULL,
    [ContactId] uniqueidentifier NULL,
    [ProductId] uniqueidentifier NULL,
    [AccountId] uniqueidentifier NOT NULL,
    [IsArchived] bit NOT NULL,
    [BusinessId] uniqueidentifier NOT NULL,
    [ClientId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CounterId] uniqueidentifier NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [DayId] uniqueidentifier NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [UserId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_Transactions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Transactions_Accounts_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Accounts] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Transactions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Products] (
    [Id] uniqueidentifier NOT NULL,
    [Code] nvarchar(150) NULL,
    [EnglishName] nvarchar(80) NULL,
    [ArabicName] nvarchar(max) NULL,
    [CateryId] uniqueidentifier NOT NULL,
    [SubCateryId] uniqueidentifier NULL,
    [BrandId] uniqueidentifier NULL,
    [UnitId] uniqueidentifier NULL,
    [SizeId] uniqueidentifier NULL,
    [ColorId] uniqueidentifier NULL,
    [BarCode] nvarchar(max) NULL,
    [Length] nvarchar(max) NULL,
    [Width] nvarchar(max) NULL,
    [TaxRateId] uniqueidentifier NULL,
    [TaxMethod] nvarchar(max) NULL,
    [SalePrice] decimal(18,2) NOT NULL,
    [PromotionOfferId] uniqueidentifier NULL,
    [BundleCateryId] uniqueidentifier NULL,
    [OriginId] uniqueidentifier NULL,
    [StockLevel] nvarchar(max) NULL,
    [SaleReturnDays] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [Shelf] nvarchar(max) NULL,
    [IsExpire] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [Image] nvarchar(max) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Products] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY ([BrandId]) REFERENCES [Brands] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Products_BundleCateries_BundleCateryId] FOREIGN KEY ([BundleCateryId]) REFERENCES [BundleCateries] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Products_Cateries_CateryId] FOREIGN KEY ([CateryId]) REFERENCES [Cateries] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Products_Colors_ColorId] FOREIGN KEY ([ColorId]) REFERENCES [Colors] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Products_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Products_Origins_OriginId] FOREIGN KEY ([OriginId]) REFERENCES [Origins] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Products_PromotionOffers_PromotionOfferId] FOREIGN KEY ([PromotionOfferId]) REFERENCES [PromotionOffers] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Products_Sizes_SizeId] FOREIGN KEY ([SizeId]) REFERENCES [Sizes] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Products_TaxRates_TaxRateId] FOREIGN KEY ([TaxRateId]) REFERENCES [TaxRates] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Products_Units_UnitId] FOREIGN KEY ([UnitId]) REFERENCES [Units] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [SubCateries] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(150) NULL,
    [Code] nvarchar(30) NULL,
    [isActive] bit NOT NULL,
    [CateryId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_SubCateries] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_SubCateries_Cateries_CateryId] FOREIGN KEY ([CateryId]) REFERENCES [Cateries] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SubCateries_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [ContactAttachments] (
    [Id] uniqueidentifier NOT NULL,
    [CommercialRegistration] nvarchar(max) NULL,
    [VATCertificate] nvarchar(max) NULL,
    [ZakatCertificate] nvarchar(max) NULL,
    [Date] datetime2 NOT NULL,
    [ContactId] uniqueidentifier NULL,
    CONSTRAINT [PK_ContactAttachments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ContactAttachments_Contacts_ContactId] FOREIGN KEY ([ContactId]) REFERENCES [Contacts] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [ContactBankAccounts] (
    [Id] uniqueidentifier NOT NULL,
    [BankAccountTitle1] nvarchar(max) NULL,
    [BankAccountNo1] nvarchar(max) NULL,
    [NameOfBank1] nvarchar(max) NULL,
    [RoutingCode1] nvarchar(max) NULL,
    [City1] nvarchar(max) NULL,
    [IBAN1] nvarchar(max) NULL,
    [BranchName1] nvarchar(max) NULL,
    [Address1] nvarchar(max) NULL,
    [Country1] nvarchar(max) NULL,
    [BankAccountTitle2] nvarchar(max) NULL,
    [BankAccountNo2] nvarchar(max) NULL,
    [NameOfBank2] nvarchar(max) NULL,
    [RoutingCode2] nvarchar(max) NULL,
    [City2] nvarchar(max) NULL,
    [IBAN2] nvarchar(max) NULL,
    [BranchName2] nvarchar(max) NULL,
    [Address2] nvarchar(max) NULL,
    [Country2] nvarchar(max) NULL,
    [ContactId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_ContactBankAccounts] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ContactBankAccounts_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ContactBankAccounts_Contacts_ContactId] FOREIGN KEY ([ContactId]) REFERENCES [Contacts] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [JournalVoucherItems] (
    [Id] uniqueidentifier NOT NULL,
    [AccountId] uniqueidentifier NOT NULL,
    [Description] nvarchar(200) NULL,
    [Debit] decimal(18,2) NOT NULL,
    [Credit] decimal(18,2) NOT NULL,
    [ContactId] uniqueidentifier NULL,
    [JournalVoucherId] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_JournalVoucherItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_JournalVoucherItems_Accounts_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Accounts] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_JournalVoucherItems_Contacts_ContactId] FOREIGN KEY ([ContactId]) REFERENCES [Contacts] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_JournalVoucherItems_JournalVouchers_JournalVoucherId] FOREIGN KEY ([JournalVoucherId]) REFERENCES [JournalVouchers] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [PurchaseOrders] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [RegistrationNo] nvarchar(max) NOT NULL,
    [SupplierId] uniqueidentifier NOT NULL,
    [InvoiceNo] nvarchar(max) NULL,
    [InvoiceDate] datetime2 NULL,
    [ApprovalStatus] int NOT NULL,
    [Note] nvarchar(max) NULL,
    [IsActive] bit NOT NULL,
    [IsClose] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PurchaseOrders_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PurchaseOrders_Contacts_SupplierId] FOREIGN KEY ([SupplierId]) REFERENCES [Contacts] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [Sales] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [RegistrationNo] nvarchar(max) NOT NULL,
    [CustomerId] uniqueidentifier NULL,
    [CashCustomerId] uniqueidentifier NULL,
    [DueDate] datetime2 NULL,
    [IsCredit] bit NOT NULL,
    [WareHouseId] uniqueidentifier NOT NULL,
    [InvoiceType] int NOT NULL,
    [OtherCurrencyId] uniqueidentifier NULL,
    [BusinessId] uniqueidentifier NOT NULL,
    [ClientId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CounterId] uniqueidentifier NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [DayId] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [UserId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_Sales] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Sales_CashCustomer_CashCustomerId] FOREIGN KEY ([CashCustomerId]) REFERENCES [CashCustomer] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Sales_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Sales_Contacts_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [Contacts] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Sales_OtherCurrencies_OtherCurrencyId] FOREIGN KEY ([OtherCurrencyId]) REFERENCES [OtherCurrencies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [PaymentVoucherDetails] (
    [Id] uniqueidentifier NOT NULL,
    [ContactAccountId] uniqueidentifier NOT NULL,
    [Description] nvarchar(200) NOT NULL,
    [Amount] decimal(18,4) NOT NULL,
    [Date] datetime2 NOT NULL,
    [ChequeNumber] nvarchar(max) NULL,
    [PaymentVoucherId] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_PaymentVoucherDetails] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PaymentVoucherDetails_Accounts_ContactAccountId] FOREIGN KEY ([ContactAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PaymentVoucherDetails_PaymentVouchers_PaymentVoucherId] FOREIGN KEY ([PaymentVoucherId]) REFERENCES [PaymentVouchers] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [UserTerminals] (
    [Id] uniqueidentifier NOT NULL,
    [TerminalId] uniqueidentifier NOT NULL,
    [UserId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_UserTerminals] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_UserTerminals_Terminals_TerminalId] FOREIGN KEY ([TerminalId]) REFERENCES [Terminals] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [MobileOrderItems] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [Quantity] int NOT NULL,
    [Price] decimal(18,4) NOT NULL,
    [MobileOrderId] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_MobileOrderItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_MobileOrderItems_MobileOrders_MobileOrderId] FOREIGN KEY ([MobileOrderId]) REFERENCES [MobileOrders] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_MobileOrderItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [StockAdjustmentDetails] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [Quantity] decimal(18,4) NOT NULL,
    [Price] decimal(18,4) NOT NULL,
    [WarehouseId] uniqueidentifier NOT NULL,
    [StockAdjustmentId] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_StockAdjustmentDetails] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_StockAdjustmentDetails_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_StockAdjustmentDetails_StockAdjustments_StockAdjustmentId] FOREIGN KEY ([StockAdjustmentId]) REFERENCES [StockAdjustments] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_StockAdjustmentDetails_Warehouses_WarehouseId] FOREIGN KEY ([WarehouseId]) REFERENCES [Warehouses] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [Stocks] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [WareHouseId] uniqueidentifier NOT NULL,
    [BusinessId] uniqueidentifier NOT NULL,
    [ClientId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CounterId] uniqueidentifier NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [DayId] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [UserId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_Stocks] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Stocks_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Stocks_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Stocks_Warehouses_WareHouseId] FOREIGN KEY ([WareHouseId]) REFERENCES [Warehouses] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [WareHouseTransferItems] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [Quantity] decimal(18,4) NOT NULL,
    [WareHouseTransferId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_WareHouseTransferItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_WareHouseTransferItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_WareHouseTransferItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_WareHouseTransferItems_WareHouseTransfers_WareHouseTransferId] FOREIGN KEY ([WareHouseTransferId]) REFERENCES [WareHouseTransfers] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [PurchaseAttachments] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Path] nvarchar(max) NULL,
    [Description] nvarchar(150) NULL,
    [PurchaseOrderId] uniqueidentifier NULL,
    CONSTRAINT [PK_PurchaseAttachments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PurchaseAttachments_PurchaseOrders_PurchaseOrderId] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [PurchaseOrders] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [PurchaseOrderItems] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [UnitPrice] decimal(18,4) NOT NULL,
    [Quantity] int NOT NULL,
    [Discount] decimal(18,2) NOT NULL,
    [FixDiscount] decimal(18,4) NOT NULL,
    [TaxRateId] uniqueidentifier NOT NULL,
    [PurchaseOrderId] uniqueidentifier NOT NULL,
    [ExpiryDate] datetime2 NULL,
    [BatchNo] nvarchar(max) NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_PurchaseOrderItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PurchaseOrderItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PurchaseOrderItems_PurchaseOrders_PurchaseOrderId] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [PurchaseOrders] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PurchaseOrderItems_TaxRates_TaxRateId] FOREIGN KEY ([TaxRateId]) REFERENCES [TaxRates] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [PurchasePosts] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [RegistrationNo] nvarchar(max) NOT NULL,
    [SupplierId] uniqueidentifier NOT NULL,
    [InvoiceNo] nvarchar(max) NULL,
    [IsPurchaseReturn] bit NOT NULL,
    [InvoiceDate] datetime2 NULL,
    [PurchaseOrderNo] nvarchar(max) NULL,
    [PurchaseOrderId] uniqueidentifier NULL,
    [WareHouseId] uniqueidentifier NOT NULL,
    [InvoiceFixDiscount] decimal(18,4) NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_PurchasePosts] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PurchasePosts_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PurchasePosts_PurchaseOrders_PurchaseOrderId] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [PurchaseOrders] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PurchasePosts_Contacts_SupplierId] FOREIGN KEY ([SupplierId]) REFERENCES [Contacts] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [Purchases] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [RegistrationNo] nvarchar(max) NOT NULL,
    [SupplierId] uniqueidentifier NOT NULL,
    [InvoiceNo] nvarchar(max) NULL,
    [IsPurchaseReturn] bit NOT NULL,
    [IsPost] bit NOT NULL,
    [InvoiceDate] datetime2 NULL,
    [PurchaseOrderNo] nvarchar(max) NULL,
    [PurchaseOrderId] uniqueidentifier NULL,
    [WareHouseId] uniqueidentifier NOT NULL,
    [InvoiceFixDiscount] decimal(18,4) NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Purchases] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Purchases_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Purchases_PurchaseOrders_PurchaseOrderId] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [PurchaseOrders] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Purchases_Contacts_SupplierId] FOREIGN KEY ([SupplierId]) REFERENCES [Contacts] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [SaleItems] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [UnitPrice] decimal(18,4) NOT NULL,
    [Quantity] int NOT NULL,
    [Discount] decimal(18,2) NOT NULL,
    [FixDiscount] decimal(18,4) NOT NULL,
    [TaxRateId] uniqueidentifier NOT NULL,
    [WareHouseId] uniqueidentifier NOT NULL,
    [Get] int NOT NULL,
    [Buy] int NOT NULL,
    [OfferQuantity] int NOT NULL,
    [SaleId] uniqueidentifier NOT NULL,
    [PromotionId] uniqueidentifier NULL,
    [BundleId] uniqueidentifier NULL,
    [BusinessId] uniqueidentifier NOT NULL,
    [ClientId] uniqueidentifier NOT NULL,
    [CounterId] uniqueidentifier NULL,
    [DayId] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL,
    [UserId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_SaleItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_SaleItems_BundleCateries_BundleId] FOREIGN KEY ([BundleId]) REFERENCES [BundleCateries] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_SaleItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SaleItems_PromotionOffers_PromotionId] FOREIGN KEY ([PromotionId]) REFERENCES [PromotionOffers] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_SaleItems_Sales_SaleId] FOREIGN KEY ([SaleId]) REFERENCES [Sales] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SaleItems_TaxRates_TaxRateId] FOREIGN KEY ([TaxRateId]) REFERENCES [TaxRates] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SaleItems_Warehouses_WareHouseId] FOREIGN KEY ([WareHouseId]) REFERENCES [Warehouses] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [SalePayments] (
    [Id] uniqueidentifier NOT NULL,
    [DueAmount] decimal(18,4) NOT NULL,
    [Received] decimal(18,4) NOT NULL,
    [Balance] decimal(18,4) NOT NULL,
    [Change] decimal(18,4) NOT NULL,
    [PaymentType] int NOT NULL,
    [PaymentOptionId] uniqueidentifier NULL,
    [SaleId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_SalePayments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_SalePayments_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_SalePayments_PaymentOptions_PaymentOptionId] FOREIGN KEY ([PaymentOptionId]) REFERENCES [PaymentOptions] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_SalePayments_Sales_SaleId] FOREIGN KEY ([SaleId]) REFERENCES [Sales] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [Inventories] (
    [Id] uniqueidentifier NOT NULL,
    [Price] decimal(18,4) NOT NULL,
    [AveragePrice] decimal(18,4) NOT NULL,
    [Quantity] int NOT NULL,
    [CurrentQuantity] int NOT NULL,
    [Date] datetime2 NOT NULL,
    [TransactionType] int NOT NULL,
    [DocumentId] uniqueidentifier NOT NULL,
    [StockId] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [WareHouseId] uniqueidentifier NOT NULL,
    [ExpiryDate] datetime2 NULL,
    [PromotionId] uniqueidentifier NULL,
    [BundleId] uniqueidentifier NULL,
    [OfferQuantity] int NOT NULL,
    [Get] int NOT NULL,
    [Buy] int NOT NULL,
    [BusinessId] uniqueidentifier NOT NULL,
    [ClientId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CounterId] uniqueidentifier NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [DayId] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [UserId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_Inventories] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Inventories_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Inventories_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Inventories_Stocks_StockId] FOREIGN KEY ([StockId]) REFERENCES [Stocks] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [PurchasePostItems] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [UnitPrice] decimal(18,4) NOT NULL,
    [Quantity] int NOT NULL,
    [Discount] int NOT NULL,
    [FixDiscount] decimal(18,4) NOT NULL,
    [TaxRateId] uniqueidentifier NOT NULL,
    [WareHouseId] uniqueidentifier NOT NULL,
    [PurchasePostId] uniqueidentifier NOT NULL,
    [ExpiryDate] datetime2 NULL,
    [BatchNo] nvarchar(max) NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_PurchasePostItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PurchasePostItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PurchasePostItems_PurchasePosts_PurchasePostId] FOREIGN KEY ([PurchasePostId]) REFERENCES [PurchasePosts] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PurchasePostItems_TaxRates_TaxRateId] FOREIGN KEY ([TaxRateId]) REFERENCES [TaxRates] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PurchasePostItems_Warehouses_WareHouseId] FOREIGN KEY ([WareHouseId]) REFERENCES [Warehouses] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [PurchaseItems] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [UnitPrice] decimal(18,4) NOT NULL,
    [Quantity] int NOT NULL,
    [Discount] int NOT NULL,
    [FixDiscount] decimal(18,4) NOT NULL,
    [TaxRateId] uniqueidentifier NOT NULL,
    [PurchaseId] uniqueidentifier NOT NULL,
    [WareHouseId] uniqueidentifier NOT NULL,
    [ExpiryDate] datetime2 NULL,
    [BatchNo] nvarchar(max) NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_PurchaseItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PurchaseItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PurchaseItems_Purchases_PurchaseId] FOREIGN KEY ([PurchaseId]) REFERENCES [Purchases] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PurchaseItems_TaxRates_TaxRateId] FOREIGN KEY ([TaxRateId]) REFERENCES [TaxRates] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PurchaseItems_Warehouses_WareHouseId] FOREIGN KEY ([WareHouseId]) REFERENCES [Warehouses] ([Id]) ON DELETE CASCADE
);



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'JsonTemplate', N'Name', N'Type') AND [object_id] = OBJECT_ID(N'[AccountTemplates]'))
    SET IDENTITY_INSERT [AccountTemplates] ON;
INSERT INTO [AccountTemplates] ([Id], [Description], [JsonTemplate], [Name], [Type])
VALUES ('ecfe29c8-c6af-4a3d-9c24-f87b30bf831c', N'SmallBusinessCOA', N'{"AccountsType":[{"Name":"Assets","IsActive":true,"CostCenters":[{"Name":"Cash in Hand","Description":"Cash in Hand","IsActive":true,"Code":"101000","Accounts":[{"Name":"Cash in Hand","Description":"Cash in Hand","IsActive":true,"Code":"10100001"}]},{"Name":"Cash in Hand - Store","Description":"Cash in Hand - Store","IsActive":true,"Code":"101001","Accounts":[{"Name":"Accounts receivable","Description":"Accounts receivable","IsActive":true,"Code":"10100101"}]},{"Name":"Inventory","Description":"Inventory","IsActive":true,"Code":"111000","Accounts":[{"Name":"Inventory","Description":"Inventory","IsActive":true,"Code":"11100001"}]},{"Name":"Customer Reciveables","Description":"Customer Reciveables","IsActive":true,"Code":"120000","Accounts":[{"Name":"Customer Reciveables","Description":"Customer Reciveables","IsActive":true,"Code":"1200001"}]},{"Name":"Banks","Description":"Banks","IsActive":true,"Code":"105000","Accounts":[{"Name":"Banks","Description":"Banks","IsActive":true,"Code":"10500001"}]},{"Name":"Accumulated Depreciation","Description":"Accumulated Depreciation","IsActive":true,"Code":"170000","Accounts":[{"Name":"Accumulated Depreciation","Description":"Accumulated Depreciation","IsActive":true,"Code":"17000001"}]},{"Name":"Fixed Assets","Description":"Fixed Assets","IsActive":true,"Code":"150000","Accounts":[{"Name":"Fixed Assets","Description":"Fixed Assets","IsActive":true,"Code":"1500001"}]},{"Name":"Due from Employee","Description":"Due from Employee","IsActive":true,"Code":"126000","Accounts":[{"Name":"Due from Employee","Description":"Due from Employee","IsActive":true,"Code":"12600001"}]}]},{"Name":"Liabilities","IsActive":true,"CostCenters":[{"Name":"Supplier Payable","Description":"Supplier Payable","IsActive":true,"Code":"200000","Accounts":[{"Name":"Supplier Payable","Description":"Supplier Payable","IsActive":true,"Code":"20000001"}]},{"Name":"Payroll Liabilities","Description":"Payroll Liabilities","IsActive":true,"Code":"240000","Accounts":[{"Name":"Payroll Liabilities","Description":"Payroll Liabilities","IsActive":true,"Code":"24000001"}]},{"Name":"Tax Payable","Description":"Tax Payable","IsActive":true,"Code":"250000","Accounts":[{"Name":"Tax Payable","Description":"Tax Payable","IsActive":true,"Code":"25000001"}]},{"Name":"Sales Tax Payable","Description":"Sales Tax Payable","IsActive":true,"Code":"251001","Accounts":[{"Name":"Sales Tax Payable","Description":"Sales Tax Payable","IsActive":true,"Code":"25100101"}]},{"Name":"Income Tax Payable","Description":"Income Tax Payable","IsActive":true,"Code":"252001","Accounts":[{"Name":"Income Tax Payable","Description":"Income Tax Payable","IsActive":true,"Code":"25200101"}]},{"Name":"Loan Payable","Description":"Loan Payable","IsActive":true,"Code":"253001","Accounts":[{"Name":"Loan Payable","Description":"Loan Payable","IsActive":true,"Code":"2530101"}]}]},{"Name":"Equity","IsActive":true,"CostCenters":[{"Name":"Opening Balance Equity","Description":"Opening Balance Equity","IsActive":true,"Code":"300000","Accounts":[{"Name":"Opening Balance Equity","Description":"Opening Balance Equity","IsActive":true,"Code":"30000001"}]},{"Name":"Owner Investment","Description":"Owner Investment","IsActive":true,"Code":"301001","Accounts":[{"Name":"Owner Investment","Description":"Owner Investment","IsActive":true,"Code":"30100101"}]},{"Name":"Owner Withdrawals","Description":"Owner Withdrawals","IsActive":true,"Code":"302001","Accounts":[{"Name":"Owner Withdrawals","Description":"Owner Withdrawals","IsActive":true,"Code":"30200101"}]},{"Name":"Retained Earnings","Description":"Retained Earnings","IsActive":true,"Code":"320000","Accounts":[{"Name":"Retained Earnings","Description":"Retained Earnings","IsActive":true,"Code":"32000001"}]},{"Name":"Net Profit for the period","Description":"Net Profit for the period","IsActive":true,"Code":"321002","Accounts":[{"Name":"Net Profit for the period","Description":"Net Profit for the period","IsActive":true,"Code":"32100201"}]}]},{"Name":"Income","IsActive":true,"CostCenters":[{"Name":"Sale","Description":"Sale","IsActive":true,"Code":"420000","Accounts":[{"Name":"Sale","Description":"Sale","IsActive":true,"Code":"42000001"}]},{"Name":"Teller","Description":"Teller","IsActive":true,"Code":"421000","Accounts":[{"Name":"Teller","Description":"Teller","IsActive":true,"Code":"42100001"}]},{"Name":"POS-Terminal","Description":"POS-Terminal","IsActive":true,"Code":"425000","Accounts":[{"Name":"POS-Terminal","Description":"POS-Terminal","IsActive":true,"Code":"42500001"}]},{"Name":"Discount Taken","Description":"Discount Taken","IsActive":true,"Code":"426000","Accounts":[{"Name":"Discount Taken","Description":"Discount Taken","IsActive":true,"Code":"42600001"}]}]},{"Name":"Expences","IsActive":true,"CostCenters":[{"Name":"Cost of ods Sold","Description":"Cost of ods Sold","IsActive":true,"Code":"600001","Accounts":[{"Name":"Cost of ods Sold","Description":"Cost of ods Sold","IsActive":true,"Code":"60000101"}]},{"Name":"Freight Paid","Description":"Freight Paid","IsActive":true,"Code":"608001","Accounts":[{"Name":"Freight Paid","Description":"Freight Paid","IsActive":true,"Code":"60800101"}]},{"Name":"Discount Given","Description":"Discount Given","IsActive":true,"Code":"607001","Accounts":[{"Name":"Discount Given","Description":"Discount Given","IsActive":true,"Code":"60700101"}]},{"Name":"Depreciation Expense","Description":"Depreciation Expense","IsActive":true,"Code":"606001","Accounts":[{"Name":"Depreciation Expense","Description":"Depreciation Expense","IsActive":true,"Code":"60600101"}]},{"Name":"General Expences","Description":"General Expences","IsActive":true,"Code":"605050","Accounts":[{"Name":"General Expences","Description":"General Expences","IsActive":true,"Code":"60505001"}]},{"Name":"Payroll","Description":"Payroll","IsActive":true,"Code":"603001","Accounts":[{"Name":"Payroll","Description":"Payroll","IsActive":true,"Code":"60300101"}]},{"Name":"Utilities","Description":"Utilities","IsActive":true,"Code":"604001","Accounts":[{"Name":"Utilities","Description":"Utilities","IsActive":true,"Code":"60400101"}]},{"Name":"Rent","Description":"Rent","IsActive":true,"Code":"604050","Accounts":[{"Name":"Rent","Description":"Rent","IsActive":true,"Code":"60405001"}]},{"Name":"Legal Expences","Description":"Legal Expences","IsActive":true,"Code":"605001","Accounts":[{"Name":"Legal Expences","Description":"Legal Expences","IsActive":true,"Code":"60500101"}]}]}]}', N'SmallBusinessCOA', N'Business');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'JsonTemplate', N'Name', N'Type') AND [object_id] = OBJECT_ID(N'[AccountTemplates]'))
    SET IDENTITY_INSERT [AccountTemplates] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
    SET IDENTITY_INSERT [AspNetRoles] ON;
INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
VALUES (N'E5480E8E-A150-4C80-82AB-62B5A8EBFD1B', N'1590a33c-cd2d-4c93-9e17-fce19bc2bd9d', N'User', N'USER'),
(N'52E0A954-7039-483B-9224-99990743636D', N'0590a33c-cd2d-4c93-9e17-fce12bc2bd9d', N'Super Admin', N'SUPER ADMIN'),
(N'S1448F55-49B4-476C-B07D-33514A0F3C1F', N'0C90a33c-dd2d-5c93-9e17-FCS14bc2bd9d', N'Sale Man', N'SALE MAN'),
(N'S1448F88-49B4-476C-B07D-33514A0F3C1F', N'0C90a33c-dd2d-5c93-9e17-fce14bc2bd9d', N'Order Tracker', N'ORDER TRACKER'),
(N'C1448F88-49B4-476C-B07D-33514A0F3C1F', N'0C90a33c-cd2d-4c93-9e17-fce14bc2bd9d', N'Mobile Customer', N'MOBILE CUSTOMER'),
(N'C1448F88-49CS-476C-B07D-33514A0F9C1E', N'4590A33c-cd2d-4c93-9e17-fcE19bc2bd9d', N'Supervisor', N'SUPERVISOR'),
(N'C1448F88-49B4-476C-B07D-33514A0F9C1E', N'0590a33c-cd2d-4c93-9e17-fce19bc2bd9d', N'Noble Admin', N'NOBLE ADMIN'),
(N'CEA36602-E3BD-4CF6-B186-5D8A3E558A04', N'0590a33c-cd2d-4d93-9e17-fce19bc2bd9d', N'Admin', N'ADMIN');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
    SET IDENTITY_INSERT [AspNetRoles] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'CompanyId', N'ConcurrencyStamp', N'Email', N'EmailConfirmed', N'EmployeeId', N'FirstName', N'ImagePath', N'LastName', N'LockoutEnabled', N'LockoutEnd', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TerminalId', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
    SET IDENTITY_INSERT [AspNetUsers] ON;
INSERT INTO [AspNetUsers] ([Id], [AccessFailedCount], [CompanyId], [ConcurrencyStamp], [Email], [EmailConfirmed], [EmployeeId], [FirstName], [ImagePath], [LastName], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TerminalId], [TwoFactorEnabled], [UserName])
VALUES (N'5f8d5614-2c7e-4ec0-868c-d254e6516b4d', 0, '5f8d5614-2c7e-4ec0-868c-d254e6516b4d', N'117c7248-5202-44d5-a7eb-8f2717eba7e9', N'noble@gmail.com', 1, NULL, N'Noble App', NULL, N'', 1, NULL, N'noble@gmail.com', N'NOBLE@GMAIL.COM', N'AQAAAAEAACcQAAAAEEMJll7GgXWk1z2fatxJWFPeucssBaOZ+EXMY5MYkhRNow+oaTxB0nH+sWvTX6wKWA==', NULL, 0, N'HDM6TKME4T5DISZCHW3MHD6YLQFNSWC2', NULL, 0, N'noble@gmail.com');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'CompanyId', N'ConcurrencyStamp', N'Email', N'EmailConfirmed', N'EmployeeId', N'FirstName', N'ImagePath', N'LastName', N'LockoutEnabled', N'LockoutEnd', N'NormalizedEmail', N'NormalizedUserName', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TerminalId', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[AspNetUsers]'))
    SET IDENTITY_INSERT [AspNetUsers] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AddressArabic', N'AddressEnglish', N'Blocked', N'BusinessParentId', N'CateryInArabic', N'CateryInEnglish', N'CityArabic', N'CityEnglish', N'ClientNo', N'ClientParentId', N'CompanyEmail', N'CompanyRegNo', N'CountryArabic', N'CountryEnglish', N'CreatedDate', N'HouseNumber', N'Landline', N'LoPath', N'NameArabic', N'NameEnglish', N'ParentId', N'PhoneNo', N'Postcode', N'Town', N'VatRegistrationNo', N'Website') AND [object_id] = OBJECT_ID(N'[Companies]'))
    SET IDENTITY_INSERT [Companies] ON;
INSERT INTO [Companies] ([Id], [AddressArabic], [AddressEnglish], [Blocked], [BusinessParentId], [CateryInArabic], [CateryInEnglish], [CityArabic], [CityEnglish], [ClientNo], [ClientParentId], [CompanyEmail], [CompanyRegNo], [CountryArabic], [CountryEnglish], [CreatedDate], [HouseNumber], [Landline], [LoPath], [NameArabic], [NameEnglish], [ParentId], [PhoneNo], [Postcode], [Town], [VatRegistrationNo], [Website])
VALUES ('5f8d5614-2c7e-4ec0-868c-d254e6516b4d', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'56ty60', NULL, NULL, '2021-07-12T11:42:27.7901496+05:00', NULL, NULL, NULL, NULL, N'noble@gmail.com', '00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, NULL, NULL);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AddressArabic', N'AddressEnglish', N'Blocked', N'BusinessParentId', N'CateryInArabic', N'CateryInEnglish', N'CityArabic', N'CityEnglish', N'ClientNo', N'ClientParentId', N'CompanyEmail', N'CompanyRegNo', N'CountryArabic', N'CountryEnglish', N'CreatedDate', N'HouseNumber', N'Landline', N'LoPath', N'NameArabic', N'NameEnglish', N'ParentId', N'PhoneNo', N'Postcode', N'Town', N'VatRegistrationNo', N'Website') AND [object_id] = OBJECT_ID(N'[Companies]'))
    SET IDENTITY_INSERT [Companies] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] ON;
INSERT INTO [NobleModules] ([Id], [BusinessType], [Description], [ModuleName])
VALUES (5, 0, N'HR', N'HR'),
(10, 0, N'Expense', N'Expense'),
(11, 0, N'Report', N'Report'),
(4, 0, N'Touch Invoice', N'Touch Invoice'),
(8, 0, N'Sale Invoice', N'Sale Invoice'),
(3, 0, N'Purchase Order', N'Purchase Order'),
(2, 0, N'Accounting', N'Accounting'),
(1, 0, N'Setup Form', N'Setup Form'),
(6, 0, N'Product & Bundles', N'Product & Bundles'),
(9, 0, N'Contact', N'Contact');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ClaimType', N'ClaimValue', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserClaims]'))
    SET IDENTITY_INSERT [AspNetUserClaims] ON;
INSERT INTO [AspNetUserClaims] ([Id], [ClaimType], [ClaimValue], [UserId])
VALUES (1, N'Email', N'noble@gmail.com', N'5f8d5614-2c7e-4ec0-868c-d254e6516b4d'),
(2, N'CompanyId', N'5f8d5614-2c7e-4ec0-868c-d254e6516b4d', N'5f8d5614-2c7e-4ec0-868c-d254e6516b4d'),
(3, N'Organization', N'Noble POS', N'5f8d5614-2c7e-4ec0-868c-d254e6516b4d'),
(4, N'FullName', N'Noble App', N'5f8d5614-2c7e-4ec0-868c-d254e6516b4d');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ClaimType', N'ClaimValue', N'UserId') AND [object_id] = OBJECT_ID(N'[AspNetUserClaims]'))
    SET IDENTITY_INSERT [AspNetUserClaims] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'UserId', N'RoleId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
    SET IDENTITY_INSERT [AspNetUserRoles] ON;
INSERT INTO [AspNetUserRoles] ([UserId], [RoleId])
VALUES (N'5f8d5614-2c7e-4ec0-868c-d254e6516b4d', N'C1448F88-49B4-476C-B07D-33514A0F9C1E');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'UserId', N'RoleId') AND [object_id] = OBJECT_ID(N'[AspNetUserRoles]'))
    SET IDENTITY_INSERT [AspNetUserRoles] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES (2, N'Brand', N'Can Edit Brand', 1),
(136, N'Stock Transfer', N'Can Save Stock Transfer', 3),
(137, N'Stock Transfer', N'Can Edit Stock Transfer', 3),
(138, N'Stock Transfer', N'Can Delete Stock Transfer', 3),
(139, N'Stock Transfer', N'Can View  Stock Transfer', 3),
(140, N'Sale Invoice', N'Can Save Sale Invoice as Hold', 8),
(141, N'Sale Invoice', N'Can Edit Sale Invoice as Hold', 8),
(142, N'Sale Invoice', N'Can Delete Sale Invoice as Hold', 8),
(143, N'Sale Invoice', N'Can View  Sale Invoice as Hold', 8),
(144, N'Sale Invoice', N'Can Save Sale Invoice as Paid', 8),
(145, N'Sale Invoice', N'Can Edit Sale Invoice as Paid', 8),
(146, N'Sale Invoice', N'Can Delete Sale Invoice as Paid', 8),
(147, N'Sale Invoice', N'Can View  Sale Invoice as Paid', 8),
(148, N'Mobile Order', N'Can Save  Mobile Order', 8),
(149, N'Mobile Order', N'Can Edit  Mobile Order', 8),
(150, N'Mobile Order', N'Can Delete  Mobile Order', 8),
(151, N'Mobile Order', N'Can View   Mobile Order', 8),
(239, N'Sale Return', N'Can Save Sale Return', 8),
(240, N'Sale Return', N'Can Edit  Sale Return', 8),
(241, N'Sale Return', N'Can Delete Sale Return', 8),
(242, N'Sale Return', N'Can View  Sale Return', 8),
(152, N'Day Start', N'Day Start', 8),
(153, N'Day Start', N'Day Register', 8),
(154, N'Day Start', N'Day Close', 8),
(155, N'Day Start', N'Day Counter', 8),
(156, N'Touch Invoice', N'Can Save Touch Invoice', 4),
(135, N'Stock Return', N'Can View  Stock Return', 3),
(157, N'Touch Invoice', N'Can Edit Touch Invoice', 4),
(134, N'Stock Return', N'Can Delete Stock Return', 3),
(132, N'Stock Return', N'Can Save Stock Return', 3),
(115, N'Purchase Invoice as Draft', N'Can View Purchase Invoice as Draft', 3),
(116, N'Purchase Invoice as Post', N'Can Save Purchase Invoice as Post', 3),
(117, N'Purchase Invoice as Post', N'Can Edit Purchase Invoice as Post', 3),
(118, N'Purchase Invoice as Post', N'Can Delete Purchase Invoice as Post', 3),
(119, N'Purchase Invoice as Post', N'Can View  Purchase Invoice as Post', 3),
(120, N'Purchase Return', N'Can Save Purchase Return', 3),
(121, N'Purchase Return', N'Can Edit Purchase Return', 3),
(122, N'Purchase Return', N'Can Delete Purchase Return', 3),
(123, N'Purchase Return', N'Can View  Purchase Return', 3),
(124, N'Stock In', N'Can Save Stock In as Draft', 3),
(125, N'Stock In', N'Can Edit Stock In as Draft', 3),
(126, N'Stock In', N'Can Delete Stock In as Draft', 3),
(127, N'Stock In', N'Can View  Stock In as Draft', 3),
(231, N'Stock In', N'Can Save Stock In as Post', 3),
(232, N'Stock In', N'Can Edit Stock In as Post', 3),
(233, N'Stock In', N'Can Delete Stock In as Post', 3),
(234, N'Stock In', N'Can View  Stock In as Post', 3),
(128, N'Stock Out', N'Can Save Stock Out as Draft', 3),
(129, N'Stock Out', N'Can Edit Stock Out as Draft', 3),
(130, N'Stock Out', N'Can Delete Stock Out as Draft', 3),
(131, N'Stock Out', N'Can View  Stock Out as Draft', 3),
(235, N'Stock Out', N'Can Save Stock Out as Post', 3),
(236, N'Stock Out', N'Can Edit Stock Out as Post', 3),
(237, N'Stock Out', N'Can Delete Stock Out as Post', 3),
(238, N'Stock Out', N'Can View  Stock Out as Post', 3),
(133, N'Stock Return', N'Can Edit Stock Return', 3),
(114, N'Purchase Invoice as Draft', N'Can Delete Purchase Invoice as Draft', 3),
(158, N'Touch Invoice', N'Can Delete Touch Invoice', 4),
(160, N'Employee', N'Can Save Employee', 5),
(198, N'Expense', N'Can Delete Expense', 10),
(199, N'Expense', N'Can View  Expense', 10),
(200, N'Inventory Report', N'Can View Report', 11),
(201, N'Inventory Report', N'Can Print Report', 11),
(202, N'Stock Value Report', N'Can View Stock Value Report', 11),
(203, N'Stock Value Report', N'Can Stock Value Report', 11),
(204, N'Stock Averag Value Report', N'Can View Stock Average  Value Report', 11),
(205, N'Stock Averag Value Report', N'Can Print Stock Average Value Report', 11),
(206, N'Transaction Type Stock Value Report', N'Can View Transaction Type Stock Value Report', 11),
(207, N'Transaction Type Stock Value Report', N'Can Print Transaction Type Stock Value Report', 11),
(208, N'Customer Wise Product Sale', N'Can View Customer Wise Product Sale Report', 11),
(209, N'Customer Wise Product Sale', N'Can Print Customer Wise Product Sale Report', 11),
(210, N'Supplier Wise Product Purchase', N'Can View Supplier Wise Product Purchase Report', 11),
(211, N'Supplier Wise Product Purchase', N'Can Print Supplier Wise Product Purchase Report', 11),
(214, N'Customer Discount Product', N'Can View Customer Discount Product Report', 11),
(215, N'Customer Discount Product', N'Can Print Customer Discount Product Report', 11),
(216, N'Supplier Discount Product', N'Can View Supplier Discount Product Report', 11),
(217, N'Supplier Discount Product', N'Can Print Supplier Discount Product Report', 11),
(218, N'Product Discount Customer', N'Can View Product Discount Customer Report', 11),
(219, N'Product Discount Customer', N'Can Print Product Discount Customer Report', 11),
(220, N'Product Discount Supplier', N'Can View Product Discount Supplier Report', 11),
(221, N'Product Discount Supplier', N'Can Print Product Discount Supplier Report', 11),
(222, N'Free of Cost Sale', N'Can View Free of Cost Sale Report', 11),
(223, N'Free of Cost Sale', N'Can Print Free of Cost Sale Report', 11),
(224, N'Account Ledger', N'Can View Account Ledger Report', 11),
(197, N'Expense', N'Can Edit Expense', 10),
(159, N'Touch Invoice', N'Can View  Touch Invoice', 4),
(196, N'Expense', N'Can Save Expense', 10),
(186, N'Supplier', N'Can Delete Supplier', 9),
(161, N'Employee', N'Can Edit Employee', 5),
(162, N'Employee', N'Can Delete Employee', 5),
(163, N'Employee', N'Can View  Employee', 5),
(164, N'Sign up User', N'Can Save Sign up User', 5),
(165, N'Sign up User', N'Can Edit Sign up User', 5),
(166, N'Sign up User', N'Can Delete Signup User', 5),
(167, N'Sign up User', N'Can View  Sign up User', 5),
(168, N'Product', N'Can Save Product', 6),
(169, N'Product', N'Can Edit Product', 6),
(170, N'Product', N'Can Delete Product', 6),
(171, N'Product', N'Can View  Product', 6),
(172, N'Bundles', N'Can Save Bundles', 6),
(173, N'Bundles', N'Can Edit Bundles', 6),
(174, N'Bundles', N'Can Delete Bundles', 6),
(175, N'Bundles', N'Can View  Bundles', 6),
(176, N'Promotion', N'Can Save Promotion', 6),
(177, N'Promotion', N'Can Edit Promotion', 6),
(178, N'Promotion', N'Can Delete Promotion', 6),
(179, N'Promotion', N'Can View  Promotion', 6),
(180, N'Customer', N'Can Save Customer', 9),
(181, N'Customer', N'Can Edit Customer', 9),
(182, N'Customer', N'Can Delete Customer', 9),
(183, N'Customer', N'Can View  Customer', 9),
(184, N'Supplier', N'Can Save Supplier', 9),
(185, N'Supplier', N'Can Edit Supplier', 9),
(187, N'Supplier', N'Can View  Supplier', 9),
(113, N'Purchase Invoice as Draft', N'Can Edit Purchase Invoice as Draft', 3),
(112, N'Purchase Invoice as Draft', N'Can Save  Purchase Invoice as Draft', 3),
(111, N'Purchase Order as Post', N'Can View  Purchase Order as Post', 3),
(32, N'Unit', N'Can View Unit', 1),
(33, N'Ware House', N'Can Save Ware House', 1),
(34, N'Ware House', N'Can Edit Ware House', 1),
(35, N'Ware House', N'Can Delete Ware House', 1),
(36, N'Ware House', N'Can View Ware House', 1),
(37, N'Company Setup', N'Can Save Company Setup', 1),
(38, N'Company Setup', N'Can Edit Company Setup', 1),
(39, N'Company Setup', N'Can Delete Company Setup', 1),
(40, N'Company Setup', N'Can View Company Setup', 1),
(41, N'Payment Option', N'Can Save Payment Option', 1),
(42, N'Payment Option', N'Can Edit Payment Option', 1),
(43, N'Payment Option', N'Can Delete Payment Option', 1),
(44, N'Payment Option', N'Can View Payment Option', 1),
(45, N'Terminals', N'Can Save Terminals', 1),
(46, N'Terminals', N'Can Edit Terminals', 1),
(47, N'Terminals', N'Can Delete Terminals', 1),
(48, N'Terminals', N'Can View Terminals', 1),
(49, N'Currency', N'Can Save Currency', 1),
(50, N'Currency', N'Can Edit Currency', 1),
(51, N'Currency', N'Can Delete Currency', 1),
(52, N'Currency', N'Can View Currency', 1),
(53, N'Monthly Cost', N'Can Save Monthly Cost', 1),
(54, N'Monthly Cost', N'Can Edit Monthly Cost', 1),
(55, N'Monthly Cost', N'Can Delete Monthly Cost', 1),
(56, N'Monthly Cost', N'Can View Monthly Cost', 1),
(31, N'Unit', N'Can Delete Unit', 1),
(227, N'Size', N'Can Save Size', 1),
(30, N'Unit', N'Can Edit Unit', 1),
(28, N'Tax Rate', N'Can View Tax Rate', 1),
(3, N'Brand', N'Can Delete Brand', 1),
(4, N'Brand', N'Can View Brand', 1),
(5, N'BarCode Printing', N'Can Save BarCode Printing', 1),
(6, N'BarCode Printing', N'Can Edit BarCode Printing', 1),
(7, N'BarCode Printing', N'Can Delete BarCode Printing', 1),
(8, N'BarCode Printing', N'Can View BarCode Printing', 1),
(9, N'Catery', N'Can Save Catery', 1),
(10, N'Catery', N'Can Edit Catery', 1),
(11, N'Catery', N'Can Delete Catery', 1),
(12, N'Catery', N'Can View Catery', 1),
(13, N'Color', N'Can Save Color', 1),
(14, N'Color', N'Can Edit Color', 1),
(15, N'Color', N'Can Delete Color', 1),
(16, N'Color', N'Can View Color', 1),
(17, N'Origin', N'Can Save Origin', 1),
(18, N'Origin', N'Can Edit Origin', 1),
(19, N'Origin', N'Can Delete Origin', 1),
(20, N'Origin', N'Can View Origin', 1),
(21, N'SubCateries', N'Can Save SubCateries', 1),
(22, N'SubCateries', N'Can Edit SubCateries', 1),
(23, N'SubCateries', N'Can Delete SubCateries', 1),
(24, N'SubCateries', N'Can View SubCateries', 1),
(25, N'Tax Rate', N'Can Save Tax Rate', 1),
(26, N'Tax Rate', N'Can Edit Tax Rate', 1),
(27, N'Tax Rate', N'Can Delete Tax Rate', 1),
(29, N'Unit', N'Can Save Unit', 1),
(228, N'Size', N'Can Edit Size', 1),
(229, N'Size', N'Can Delete Size', 1),
(230, N'Size', N'Can View Size', 1),
(86, N'Bank Receipt', N'Can Delete Bank Receipt as Draft', 2),
(87, N'Bank Receipt', N'Can View Bank Receipt as Draft', 2),
(88, N'Bank Receipt', N'Can Save Bank Receipt as Post', 2),
(89, N'Bank Receipt', N'Can Edit Bank Receipt as Post', 2),
(90, N'Bank Receipt', N'Can Delete Bank Receipt as Post', 2),
(91, N'Bank Receipt', N'Can View Bank Receipt as Post', 2),
(92, N'Chart Of Account', N'Can Save Chart Of Account', 2),
(93, N'Chart Of Account', N'Can Edit Chart Of Account', 2),
(94, N'Chart Of Account', N'Can Delete Chart Of Account', 2),
(95, N'Chart Of Account', N'Can View Chart Of Account', 2),
(96, N'Journal Voucher', N'Can Save Journal Voucher as Draft', 2),
(97, N'Journal Voucher', N'Can Edit  Journal Voucher as Draft', 2),
(98, N'Journal Voucher', N'Can Delete  Journal Voucher as Draft', 2),
(99, N'Journal Voucher', N'Can View Journal Voucher as Draft', 2),
(100, N'Journal Voucher', N'Can Save Journal Voucher as Post', 2),
(101, N'Journal Voucher', N'Can Edit  Journal Voucher as Post', 2),
(102, N'Journal Voucher', N'Can Delete  Journal Voucher as Post', 2),
(103, N'Journal Voucher', N'Can View Journal Voucher as Post', 2),
(104, N'Purchase Order as Draft', N'Can Save  Purchase Order as Draft', 3),
(105, N'Purchase Order as Draft', N'Can Edit Purchase Order as Draft', 3),
(106, N'Purchase Order as Draft', N'Can Delete Purchase Order as Draft', 3),
(107, N'Purchase Order as Draft', N'Can View Purchase Order as Draft', 3),
(108, N'Purchase Order as Post', N'Can Save Purchase Order as Post', 3),
(109, N'Purchase Order as Post', N'Can Edit Purchase Order as Post', 3),
(225, N'Account Ledger', N'Can Print Account Ledger Report', 11),
(85, N'Bank Receipt', N'Can Edit Bank Receipt as Draft', 2),
(84, N'Bank Receipt', N'Can Save Bank Receipt as Draft', 2),
(250, N'Bank Pay', N'Can View Bank Pay as Post', 2),
(249, N'Bank Pay', N'Can Delete Bank Pay as Post', 2),
(57, N'Bank', N'Can Save  Bank', 2),
(58, N'Bank', N'Can Edit Bank', 2),
(59, N'Bank', N'Can Delete Bank', 2),
(60, N'Bank', N'Can View Bank', 2),
(61, N'Cash Receipt', N'Can Save Cash Receipt as Draft', 2),
(62, N'Cash Receipt', N'Can Edit Cash Receipt as Draft', 2),
(63, N'Cash Receipt', N'Can Delete Cash Receipt as Draft', 2),
(64, N'Cash Receipt', N'Can View Cash Receipt as Draft', 2),
(65, N'Cash Receipt', N'Can Save Cash Receipt as Post', 2),
(66, N'Cash Receipt', N'Can Edit Cash Receipt as Post', 2),
(67, N'Cash Receipt', N'Can Delete Cash Receipt as Post', 2),
(68, N'Cash Receipt', N'Can View Cash Receipt as Post', 2),
(1, N'Brand', N'Can Save Brand', 1),
(69, N'Cash Pay', N'Can Save Cash Pay  as Draft', 2),
(71, N'Cash Pay', N'Can Delete Cash Pay as Draft', 2),
(72, N'Cash Pay', N'Can View Cash Pay as Draft', 2),
(73, N'Cash Pay', N'Can Save Cash Pay  as Post', 2),
(74, N'Cash Pay', N'Can Edit  Cash Pay as Post', 2),
(75, N'Cash Pay', N'Can Delete Cash Pay as Post', 2),
(76, N'Cash Pay', N'Can View Cash Pay as Post', 2),
(243, N'Bank Pay', N'Can Save Bank Pay  as Draft', 2),
(244, N'Bank Pay', N'Can Edit Bank Pay as Draft', 2),
(245, N'Bank Pay', N'Can Delete Bank Pay as Draft', 2),
(246, N'Bank Pay', N'Can View Bank Pay as Draft', 2),
(247, N'Bank Pay', N'Can Save Bank Pay  as Post', 2),
(248, N'Bank Pay', N'Can Edit Bank Pay as Post', 2),
(70, N'Cash Pay', N'Can Edit  Cash Pay as Draft', 2),
(110, N'Purchase Order as Post', N'Can Delete Purchase Order as Post', 3);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



CREATE INDEX [IX_Accounts_CompanyId] ON [Accounts] ([CompanyId]);



CREATE INDEX [IX_Accounts_CostCenterId] ON [Accounts] ([CostCenterId]);



CREATE UNIQUE NONCLUSTERED INDEX [IX_Accounts_Code_CompanyId] ON [Accounts] ([Code], [CompanyId]);



CREATE INDEX [IX_AccountsLevelOne_CompanyId] ON [AccountsLevelOne] ([CompanyId]);



CREATE UNIQUE NONCLUSTERED INDEX [IX_AccountsLevelOne_Code_CompanyId] ON [AccountsLevelOne] ([Code], [CompanyId]);



CREATE INDEX [IX_AccountsLevelTwo_CompanyId] ON [AccountsLevelTwo] ([CompanyId]);



CREATE INDEX [IX_AccountTypes_CompanyId] ON [AccountTypes] ([CompanyId]);



CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);



CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;



CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);



CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);



CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);



CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);



CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;



CREATE INDEX [IX_Banks_AccountId] ON [Banks] ([AccountId]);



CREATE INDEX [IX_Banks_CompanyId] ON [Banks] ([CompanyId]);



CREATE INDEX [IX_Brands_CompanyId] ON [Brands] ([CompanyId]);



CREATE INDEX [IX_BundleCateries_CompanyId] ON [BundleCateries] ([CompanyId]);



CREATE INDEX [IX_BundleCateryItems_BundleCateryId] ON [BundleCateryItems] ([BundleCateryId]);



CREATE INDEX [IX_BundleCateryItems_CompanyId] ON [BundleCateryItems] ([CompanyId]);



CREATE INDEX [IX_CashCustomer_CompanyId] ON [CashCustomer] ([CompanyId]);



CREATE INDEX [IX_Cateries_COGSAccountId] ON [Cateries] ([COGSAccountId]);



CREATE INDEX [IX_Cateries_CompanyId] ON [Cateries] ([CompanyId]);



CREATE INDEX [IX_Cateries_IncomeAccountId] ON [Cateries] ([IncomeAccountId]);



CREATE INDEX [IX_Cateries_InventoryAccountId] ON [Cateries] ([InventoryAccountId]);



CREATE INDEX [IX_Cateries_PurchaseAccountId] ON [Cateries] ([PurchaseAccountId]);



CREATE INDEX [IX_Cateries_SaleAccountId] ON [Cateries] ([SaleAccountId]);



CREATE INDEX [IX_Colors_CompanyId] ON [Colors] ([CompanyId]);



CREATE INDEX [IX_CompanyAccountSetups_CompanyId] ON [CompanyAccountSetups] ([CompanyId]);



CREATE INDEX [IX_CompanyAttachments_CompanyId] ON [CompanyAttachments] ([CompanyId]);



CREATE UNIQUE INDEX [IX_companyInformations_CompanyId] ON [companyInformations] ([CompanyId]) WHERE [CompanyId] IS NOT NULL;



CREATE INDEX [IX_CompanyLicences_CompanyId] ON [CompanyLicences] ([CompanyId]);



CREATE INDEX [IX_CompanyPermissions_CompanyId] ON [CompanyPermissions] ([CompanyId]);



CREATE INDEX [IX_CompanyPermissions_NobleModuleId] ON [CompanyPermissions] ([NobleModuleId]);



CREATE INDEX [IX_ContactAttachments_ContactId] ON [ContactAttachments] ([ContactId]);



CREATE INDEX [IX_ContactBankAccounts_CompanyId] ON [ContactBankAccounts] ([CompanyId]);



CREATE UNIQUE INDEX [IX_ContactBankAccounts_ContactId] ON [ContactBankAccounts] ([ContactId]);



CREATE INDEX [IX_Contacts_AccountId] ON [Contacts] ([AccountId]);



CREATE INDEX [IX_Contacts_CompanyId] ON [Contacts] ([CompanyId]);



CREATE INDEX [IX_CostCenters_AccountTypeId] ON [CostCenters] ([AccountTypeId]);



CREATE INDEX [IX_CostCenters_CompanyId] ON [CostCenters] ([CompanyId]);



CREATE UNIQUE NONCLUSTERED INDEX [IX_CostCenters_Code_CompanyId] ON [CostCenters] ([Code], [CompanyId]);



CREATE INDEX [IX_Currencies_CompanyId] ON [Currencies] ([CompanyId]);



CREATE INDEX [IX_CustomerDiscount_CompanyId] ON [CustomerDiscount] ([CompanyId]);



CREATE INDEX [IX_DailyExpenseDetails_DailyExpenseId] ON [DailyExpenseDetails] ([DailyExpenseId]);



CREATE INDEX [IX_DailyExpenses_CompanyId] ON [DailyExpenses] ([CompanyId]);



CREATE INDEX [IX_DayStarts_CompanyId] ON [DayStarts] ([CompanyId]);



CREATE INDEX [IX_Departments_CompanyId] ON [Departments] ([CompanyId]);



CREATE INDEX [IX_Designations_CompanyId] ON [Designations] ([CompanyId]);



CREATE INDEX [IX_EmployeeAttachments_AttachmentId] ON [EmployeeAttachments] ([AttachmentId]);



CREATE INDEX [IX_EmployeeAttachments_EmployeeId] ON [EmployeeAttachments] ([EmployeeId]);



CREATE INDEX [IX_EmployeeDepartments_DepartmentId] ON [EmployeeDepartments] ([DepartmentId]);



CREATE INDEX [IX_EmployeeDepartments_EmployeeId] ON [EmployeeDepartments] ([EmployeeId]);



CREATE INDEX [IX_EmployeeRegistrationAttachments_EmployeeId] ON [EmployeeRegistrationAttachments] ([EmployeeId]);



CREATE INDEX [IX_EmployeeRegistrations_CompanyId] ON [EmployeeRegistrations] ([CompanyId]);



CREATE INDEX [IX_Employees_CompanyId] ON [Employees] ([CompanyId]);



CREATE INDEX [IX_Employees_DesignationId] ON [Employees] ([DesignationId]);



CREATE INDEX [IX_Employees_ParentId] ON [Employees] ([ParentId]);



CREATE INDEX [IX_Employees_ZoneId] ON [Employees] ([ZoneId]);



CREATE INDEX [IX_Inventories_CompanyId] ON [Inventories] ([CompanyId]);



CREATE INDEX [IX_Inventories_ProductId] ON [Inventories] ([ProductId]);



CREATE INDEX [IX_Inventories_StockId] ON [Inventories] ([StockId]);



CREATE INDEX [IX_JournalVoucherItems_AccountId] ON [JournalVoucherItems] ([AccountId]);



CREATE INDEX [IX_JournalVoucherItems_ContactId] ON [JournalVoucherItems] ([ContactId]);



CREATE INDEX [IX_JournalVoucherItems_JournalVoucherId] ON [JournalVoucherItems] ([JournalVoucherId]);



CREATE INDEX [IX_JournalVouchers_CompanyId] ON [JournalVouchers] ([CompanyId]);



CREATE INDEX [IX_LoginPermissions_CompanyId] ON [LoginPermissions] ([CompanyId]);



CREATE INDEX [IX_MobileOrderItems_MobileOrderId] ON [MobileOrderItems] ([MobileOrderId]);



CREATE INDEX [IX_MobileOrderItems_ProductId] ON [MobileOrderItems] ([ProductId]);



CREATE INDEX [IX_MobileOrders_CompanyId] ON [MobileOrders] ([CompanyId]);



CREATE INDEX [IX_ModulesRights_ModuleId] ON [ModulesRights] ([ModuleId]);



CREATE INDEX [IX_MonthlyCosts_CompanyId] ON [MonthlyCosts] ([CompanyId]);



CREATE INDEX [IX_NoblePermissions_NobleModuleId] ON [NoblePermissions] ([NobleModuleId]);



CREATE INDEX [IX_NobleRolePermissions_CompanyId] ON [NobleRolePermissions] ([CompanyId]);



CREATE INDEX [IX_NobleRolePermissions_PermissionId] ON [NobleRolePermissions] ([PermissionId]);



CREATE INDEX [IX_NobleRolePermissions_RoleId] ON [NobleRolePermissions] ([RoleId]);



CREATE INDEX [IX_NobleRoles_CompanyId] ON [NobleRoles] ([CompanyId]);



CREATE INDEX [IX_NobleUserRoles_CompanyId] ON [NobleUserRoles] ([CompanyId]);



CREATE INDEX [IX_NobleUserRoles_RoleId] ON [NobleUserRoles] ([RoleId]);



CREATE INDEX [IX_Origins_CompanyId] ON [Origins] ([CompanyId]);



CREATE INDEX [IX_OtherCurrencies_CurrencyId] ON [OtherCurrencies] ([CurrencyId]);



CREATE INDEX [IX_PaymentOptions_CompanyId] ON [PaymentOptions] ([CompanyId]);



CREATE INDEX [IX_PaymentVoucherDetails_ContactAccountId] ON [PaymentVoucherDetails] ([ContactAccountId]);



CREATE INDEX [IX_PaymentVoucherDetails_PaymentVoucherId] ON [PaymentVoucherDetails] ([PaymentVoucherId]);



CREATE INDEX [IX_PaymentVouchers_BankCashAccountId] ON [PaymentVouchers] ([BankCashAccountId]);



CREATE INDEX [IX_PaymentVouchers_CompanyId] ON [PaymentVouchers] ([CompanyId]);



CREATE INDEX [IX_Products_BrandId] ON [Products] ([BrandId]);



CREATE INDEX [IX_Products_BundleCateryId] ON [Products] ([BundleCateryId]);



CREATE INDEX [IX_Products_CateryId] ON [Products] ([CateryId]);



CREATE INDEX [IX_Products_ColorId] ON [Products] ([ColorId]);



CREATE INDEX [IX_Products_CompanyId] ON [Products] ([CompanyId]);



CREATE INDEX [IX_Products_OriginId] ON [Products] ([OriginId]);



CREATE INDEX [IX_Products_PromotionOfferId] ON [Products] ([PromotionOfferId]);



CREATE INDEX [IX_Products_SizeId] ON [Products] ([SizeId]);



CREATE INDEX [IX_Products_TaxRateId] ON [Products] ([TaxRateId]);



CREATE INDEX [IX_Products_UnitId] ON [Products] ([UnitId]);



CREATE INDEX [IX_PromotionOfferItems_CompanyId] ON [PromotionOfferItems] ([CompanyId]);



CREATE INDEX [IX_PromotionOfferItems_PromotionOfferId] ON [PromotionOfferItems] ([PromotionOfferId]);



CREATE INDEX [IX_PromotionOffers_CompanyId] ON [PromotionOffers] ([CompanyId]);



CREATE INDEX [IX_PurchaseAttachments_PurchaseOrderId] ON [PurchaseAttachments] ([PurchaseOrderId]);



CREATE INDEX [IX_PurchaseItems_ProductId] ON [PurchaseItems] ([ProductId]);



CREATE INDEX [IX_PurchaseItems_PurchaseId] ON [PurchaseItems] ([PurchaseId]);



CREATE INDEX [IX_PurchaseItems_TaxRateId] ON [PurchaseItems] ([TaxRateId]);



CREATE INDEX [IX_PurchaseItems_WareHouseId] ON [PurchaseItems] ([WareHouseId]);



CREATE INDEX [IX_PurchaseOrderItems_ProductId] ON [PurchaseOrderItems] ([ProductId]);



CREATE INDEX [IX_PurchaseOrderItems_PurchaseOrderId] ON [PurchaseOrderItems] ([PurchaseOrderId]);



CREATE INDEX [IX_PurchaseOrderItems_TaxRateId] ON [PurchaseOrderItems] ([TaxRateId]);



CREATE INDEX [IX_PurchaseOrders_CompanyId] ON [PurchaseOrders] ([CompanyId]);



CREATE INDEX [IX_PurchaseOrders_SupplierId] ON [PurchaseOrders] ([SupplierId]);



CREATE INDEX [IX_PurchasePostItems_ProductId] ON [PurchasePostItems] ([ProductId]);



CREATE INDEX [IX_PurchasePostItems_PurchasePostId] ON [PurchasePostItems] ([PurchasePostId]);



CREATE INDEX [IX_PurchasePostItems_TaxRateId] ON [PurchasePostItems] ([TaxRateId]);



CREATE INDEX [IX_PurchasePostItems_WareHouseId] ON [PurchasePostItems] ([WareHouseId]);



CREATE INDEX [IX_PurchasePosts_CompanyId] ON [PurchasePosts] ([CompanyId]);



CREATE INDEX [IX_PurchasePosts_PurchaseOrderId] ON [PurchasePosts] ([PurchaseOrderId]);



CREATE INDEX [IX_PurchasePosts_SupplierId] ON [PurchasePosts] ([SupplierId]);



CREATE INDEX [IX_Purchases_CompanyId] ON [Purchases] ([CompanyId]);



CREATE INDEX [IX_Purchases_PurchaseOrderId] ON [Purchases] ([PurchaseOrderId]);



CREATE INDEX [IX_Purchases_SupplierId] ON [Purchases] ([SupplierId]);



CREATE INDEX [IX_RolesPermissions_CompanyId] ON [RolesPermissions] ([CompanyId]);



CREATE INDEX [IX_RolesPermissions_RoleId] ON [RolesPermissions] ([RoleId]);



CREATE INDEX [IX_SaleItems_BundleId] ON [SaleItems] ([BundleId]);



CREATE INDEX [IX_SaleItems_ProductId] ON [SaleItems] ([ProductId]);



CREATE INDEX [IX_SaleItems_PromotionId] ON [SaleItems] ([PromotionId]);



CREATE INDEX [IX_SaleItems_SaleId] ON [SaleItems] ([SaleId]);



CREATE INDEX [IX_SaleItems_TaxRateId] ON [SaleItems] ([TaxRateId]);



CREATE INDEX [IX_SaleItems_WareHouseId] ON [SaleItems] ([WareHouseId]);



CREATE INDEX [IX_SalePayments_CompanyId] ON [SalePayments] ([CompanyId]);



CREATE INDEX [IX_SalePayments_PaymentOptionId] ON [SalePayments] ([PaymentOptionId]);



CREATE INDEX [IX_SalePayments_SaleId] ON [SalePayments] ([SaleId]);



CREATE INDEX [IX_Sales_CashCustomerId] ON [Sales] ([CashCustomerId]);



CREATE INDEX [IX_Sales_CompanyId] ON [Sales] ([CompanyId]);



CREATE INDEX [IX_Sales_CustomerId] ON [Sales] ([CustomerId]);



CREATE UNIQUE INDEX [IX_Sales_OtherCurrencyId] ON [Sales] ([OtherCurrencyId]) WHERE [OtherCurrencyId] IS NOT NULL;



CREATE INDEX [IX_Sizes_CompanyId] ON [Sizes] ([CompanyId]);



CREATE INDEX [IX_StockAdjustmentDetails_ProductId] ON [StockAdjustmentDetails] ([ProductId]);



CREATE INDEX [IX_StockAdjustmentDetails_StockAdjustmentId] ON [StockAdjustmentDetails] ([StockAdjustmentId]);



CREATE INDEX [IX_StockAdjustmentDetails_WarehouseId] ON [StockAdjustmentDetails] ([WarehouseId]);



CREATE INDEX [IX_StockAdjustments_CompanyId] ON [StockAdjustments] ([CompanyId]);



CREATE INDEX [IX_StockAdjustments_WarehouseId] ON [StockAdjustments] ([WarehouseId]);



CREATE INDEX [IX_Stocks_CompanyId] ON [Stocks] ([CompanyId]);



CREATE INDEX [IX_Stocks_ProductId] ON [Stocks] ([ProductId]);



CREATE INDEX [IX_Stocks_WareHouseId] ON [Stocks] ([WareHouseId]);



CREATE INDEX [IX_SubCateries_CateryId] ON [SubCateries] ([CateryId]);



CREATE INDEX [IX_SubCateries_CompanyId] ON [SubCateries] ([CompanyId]);



CREATE INDEX [IX_TaxRates_CompanyId] ON [TaxRates] ([CompanyId]);



CREATE INDEX [IX_Terminals_AccountId] ON [Terminals] ([AccountId]);



CREATE INDEX [IX_Terminals_CompanyId] ON [Terminals] ([CompanyId]);



CREATE INDEX [IX_Transactions_AccountId] ON [Transactions] ([AccountId]);



CREATE INDEX [IX_Transactions_CompanyId] ON [Transactions] ([CompanyId]);



CREATE INDEX [IX_Transporters_CompanyId] ON [Transporters] ([CompanyId]);



CREATE INDEX [IX_Units_CompanyId] ON [Units] ([CompanyId]);



CREATE INDEX [IX_UserTerminals_TerminalId] ON [UserTerminals] ([TerminalId]);



CREATE INDEX [IX_Warehouses_CompanyId] ON [Warehouses] ([CompanyId]);



CREATE INDEX [IX_WareHouseTransferItems_CompanyId] ON [WareHouseTransferItems] ([CompanyId]);



CREATE INDEX [IX_WareHouseTransferItems_ProductId] ON [WareHouseTransferItems] ([ProductId]);



CREATE INDEX [IX_WareHouseTransferItems_WareHouseTransferId] ON [WareHouseTransferItems] ([WareHouseTransferId]);



CREATE INDEX [IX_WareHouseTransfers_CompanyId] ON [WareHouseTransfers] ([CompanyId]);



CREATE INDEX [IX_WareHouseTransfers_ToWareHouseId] ON [WareHouseTransfers] ([ToWareHouseId]);



CREATE INDEX [IX_Zones_CompanyId] ON [Zones] ([CompanyId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210712064229_All-In-One', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-07-14T16:40:00.9946851+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES (251, N'Role', N'Can Save Role', 1),
(252, N'Role', N'Can View Role', 1),
(253, N'Permission', N'Can View Permission', 1),
(254, N'Permission', N'Can Assign User', 1),
(255, N'Permission', N'Can Update Permission', 1),
(256, N'Permission', N'Can Change Profile', 1),
(257, N'View Dashboard', N'Can View Dashboard', 1),
(258, N'Can View Location Attachment', N'Can View Location Attachment', 1);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210714114003_ChangeInPermission1.5', N'2.2.6-servicing-10079');



DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[NobleRolePermissions]') AND [c].[name] = N'IsDeleted');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [NobleRolePermissions] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [NobleRolePermissions] DROP COLUMN [IsDeleted];



DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyPermissions]') AND [c].[name] = N'IsDeleted');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [CompanyPermissions] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [CompanyPermissions] DROP COLUMN [IsDeleted];



UPDATE [Companies] SET [CreatedDate] = '2021-07-14T19:51:08.0115998+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210714145110_CascadingDeleteInPermission', N'2.2.6-servicing-10079');



DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'VatReceiableAccountId');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [VatReceiableAccountId] uniqueidentifier NULL;



DECLARE @var3 sysname;
SELECT @var3 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'VatPayableAccountId');
IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var3 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [VatPayableAccountId] uniqueidentifier NULL;



DECLARE @var4 sysname;
SELECT @var4 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'StockOutAccountId');
IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var4 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [StockOutAccountId] uniqueidentifier NULL;



DECLARE @var5 sysname;
SELECT @var5 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'StockInAccountId');
IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var5 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [StockInAccountId] uniqueidentifier NULL;



DECLARE @var6 sysname;
SELECT @var6 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'SaleAccountId');
IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var6 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [SaleAccountId] uniqueidentifier NULL;



DECLARE @var7 sysname;
SELECT @var7 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'PromotionAccountId');
IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var7 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [PromotionAccountId] uniqueidentifier NULL;



DECLARE @var8 sysname;
SELECT @var8 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'InventoryAccountId');
IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var8 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [InventoryAccountId] uniqueidentifier NULL;



DECLARE @var9 sysname;
SELECT @var9 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'FreeofCostAccountId');
IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var9 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [FreeofCostAccountId] uniqueidentifier NULL;



DECLARE @var10 sysname;
SELECT @var10 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'DiscountReceivableAccountId');
IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var10 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [DiscountReceivableAccountId] uniqueidentifier NULL;



DECLARE @var11 sysname;
SELECT @var11 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'DiscountPayableAccountId');
IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var11 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [DiscountPayableAccountId] uniqueidentifier NULL;



DECLARE @var12 sysname;
SELECT @var12 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'CashId');
IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var12 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [CashId] uniqueidentifier NULL;



DECLARE @var13 sysname;
SELECT @var13 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'BundleAccountId');
IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var13 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [BundleAccountId] uniqueidentifier NULL;



DECLARE @var14 sysname;
SELECT @var14 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'BarcodeType');
IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var14 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [BarcodeType] nvarchar(max) NULL;



DECLARE @var15 sysname;
SELECT @var15 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CompanyAccountSetups]') AND [c].[name] = N'BankId');
IF @var15 IS NOT NULL EXEC(N'ALTER TABLE [CompanyAccountSetups] DROP CONSTRAINT [' + @var15 + '];');
ALTER TABLE [CompanyAccountSetups] ALTER COLUMN [BankId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-07-15T11:26:53.8812825+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210715062656_NullableCompanyAccount', N'2.2.6-servicing-10079');



ALTER TABLE [CompanyAccountSetups] ADD [TaxMethod] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-07-15T12:12:06.3714226+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210715071208_TaxMethodInCompanyAccount', N'2.2.6-servicing-10079');



DECLARE @var16 sysname;
SELECT @var16 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Warehouses]') AND [c].[name] = N'LicenseExpiry');
IF @var16 IS NOT NULL EXEC(N'ALTER TABLE [Warehouses] DROP CONSTRAINT [' + @var16 + '];');
ALTER TABLE [Warehouses] ALTER COLUMN [LicenseExpiry] datetime2 NULL;



DECLARE @var17 sysname;
SELECT @var17 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Warehouses]') AND [c].[name] = N'CivilDefenceLicenseExpiry');
IF @var17 IS NOT NULL EXEC(N'ALTER TABLE [Warehouses] DROP CONSTRAINT [' + @var17 + '];');
ALTER TABLE [Warehouses] ALTER COLUMN [CivilDefenceLicenseExpiry] datetime2 NULL;



DECLARE @var18 sysname;
SELECT @var18 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Warehouses]') AND [c].[name] = N'CCTVLicenseExpiry');
IF @var18 IS NOT NULL EXEC(N'ALTER TABLE [Warehouses] DROP CONSTRAINT [' + @var18 + '];');
ALTER TABLE [Warehouses] ALTER COLUMN [CCTVLicenseExpiry] datetime2 NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-07-16T12:52:46.2422166+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210716075248_WareHouseDateNullable', N'2.2.6-servicing-10079');



ALTER TABLE [CompanyAccountSetups] ADD [TaxRateId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-07-17T11:44:43.3972476+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210717064445_TaxRateInCompanyAccount', N'2.2.6-servicing-10079');



ALTER TABLE [Currencies] ADD [ArabicSign] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-07-27T10:48:46.9237313+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210727054849_ChnageInCurrency', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [Change] decimal(18,2) NOT NULL DEFAULT 0.0;



UPDATE [Companies] SET [CreatedDate] = '2021-07-27T19:08:49.9854182+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210727140852_change-field-in-invoice', N'2.2.6-servicing-10079');



UPDATE [AccountTemplates] SET [JsonTemplate] = N'{"AccountsType":[{"Name":"Assets","IsActive":true,"CostCenters":[{"Name":"Cash in Hand","Description":"Cash in Hand","IsActive":true,"Code":"101000","Accounts":[{"Name":"Cash in Hand","Description":"Cash in Hand","IsActive":true,"Code":"10100001"}]},{"Name":"Cash in Hand - Store","Description":"Cash in Hand - Store","IsActive":true,"Code":"101001","Accounts":[{"Name":"Accounts receivable","Description":"Accounts receivable","IsActive":true,"Code":"10100101"}]},{"Name":"Inventory","Description":"Inventory","IsActive":true,"Code":"111000","Accounts":[{"Name":"Inventory","Description":"Inventory","IsActive":true,"Code":"11100001"}]},{"Name":"Customer Reciveables","Description":"Customer Reciveables","IsActive":true,"Code":"120000","Accounts":[{"Name":"Customer Reciveables","Description":"Customer Reciveables","IsActive":true,"Code":"1200001"}]},{"Name":"VAT Paid","Description":"VAT Paid","IsActive":true,"Code":"130000","Accounts":[{"Name":"VAT Paid on Purchases","Description":"VAT Paid on Purchases","IsActive":true,"Code":"1300001"}]},{"Name":"Banks","Description":"Banks","IsActive":true,"Code":"105000","Accounts":[{"Name":"Banks","Description":"Banks","IsActive":true,"Code":"10500001"}]},{"Name":"Accumulated Depreciation","Description":"Accumulated Depreciation","IsActive":true,"Code":"170000","Accounts":[{"Name":"Accumulated Depreciation","Description":"Accumulated Depreciation","IsActive":true,"Code":"17000001"}]},{"Name":"Fixed Assets","Description":"Fixed Assets","IsActive":true,"Code":"150000","Accounts":[{"Name":"Fixed Assets","Description":"Fixed Assets","IsActive":true,"Code":"1500001"}]},{"Name":"Due from Employee","Description":"Due from Employee","IsActive":true,"Code":"126000","Accounts":[{"Name":"Due from Employee","Description":"Due from Employee","IsActive":true,"Code":"12600001"}]}]},{"Name":"Liabilities","IsActive":true,"CostCenters":[{"Name":"Supplier Payable","Description":"Supplier Payable","IsActive":true,"Code":"200000","Accounts":[{"Name":"Supplier Payable","Description":"Supplier Payable","IsActive":true,"Code":"20000001"}]},{"Name":"Payroll Liabilities","Description":"Payroll Liabilities","IsActive":true,"Code":"240000","Accounts":[{"Name":"Payroll Liabilities","Description":"Payroll Liabilities","IsActive":true,"Code":"24000001"}]},{"Name":"VAT Payable","Description":"VAT Payable","IsActive":true,"Code":"250000","Accounts":[{"Name":"VAT Payable on Sale","Description":"VAT Payable on Sale","IsActive":true,"Code":"25000001"}]},{"Name":"Loan Payable","Description":"Loan Payable","IsActive":true,"Code":"253001","Accounts":[{"Name":"Loan Payable","Description":"Loan Payable","IsActive":true,"Code":"2530101"}]}]},{"Name":"Equity","IsActive":true,"CostCenters":[{"Name":"Opening Balance Equity","Description":"Opening Balance Equity","IsActive":true,"Code":"300000","Accounts":[{"Name":"Opening Balance Equity","Description":"Opening Balance Equity","IsActive":true,"Code":"30000001"}]},{"Name":"Owner Investment","Description":"Owner Investment","IsActive":true,"Code":"301001","Accounts":[{"Name":"Owner Investment","Description":"Owner Investment","IsActive":true,"Code":"30100101"}]},{"Name":"Owner Withdrawals","Description":"Owner Withdrawals","IsActive":true,"Code":"302001","Accounts":[{"Name":"Owner Withdrawals","Description":"Owner Withdrawals","IsActive":true,"Code":"30200101"}]},{"Name":"Retained Earnings","Description":"Retained Earnings","IsActive":true,"Code":"320000","Accounts":[{"Name":"Retained Earnings","Description":"Retained Earnings","IsActive":true,"Code":"32000001"}]},{"Name":"Net Profit for the period","Description":"Net Profit for the period","IsActive":true,"Code":"321002","Accounts":[{"Name":"Net Profit for the period","Description":"Net Profit for the period","IsActive":true,"Code":"32100201"}]}]},{"Name":"Income","IsActive":true,"CostCenters":[{"Name":"Sale","Description":"Sale","IsActive":true,"Code":"420000","Accounts":[{"Name":"Sale","Description":"Sale","IsActive":true,"Code":"42000001"}]},{"Name":"Teller","Description":"Teller","IsActive":true,"Code":"421000","Accounts":[{"Name":"Teller","Description":"Teller","IsActive":true,"Code":"42100001"}]},{"Name":"POS-Terminal","Description":"POS-Terminal","IsActive":true,"Code":"425000","Accounts":[{"Name":"POS-Terminal","Description":"POS-Terminal","IsActive":true,"Code":"42500001"}]},{"Name":"Discount Taken","Description":"Discount Taken","IsActive":true,"Code":"426000","Accounts":[{"Name":"Discount Taken","Description":"Discount Taken","IsActive":true,"Code":"42600001"}]}]},{"Name":"Expences","IsActive":true,"CostCenters":[{"Name":"Cost of ods Sold","Description":"Cost of ods Sold","IsActive":true,"Code":"600001","Accounts":[{"Name":"Cost of ods Sold","Description":"Cost of ods Sold","IsActive":true,"Code":"60000101"}]},{"Name":"Freight Paid","Description":"Freight Paid","IsActive":true,"Code":"608001","Accounts":[{"Name":"Freight Paid","Description":"Freight Paid","IsActive":true,"Code":"60800101"}]},{"Name":"Discount Given","Description":"Discount Given","IsActive":true,"Code":"607001","Accounts":[{"Name":"Discount Given","Description":"Discount Given","IsActive":true,"Code":"60700101"}]},{"Name":"Depreciation Expense","Description":"Depreciation Expense","IsActive":true,"Code":"606001","Accounts":[{"Name":"Depreciation Expense","Description":"Depreciation Expense","IsActive":true,"Code":"60600101"}]},{"Name":"General Expences","Description":"General Expences","IsActive":true,"Code":"605050","Accounts":[{"Name":"General Expences","Description":"General Expences","IsActive":true,"Code":"60505001"}]},{"Name":"Payroll","Description":"Payroll","IsActive":true,"Code":"603001","Accounts":[{"Name":"Payroll","Description":"Payroll","IsActive":true,"Code":"60300101"}]},{"Name":"Utilities","Description":"Utilities","IsActive":true,"Code":"604001","Accounts":[{"Name":"Utilities","Description":"Utilities","IsActive":true,"Code":"60400101"}]},{"Name":"Rent","Description":"Rent","IsActive":true,"Code":"604050","Accounts":[{"Name":"Rent","Description":"Rent","IsActive":true,"Code":"60405001"}]},{"Name":"Legal Expences","Description":"Legal Expences","IsActive":true,"Code":"605001","Accounts":[{"Name":"Legal Expences","Description":"Legal Expences","IsActive":true,"Code":"60500101"}]}]}]}'
WHERE [Id] = 'ecfe29c8-c6af-4a3d-9c24-f87b30bf831c';
SELECT @@ROWCOUNT;




UPDATE [Companies] SET [CreatedDate] = '2021-07-28T15:03:28.6883439+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210728100331_ChangeInCoa', N'2.2.6-servicing-10079');



CREATE TABLE [Cities] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [Code] nvarchar(max) NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Cities] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Cities_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [Regions] (
    [Id] uniqueidentifier NOT NULL,
    [CountryId] nvarchar(150) NULL,
    [StateId] nvarchar(150) NULL,
    [CityId] uniqueidentifier NOT NULL,
    [Area] nvarchar(150) NULL,
    [isActive] bit NOT NULL,
    [Code] nvarchar(150) NULL,
    [Description] nvarchar(max) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Regions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Regions_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Regions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-08-09T11:39:38.5762276+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_Cities_CompanyId] ON [Cities] ([CompanyId]);



CREATE INDEX [IX_Regions_CityId] ON [Regions] ([CityId]);



CREATE INDEX [IX_Regions_CompanyId] ON [Regions] ([CompanyId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210809063941_RegionStateAndCountry', N'2.2.6-servicing-10079');



ALTER TABLE [Companies] ADD [IsMultiUnit] bit NOT NULL DEFAULT 0;



ALTER TABLE [Companies] ADD [IsProduction] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-08-09T16:01:34.6998311+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210809110136_add-multiunit-setting', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [AreaId] uniqueidentifier NULL;



ALTER TABLE [Sales] ADD [EmployeeId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-08-09T16:18:44.1892076+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_Sales_AreaId] ON [Sales] ([AreaId]);



CREATE INDEX [IX_Sales_EmployeeId] ON [Sales] ([EmployeeId]);



ALTER TABLE [Sales] ADD CONSTRAINT [FK_Sales_Regions_AreaId] FOREIGN KEY ([AreaId]) REFERENCES [Regions] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [Sales] ADD CONSTRAINT [FK_Sales_Employees_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [Employees] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210809111846_EmployeeAndAeraInSaLeInvoice', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] DROP CONSTRAINT [FK_Sales_Employees_EmployeeId];



UPDATE [Companies] SET [CreatedDate] = '2021-08-09T17:30:31.8166350+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




ALTER TABLE [Sales] ADD CONSTRAINT [FK_Sales_EmployeeRegistrations_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [EmployeeRegistrations] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210809123034_EmployeeRelationWithSaleInvoice', N'2.2.6-servicing-10079');



ALTER TABLE [Products] ADD [BasicUnit] nvarchar(max) NULL;



ALTER TABLE [Products] ADD [IsRaw] bit NOT NULL DEFAULT 0;



ALTER TABLE [Products] ADD [LevelOneUnit] nvarchar(max) NULL;



ALTER TABLE [Products] ADD [SalePriceUnit] nvarchar(max) NULL;



ALTER TABLE [Products] ADD [UnitPerPack] decimal(18,2) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-08-09T19:07:25.7088235+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210809140727_Add-Product-Unit-Level', N'2.2.6-servicing-10079');



CREATE TABLE [SaleOrders] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [RegistrationNo] nvarchar(max) NOT NULL,
    [CustomerId] uniqueidentifier NOT NULL,
    [Refrence] nvarchar(max) NULL,
    [PaymentMethod] nvarchar(max) NULL,
    [SheduleDelivery] nvarchar(max) NULL,
    [Days] nvarchar(max) NULL,
    [ApprovalStatus] int NOT NULL,
    [Note] nvarchar(max) NULL,
    [IsActive] bit NOT NULL,
    [IsFreight] bit NOT NULL,
    [IsLabour] bit NOT NULL,
    [IsClose] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_SaleOrders] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_SaleOrders_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_SaleOrders_Contacts_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [Contacts] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [SaleOrderItems] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [UnitPrice] decimal(18,4) NOT NULL,
    [Quantity] int NOT NULL,
    [Discount] decimal(18,2) NOT NULL,
    [FixDiscount] decimal(18,4) NOT NULL,
    [TaxRateId] uniqueidentifier NOT NULL,
    [SaleOrderId] uniqueidentifier NOT NULL,
    [ExpiryDate] datetime2 NULL,
    [BatchNo] nvarchar(max) NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_SaleOrderItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_SaleOrderItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SaleOrderItems_SaleOrders_SaleOrderId] FOREIGN KEY ([SaleOrderId]) REFERENCES [SaleOrders] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SaleOrderItems_TaxRates_TaxRateId] FOREIGN KEY ([TaxRateId]) REFERENCES [TaxRates] ([Id]) ON DELETE CASCADE
);



UPDATE [Companies] SET [CreatedDate] = '2021-08-10T11:12:44.8090542+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_SaleOrderItems_ProductId] ON [SaleOrderItems] ([ProductId]);



CREATE INDEX [IX_SaleOrderItems_SaleOrderId] ON [SaleOrderItems] ([SaleOrderId]);



CREATE INDEX [IX_SaleOrderItems_TaxRateId] ON [SaleOrderItems] ([TaxRateId]);



CREATE INDEX [IX_SaleOrders_CompanyId] ON [SaleOrders] ([CompanyId]);



CREATE INDEX [IX_SaleOrders_CustomerId] ON [SaleOrders] ([CustomerId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210810061247_SaleOrder', N'2.2.6-servicing-10079');



ALTER TABLE [PurchasePostItems] ADD [HighQty] decimal(18,2) NULL;



ALTER TABLE [PurchasePostItems] ADD [UnitPerPack] decimal(18,2) NULL;



ALTER TABLE [PurchaseOrderItems] ADD [HighQty] decimal(18,2) NULL;



ALTER TABLE [PurchaseOrderItems] ADD [UnitPerPack] decimal(18,2) NULL;



ALTER TABLE [PurchaseItems] ADD [HighQty] decimal(18,2) NULL;



ALTER TABLE [PurchaseItems] ADD [UnitPerPack] decimal(18,2) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-08-10T18:14:40.0395883+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210810131442_high-quantity-in-purchase', N'2.2.6-servicing-10079');



CREATE TABLE [RecipeNos] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [ExpireDate] datetime2 NULL,
    [RegistrationNo] nvarchar(max) NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [Quantity] int NOT NULL,
    [ApprovalStatus] int NOT NULL,
    [Note] nvarchar(max) NULL,
    [IsActive] bit NOT NULL,
    [IsClose] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_RecipeNos] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_RecipeNos_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_RecipeNos_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [RecipeItems] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [HighQuantity] int NOT NULL,
    [Quantity] int NOT NULL,
    [Waste] decimal(18,2) NOT NULL,
    [RecipeNoId] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_RecipeItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_RecipeItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_RecipeItems_RecipeNos_RecipeNoId] FOREIGN KEY ([RecipeNoId]) REFERENCES [RecipeNos] ([Id]) ON DELETE CASCADE
);



UPDATE [Companies] SET [CreatedDate] = '2021-08-11T12:51:00.0408165+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_RecipeItems_ProductId] ON [RecipeItems] ([ProductId]);



CREATE INDEX [IX_RecipeItems_RecipeNoId] ON [RecipeItems] ([RecipeNoId]);



CREATE INDEX [IX_RecipeNos_CompanyId] ON [RecipeNos] ([CompanyId]);



CREATE UNIQUE INDEX [IX_RecipeNos_ProductId] ON [RecipeNos] ([ProductId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210811075102_RecipeNo', N'2.2.6-servicing-10079');



ALTER TABLE [RecipeItems] ADD [BaseUnit] nvarchar(max) NULL;



ALTER TABLE [RecipeItems] ADD [LevelOneUnit] nvarchar(max) NULL;



ALTER TABLE [RecipeItems] ADD [UnitPerPack] int NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-08-11T15:03:18.6067176+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210811100320_ChangeinReciptItem', N'2.2.6-servicing-10079');



DROP INDEX [IX_RecipeNos_ProductId] ON [RecipeNos];



UPDATE [Companies] SET [CreatedDate] = '2021-08-11T15:40:23.6176625+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_RecipeNos_ProductId] ON [RecipeNos] ([ProductId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210811104026_ChangeInRelationProduct', N'2.2.6-servicing-10079');



EXEC sp_rename N'[RecipeItems].[BaseUnit]', N'BasicUnit', N'COLUMN';



UPDATE [Companies] SET [CreatedDate] = '2021-08-11T15:44:11.7495012+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210811104414_BasicUnitInRecipt', N'2.2.6-servicing-10079');



CREATE TABLE [DispatchNote] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [RegistrationNo] nvarchar(max) NOT NULL,
    [CustomerId] uniqueidentifier NOT NULL,
    [Refrence] nvarchar(max) NULL,
    [ApprovalStatus] int NOT NULL,
    [Note] nvarchar(max) NULL,
    [IsClose] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_DispatchNote] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DispatchNote_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_DispatchNote_Contacts_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [Contacts] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [DispatchNoteItem] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [UnitPrice] decimal(18,2) NOT NULL,
    [Quantity] int NOT NULL,
    [DispatchNoteId] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_DispatchNoteItem] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DispatchNoteItem_DispatchNote_DispatchNoteId] FOREIGN KEY ([DispatchNoteId]) REFERENCES [DispatchNote] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_DispatchNoteItem_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE
);



UPDATE [Companies] SET [CreatedDate] = '2021-08-11T16:07:26.0976394+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_DispatchNote_CompanyId] ON [DispatchNote] ([CompanyId]);



CREATE INDEX [IX_DispatchNote_CustomerId] ON [DispatchNote] ([CustomerId]);



CREATE INDEX [IX_DispatchNoteItem_DispatchNoteId] ON [DispatchNoteItem] ([DispatchNoteId]);



CREATE INDEX [IX_DispatchNoteItem_ProductId] ON [DispatchNoteItem] ([ProductId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210811110729_dispatch-note-database', N'2.2.6-servicing-10079');



ALTER TABLE [DispatchNote] DROP CONSTRAINT [FK_DispatchNote_Companies_CompanyId];



ALTER TABLE [DispatchNote] DROP CONSTRAINT [FK_DispatchNote_Contacts_CustomerId];



ALTER TABLE [DispatchNoteItem] DROP CONSTRAINT [FK_DispatchNoteItem_DispatchNote_DispatchNoteId];



ALTER TABLE [DispatchNoteItem] DROP CONSTRAINT [FK_DispatchNoteItem_Products_ProductId];



ALTER TABLE [DispatchNoteItem] DROP CONSTRAINT [PK_DispatchNoteItem];



ALTER TABLE [DispatchNote] DROP CONSTRAINT [PK_DispatchNote];



EXEC sp_rename N'[DispatchNoteItem]', N'DispatchNoteItems';



EXEC sp_rename N'[DispatchNote]', N'DispatchNotes';



EXEC sp_rename N'[DispatchNoteItems].[IX_DispatchNoteItem_ProductId]', N'IX_DispatchNoteItems_ProductId', N'INDEX';



EXEC sp_rename N'[DispatchNoteItems].[IX_DispatchNoteItem_DispatchNoteId]', N'IX_DispatchNoteItems_DispatchNoteId', N'INDEX';



EXEC sp_rename N'[DispatchNotes].[IX_DispatchNote_CustomerId]', N'IX_DispatchNotes_CustomerId', N'INDEX';



EXEC sp_rename N'[DispatchNotes].[IX_DispatchNote_CompanyId]', N'IX_DispatchNotes_CompanyId', N'INDEX';



ALTER TABLE [DispatchNoteItems] ADD CONSTRAINT [PK_DispatchNoteItems] PRIMARY KEY ([Id]);



ALTER TABLE [DispatchNotes] ADD CONSTRAINT [PK_DispatchNotes] PRIMARY KEY ([Id]);



UPDATE [Companies] SET [CreatedDate] = '2021-08-11T18:52:04.6100378+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




ALTER TABLE [DispatchNoteItems] ADD CONSTRAINT [FK_DispatchNoteItems_DispatchNotes_DispatchNoteId] FOREIGN KEY ([DispatchNoteId]) REFERENCES [DispatchNotes] ([Id]) ON DELETE CASCADE;



ALTER TABLE [DispatchNoteItems] ADD CONSTRAINT [FK_DispatchNoteItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE;



ALTER TABLE [DispatchNotes] ADD CONSTRAINT [FK_DispatchNotes_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [DispatchNotes] ADD CONSTRAINT [FK_DispatchNotes_Contacts_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [Contacts] ([Id]) ON DELETE CASCADE;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210811135206_dispatch-note-database-dbcontext', N'2.2.6-servicing-10079');



ALTER TABLE [SaleOrderItems] ADD [QuantityOut] int NOT NULL DEFAULT 0;



ALTER TABLE [DispatchNotes] ADD [SaleOrderId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-08-12T11:47:20.4913383+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_DispatchNotes_SaleOrderId] ON [DispatchNotes] ([SaleOrderId]);



ALTER TABLE [DispatchNotes] ADD CONSTRAINT [FK_DispatchNotes_SaleOrders_SaleOrderId] FOREIGN KEY ([SaleOrderId]) REFERENCES [SaleOrders] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210812064723_dispatch-relation-with-saleorder', N'2.2.6-servicing-10079');



CREATE TABLE [ProductionBatch] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [RegistrationNo] nvarchar(max) NOT NULL,
    [NoOfBatches] nvarchar(max) NULL,
    [Note] nvarchar(max) NULL,
    [SaleOrderId] uniqueidentifier NULL,
    [RecipeNoId] uniqueidentifier NOT NULL,
    [ApprovalStatus] int NOT NULL,
    [IsActive] bit NOT NULL,
    [IsClose] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_ProductionBatch] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ProductionBatch_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ProductionBatch_RecipeNos_RecipeNoId] FOREIGN KEY ([RecipeNoId]) REFERENCES [RecipeNos] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ProductionBatch_SaleOrders_SaleOrderId] FOREIGN KEY ([SaleOrderId]) REFERENCES [SaleOrders] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [ProductionBatchItem] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [HighQuantity] int NOT NULL,
    [UnitPerPack] int NOT NULL,
    [BasicUnit] nvarchar(max) NULL,
    [LevelOneUnit] nvarchar(max) NULL,
    [Quantity] int NOT NULL,
    [Waste] decimal(18,2) NOT NULL,
    [ProductionBatchId] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_ProductionBatchItem] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ProductionBatchItem_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_ProductionBatchItem_ProductionBatch_ProductionBatchId] FOREIGN KEY ([ProductionBatchId]) REFERENCES [ProductionBatch] ([Id]) ON DELETE CASCADE
);



UPDATE [Companies] SET [CreatedDate] = '2021-08-12T12:25:30.1812018+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_ProductionBatch_CompanyId] ON [ProductionBatch] ([CompanyId]);



CREATE INDEX [IX_ProductionBatch_RecipeNoId] ON [ProductionBatch] ([RecipeNoId]);



CREATE INDEX [IX_ProductionBatch_SaleOrderId] ON [ProductionBatch] ([SaleOrderId]);



CREATE INDEX [IX_ProductionBatchItem_ProductId] ON [ProductionBatchItem] ([ProductId]);



CREATE INDEX [IX_ProductionBatchItem_ProductionBatchId] ON [ProductionBatchItem] ([ProductionBatchId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210812072533_ProductionBatch', N'2.2.6-servicing-10079');



ALTER TABLE [ProductionBatch] DROP CONSTRAINT [FK_ProductionBatch_Companies_CompanyId];



ALTER TABLE [ProductionBatch] DROP CONSTRAINT [FK_ProductionBatch_RecipeNos_RecipeNoId];



ALTER TABLE [ProductionBatch] DROP CONSTRAINT [FK_ProductionBatch_SaleOrders_SaleOrderId];



ALTER TABLE [ProductionBatchItem] DROP CONSTRAINT [FK_ProductionBatchItem_Products_ProductId];



ALTER TABLE [ProductionBatchItem] DROP CONSTRAINT [FK_ProductionBatchItem_ProductionBatch_ProductionBatchId];



ALTER TABLE [ProductionBatchItem] DROP CONSTRAINT [PK_ProductionBatchItem];



ALTER TABLE [ProductionBatch] DROP CONSTRAINT [PK_ProductionBatch];



EXEC sp_rename N'[ProductionBatchItem]', N'ProductionBatchItems';



EXEC sp_rename N'[ProductionBatch]', N'ProductionBatchs';



EXEC sp_rename N'[ProductionBatchItems].[IX_ProductionBatchItem_ProductionBatchId]', N'IX_ProductionBatchItems_ProductionBatchId', N'INDEX';



EXEC sp_rename N'[ProductionBatchItems].[IX_ProductionBatchItem_ProductId]', N'IX_ProductionBatchItems_ProductId', N'INDEX';



EXEC sp_rename N'[ProductionBatchs].[IX_ProductionBatch_SaleOrderId]', N'IX_ProductionBatchs_SaleOrderId', N'INDEX';



EXEC sp_rename N'[ProductionBatchs].[IX_ProductionBatch_RecipeNoId]', N'IX_ProductionBatchs_RecipeNoId', N'INDEX';



EXEC sp_rename N'[ProductionBatchs].[IX_ProductionBatch_CompanyId]', N'IX_ProductionBatchs_CompanyId', N'INDEX';



ALTER TABLE [ProductionBatchItems] ADD CONSTRAINT [PK_ProductionBatchItems] PRIMARY KEY ([Id]);



ALTER TABLE [ProductionBatchs] ADD CONSTRAINT [PK_ProductionBatchs] PRIMARY KEY ([Id]);



UPDATE [Companies] SET [CreatedDate] = '2021-08-12T12:33:16.6823969+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




ALTER TABLE [ProductionBatchItems] ADD CONSTRAINT [FK_ProductionBatchItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE;



ALTER TABLE [ProductionBatchItems] ADD CONSTRAINT [FK_ProductionBatchItems_ProductionBatchs_ProductionBatchId] FOREIGN KEY ([ProductionBatchId]) REFERENCES [ProductionBatchs] ([Id]) ON DELETE CASCADE;



ALTER TABLE [ProductionBatchs] ADD CONSTRAINT [FK_ProductionBatchs_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [ProductionBatchs] ADD CONSTRAINT [FK_ProductionBatchs_RecipeNos_RecipeNoId] FOREIGN KEY ([RecipeNoId]) REFERENCES [RecipeNos] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [ProductionBatchs] ADD CONSTRAINT [FK_ProductionBatchs_SaleOrders_SaleOrderId] FOREIGN KEY ([SaleOrderId]) REFERENCES [SaleOrders] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210812073319_ProductionBatch1.1', N'2.2.6-servicing-10079');



ALTER TABLE [RecipeItems] ADD [WareHouseId] uniqueidentifier NULL;



ALTER TABLE [ProductionBatchItems] ADD [WarehouseId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-08-12T15:21:34.2177359+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_RecipeItems_WareHouseId] ON [RecipeItems] ([WareHouseId]);



CREATE INDEX [IX_ProductionBatchItems_WarehouseId] ON [ProductionBatchItems] ([WarehouseId]);



ALTER TABLE [ProductionBatchItems] ADD CONSTRAINT [FK_ProductionBatchItems_Warehouses_WarehouseId] FOREIGN KEY ([WarehouseId]) REFERENCES [Warehouses] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [RecipeItems] ADD CONSTRAINT [FK_RecipeItems_Warehouses_WareHouseId] FOREIGN KEY ([WareHouseId]) REFERENCES [Warehouses] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210812102137_ProductionBatch1.2', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-08-13T15:23:44.9801980+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] ON;
INSERT INTO [NobleModules] ([Id], [BusinessType], [Description], [ModuleName])
VALUES (12, 0, N'Production', N'Production');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES (259, N'Recipe', N'Can Save Recipe as Draft', 12),
(281, N'Despatch Note', N'Can Delete Despatch Note as Post', 12),
(282, N'Despatch Note', N'Can View Despatch Note as Post', 12),
(283, N'Production Stock', N'Can Save Production Stock as Draft', 12),
(284, N'Production Stock', N'Can Edit Production Stock as Draft', 12),
(285, N'Production Stock', N'Can Delete Production Stock as Draft', 12),
(286, N'Production Stock', N'Can View Production Stock as Draft', 12),
(287, N'Production Stock', N'Can Save Production Stock as Post', 12),
(280, N'Despatch Note', N'Can Edit Despatch Note as Post', 12),
(288, N'Production Stock', N'Can Edit Production Stock as Post', 12),
(290, N'Production Stock', N'Can View Production Stock as Post', 12),
(291, N'Sale Order', N'Can Sale Order as Draft', 12),
(292, N'Sale Order', N'Can Sale Order as Draft', 12),
(293, N'Sale Order', N'Can Sale Order as Draft', 12),
(294, N'Sale Order', N'Can Sale Order as Draft', 12),
(295, N'Sale Order', N'Can Sale Order as Post', 12),
(296, N'Sale Order', N'Can Sale Order as Post', 12),
(289, N'Production Stock', N'Can Delete Production Stock as Post', 12),
(279, N'Despatch Note', N'Can Save Despatch Note as Post', 12),
(278, N'Despatch Note', N'Can View Despatch Note as Draft', 12),
(277, N'Despatch Note', N'Can Delete Despatch Note as Draft', 12),
(260, N'Recipe', N'Can Edit Recipe as Draft', 12),
(261, N'Recipe', N'Can Delete Recipe as Draft', 12),
(262, N'Recipe', N'Can View  Recipe as Draft', 12),
(263, N'Recipe', N'Can Save Recipe as Post', 12),
(264, N'Recipe', N'Can Edit Recipe as Post', 12),
(265, N'Recipe', N'Can Delete Recipe as Post', 12),
(266, N'Recipe', N'Can View  Recipe as Post', 12),
(267, N'Production Batch', N'Can Save Production Batch as Draft', 12),
(268, N'Production Batch', N'Can Edit Production Batch as Draft', 12),
(269, N'Production Batch', N'Can Delete Production Batch as Draft', 12),
(270, N'Production Batch', N'Can View Production Batch as Draft', 12),
(271, N'Production Batch', N'Can Save Production Batch as Post', 12),
(272, N'Production Batch', N'Can Edit Production Batch as Post', 12),
(273, N'Production Batch', N'Can Delete Production Batch as Post', 12),
(274, N'Production Batch', N'Can View Production Batch as Post', 12),
(275, N'Despatch Note', N'Can Save Despatch Note as Draft', 12),
(276, N'Despatch Note', N'Can Edit Despatch Note as Draft', 12),
(297, N'Sale Order', N'Can Sale Order as Post', 12),
(298, N'Sale Order', N'Can Sale Order as Post', 12);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210813102348_PermissionOnProductionBatch', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-08-13T16:33:22.8243756+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Save Sale Order as Draft'
WHERE [Id] = 291;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Edit Sale Order as Draft'
WHERE [Id] = 292;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Delete Sale Order as Draft'
WHERE [Id] = 293;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can View Sale Order as Draft'
WHERE [Id] = 294;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Save Sale Order as Post'
WHERE [Id] = 295;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Edit Sale Order as Post'
WHERE [Id] = 296;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Delete Sale Order as Post'
WHERE [Id] = 297;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can View Sale Order as Post'
WHERE [Id] = 298;
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210813113326_PermissionOnProductionBatch1.1', N'2.2.6-servicing-10079');



ALTER TABLE [Purchases] ADD [TaxMethod] nvarchar(max) NULL;



ALTER TABLE [Purchases] ADD [TaxRateId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [PurchasePosts] ADD [TaxMethod] nvarchar(max) NULL;



ALTER TABLE [PurchasePosts] ADD [TaxRateId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [PurchaseOrders] ADD [TaxMethod] nvarchar(max) NULL;



ALTER TABLE [PurchaseOrders] ADD [TaxRateId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



UPDATE [Companies] SET [CreatedDate] = '2021-08-23T18:03:24.6667220+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210823130326_purchase-taxrate-method-db', N'2.2.6-servicing-10079');



ALTER TABLE [Contacts] ADD [Coordinator] nvarchar(max) NULL;



ALTER TABLE [Contacts] ADD [Currency1] nvarchar(max) NULL;



ALTER TABLE [Contacts] ADD [Currency2] nvarchar(max) NULL;



ALTER TABLE [Contacts] ADD [Location] nvarchar(max) NULL;



ALTER TABLE [Contacts] ADD [Telephone] nvarchar(max) NULL;



ALTER TABLE [Contacts] ADD [Website] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-08-24T16:35:17.8653533+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210824113521_ChangeInEmployee', N'2.2.6-servicing-10079');



ALTER TABLE [LoginPermissions] ADD [InvoiceWoInventory] bit NOT NULL DEFAULT 0;



ALTER TABLE [Companies] ADD [InvoiceWoInventory] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-08-26T10:48:44.8605199+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210826054847_InvoiceWoInventory', N'2.2.6-servicing-10079');



CREATE TABLE [PrintSettings] (
    [Id] uniqueidentifier NOT NULL,
    [PrintSize] int NOT NULL,
    [isActive] bit NOT NULL,
    [TermsInAr] nvarchar(max) NULL,
    [TermsInEng] nvarchar(max) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_PrintSettings] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PrintSettings_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-08-27T14:51:23.4973322+05:00'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_PrintSettings_CompanyId] ON [PrintSettings] ([CompanyId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210827095127_PrintSetting', N'2.2.6-servicing-10079');



ALTER TABLE [Companies] ADD [CompanyNameArabic] nvarchar(max) NULL;



ALTER TABLE [Companies] ADD [CompanyNameEnglish] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-08-31T08:31:43.1801882Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210831083145_ChangeInCompanyTable', N'2.2.6-servicing-10079');



ALTER TABLE [Companies] ADD [IsTouchInvoice] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-02T06:00:39.9513337Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210902060041_salesman-assign-invoice-screen', N'2.2.6-servicing-10079');



DECLARE @var19 sysname;
SELECT @var19 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Companies]') AND [c].[name] = N'IsTouchInvoice');
IF @var19 IS NOT NULL EXEC(N'ALTER TABLE [Companies] DROP CONSTRAINT [' + @var19 + '];');
ALTER TABLE [Companies] DROP COLUMN [IsTouchInvoice];



ALTER TABLE [LoginPermissions] ADD [IsTouchInvoice] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-02T06:58:52.7269535Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210902065854_salesman-assign-invoice-screen-role', N'2.2.6-servicing-10079');



ALTER TABLE [Inventories] ADD [CurrentStockValue] decimal(18,4) NOT NULL DEFAULT 0.0;



ALTER TABLE [Inventories] ADD [SalePrice] decimal(18,4) NOT NULL DEFAULT 0.0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-02T12:47:18.4346202Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210902124721_Update-InventoryTable', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [RefrenceNo] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-03T05:52:30.1738548Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210903055232_RefrenceNoInSaleInvoice', N'2.2.6-servicing-10079');



ALTER TABLE [Warehouses] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [Units] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [TaxRates] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [SubCateries] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [Sizes] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [RolesPermissions] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [PurchaseAttachments] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [PaymentOptions] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [Origins] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [NobleRoles] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [NobleModules] ADD [ArabicName] nvarchar(max) NULL;



ALTER TABLE [ModulesNames] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [MobileOrders] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [Currencies] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [CostCenters] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [Colors] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [Cities] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [Cateries] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [CashCustomer] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [BundleCateries] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [Brands] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [Banks] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [Attachments] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [AccountTypes] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [AccountTemplates] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [AccountsLevelTwo] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [AccountsLevelOne] ADD [NameArabic] nvarchar(max) NULL;



ALTER TABLE [Accounts] ADD [NameArabic] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-06T06:35:42.5752533Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210906063544_ArabicNameInAllTable', N'2.2.6-servicing-10079');



ALTER TABLE [AspNetUsers] ADD [IsActive] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-06T12:46:59.1508349Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210906124700_User-Isactive', N'2.2.6-servicing-10079');



ALTER TABLE [EmployeeRegistrations] ADD [IsActive] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-06T14:37:14.7891795Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210906143716_Employee-Isactive', N'2.2.6-servicing-10079');



CREATE TABLE [SyncRecords] (
    [Id] int NOT NULL IDENTITY,
    [CompanyId] uniqueidentifier NOT NULL,
    [Table] nvarchar(30) NULL,
    [ColumnId] nvarchar(50) NULL,
    [ColumnType] nvarchar(30) NULL,
    [Push] bit NOT NULL DEFAULT 0,
    [Pull] bit NOT NULL DEFAULT 0,
    [Action] nvarchar(10) NULL,
    [ChangeDate] datetime2 NOT NULL,
    [PushDate] nvarchar(max) NULL,
    [PullDate] nvarchar(max) NULL,
    CONSTRAINT [PK_SyncRecords] PRIMARY KEY ([Id])
);



UPDATE [Companies] SET [CreatedDate] = '2021-09-07T02:44:23.7019659Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210907024426_add-syncRecord', N'2.2.6-servicing-10079');



ALTER TABLE [Companies] ADD [IsArea] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-08T11:02:27.6363060Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210908110229_IsArea-add-in-Company', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-09-08T11:25:30.3993743Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ArabicName', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] ON;
INSERT INTO [NobleModules] ([Id], [ArabicName], [BusinessType], [Description], [ModuleName])
VALUES (13, NULL, 0, N'System', N'System');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ArabicName', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES (299, N'System', N'Can Change Company Profile', 13),
(300, N'System', N'Database Backup', 13),
(301, N'System', N'Restore Database', 13),
(302, N'System', N'Flush Database', 13),
(303, N'System', N'Can Change Invoice Setting', 13);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210908112532_ChangeInPermissionForSystem', N'2.2.6-servicing-10079');



ALTER TABLE [LoginPermissions] ADD [AllowAll] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-08T12:22:07.7576345Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210908122209_AllowAll-to-See-User', N'2.2.6-servicing-10079');



ALTER TABLE [Companies] ADD [IsProceed] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-09T10:37:04.9401548Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210909103706_IsProceedInCompanyProfile', N'2.2.6-servicing-10079');



ALTER TABLE [AspNetUsers] ADD [IsProceed] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-09T10:55:41.1899230Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210909105543_IsProceed', N'2.2.6-servicing-10079');



ALTER TABLE [Companies] ADD [Arabic] bit NOT NULL DEFAULT 0;



ALTER TABLE [Companies] ADD [English] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-12T09:35:18.5454370Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210912093520_Language-Setting', N'2.2.6-servicing-10079');



ALTER TABLE [SyncRecords] ADD [ColumnName] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-12T19:34:47.2877559Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210912193452_add-columnName', N'2.2.6-servicing-10079');



DECLARE @var20 sysname;
SELECT @var20 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[StockAdjustments]') AND [c].[name] = N'Narration');
IF @var20 IS NOT NULL EXEC(N'ALTER TABLE [StockAdjustments] DROP CONSTRAINT [' + @var20 + '];');
ALTER TABLE [StockAdjustments] ALTER COLUMN [Narration] nvarchar(200) NULL;



DECLARE @var21 sysname;
SELECT @var21 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CashCustomer]') AND [c].[name] = N'Mobile');
IF @var21 IS NOT NULL EXEC(N'ALTER TABLE [CashCustomer] DROP CONSTRAINT [' + @var21 + '];');
ALTER TABLE [CashCustomer] ALTER COLUMN [Mobile] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-14T06:31:13.4991192Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210914063116_Change-required', N'2.2.6-servicing-10079');



ALTER TABLE [Products] ADD [Assortment] nvarchar(200) NULL;



ALTER TABLE [Products] ADD [StyleNumber] nvarchar(200) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-15T12:34:59.0007502Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210915123500_assortment-style-in-product', N'2.2.6-servicing-10079');



ALTER TABLE [SyncRecords] ADD [IsGeneral] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-16T02:31:06.8996512Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210916023110_Add-IsGeneral', N'2.2.6-servicing-10079');



ALTER TABLE [Companies] ADD [DayStart] bit NOT NULL DEFAULT 0;



ALTER TABLE [Companies] ADD [Terminal] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-16T06:53:41.7915655Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210916065343_daystart=terminal-on-company-base', N'2.2.6-servicing-10079');



ALTER TABLE [UserTerminals] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [StockAdjustmentDetails] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [SaleOrderItems] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [SaleItems] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [RecipeItems] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [PurchasePostItems] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [PurchaseOrderItems] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [PurchaseItems] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [PurchaseAttachments] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [ProductionBatchItems] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [PaymentVoucherDetails] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [OtherCurrencies] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [MobileOrderItems] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [JournalVoucherItems] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [EmployeeRegistrationAttachments] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [EmployeeDepartments] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [EmployeeAttachments] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [DispatchNoteItems] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [DailyExpenseDetails] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [ContactAttachments] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [Attachments] ADD [CompanyId] uniqueidentifier NULL DEFAULT '00000000-0000-0000-0000-000000000000';



UPDATE [Companies] SET [CreatedDate] = '2021-09-16T16:37:31.8820727Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_UserTerminals_CompanyId] ON [UserTerminals] ([CompanyId]);



CREATE INDEX [IX_StockAdjustmentDetails_CompanyId] ON [StockAdjustmentDetails] ([CompanyId]);



CREATE INDEX [IX_SaleOrderItems_CompanyId] ON [SaleOrderItems] ([CompanyId]);



CREATE INDEX [IX_SaleItems_CompanyId] ON [SaleItems] ([CompanyId]);



CREATE INDEX [IX_RecipeItems_CompanyId] ON [RecipeItems] ([CompanyId]);



CREATE INDEX [IX_PurchasePostItems_CompanyId] ON [PurchasePostItems] ([CompanyId]);



CREATE INDEX [IX_PurchaseOrderItems_CompanyId] ON [PurchaseOrderItems] ([CompanyId]);



CREATE INDEX [IX_PurchaseItems_CompanyId] ON [PurchaseItems] ([CompanyId]);



CREATE INDEX [IX_PurchaseAttachments_CompanyId] ON [PurchaseAttachments] ([CompanyId]);



CREATE INDEX [IX_ProductionBatchItems_CompanyId] ON [ProductionBatchItems] ([CompanyId]);



CREATE INDEX [IX_PaymentVoucherDetails_CompanyId] ON [PaymentVoucherDetails] ([CompanyId]);



CREATE INDEX [IX_OtherCurrencies_CompanyId] ON [OtherCurrencies] ([CompanyId]);



CREATE INDEX [IX_MobileOrderItems_CompanyId] ON [MobileOrderItems] ([CompanyId]);



CREATE INDEX [IX_JournalVoucherItems_CompanyId] ON [JournalVoucherItems] ([CompanyId]);



CREATE INDEX [IX_EmployeeRegistrationAttachments_CompanyId] ON [EmployeeRegistrationAttachments] ([CompanyId]);



CREATE INDEX [IX_EmployeeDepartments_CompanyId] ON [EmployeeDepartments] ([CompanyId]);



CREATE INDEX [IX_EmployeeAttachments_CompanyId] ON [EmployeeAttachments] ([CompanyId]);



CREATE INDEX [IX_DispatchNoteItems_CompanyId] ON [DispatchNoteItems] ([CompanyId]);



CREATE INDEX [IX_DailyExpenseDetails_CompanyId] ON [DailyExpenseDetails] ([CompanyId]);



CREATE INDEX [IX_ContactAttachments_CompanyId] ON [ContactAttachments] ([CompanyId]);



CREATE INDEX [IX_Attachments_CompanyId] ON [Attachments] ([CompanyId]);



ALTER TABLE [Attachments] ADD CONSTRAINT [FK_Attachments_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [ContactAttachments] ADD CONSTRAINT [FK_ContactAttachments_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [DailyExpenseDetails] ADD CONSTRAINT [FK_DailyExpenseDetails_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [DispatchNoteItems] ADD CONSTRAINT [FK_DispatchNoteItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [EmployeeAttachments] ADD CONSTRAINT [FK_EmployeeAttachments_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [EmployeeDepartments] ADD CONSTRAINT [FK_EmployeeDepartments_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [EmployeeRegistrationAttachments] ADD CONSTRAINT [FK_EmployeeRegistrationAttachments_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [JournalVoucherItems] ADD CONSTRAINT [FK_JournalVoucherItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [MobileOrderItems] ADD CONSTRAINT [FK_MobileOrderItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [OtherCurrencies] ADD CONSTRAINT [FK_OtherCurrencies_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [PaymentVoucherDetails] ADD CONSTRAINT [FK_PaymentVoucherDetails_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [ProductionBatchItems] ADD CONSTRAINT [FK_ProductionBatchItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [PurchaseAttachments] ADD CONSTRAINT [FK_PurchaseAttachments_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [PurchaseItems] ADD CONSTRAINT [FK_PurchaseItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [PurchaseOrderItems] ADD CONSTRAINT [FK_PurchaseOrderItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [PurchasePostItems] ADD CONSTRAINT [FK_PurchasePostItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [RecipeItems] ADD CONSTRAINT [FK_RecipeItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [SaleItems] ADD CONSTRAINT [FK_SaleItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [SaleOrderItems] ADD CONSTRAINT [FK_SaleOrderItems_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [StockAdjustmentDetails] ADD CONSTRAINT [FK_StockAdjustmentDetails_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [UserTerminals] ADD CONSTRAINT [FK_UserTerminals_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210916163735_add-Itenant-Interface', N'2.2.6-servicing-10079');



ALTER TABLE [Companies] ADD [Step1] bit NOT NULL DEFAULT 0;



ALTER TABLE [Companies] ADD [Step2] bit NOT NULL DEFAULT 0;



ALTER TABLE [Companies] ADD [Step3] bit NOT NULL DEFAULT 0;



ALTER TABLE [Companies] ADD [Step4] bit NOT NULL DEFAULT 0;



ALTER TABLE [Companies] ADD [Step5] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-20T06:38:36.8091472Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210920063838_StepsOfPermissionInComanyTable', N'2.2.6-servicing-10079');



ALTER TABLE [StockAdjustments] ADD [TaxMethod] nvarchar(max) NULL;



ALTER TABLE [StockAdjustments] ADD [TaxRateId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-20T10:12:22.1455430Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_StockAdjustments_TaxRateId] ON [StockAdjustments] ([TaxRateId]);



ALTER TABLE [StockAdjustments] ADD CONSTRAINT [FK_StockAdjustments_TaxRates_TaxRateId] FOREIGN KEY ([TaxRateId]) REFERENCES [TaxRates] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210920101223_taxrate-relation-stockadjustment', N'2.2.6-servicing-10079');



ALTER TABLE [LoginPermissions] ADD [PermissionToStartExpenseDay] bit NOT NULL DEFAULT 0;



ALTER TABLE [DailyExpenses] ADD [ApprovalStatus] int NOT NULL DEFAULT 0;



ALTER TABLE [DailyExpenses] ADD [OperationBy] uniqueidentifier NULL;



ALTER TABLE [DailyExpenses] ADD [OperationDate] datetime2 NULL;



ALTER TABLE [DailyExpenses] ADD [OperationPerson] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-21T07:28:28.2916233Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210921072830_ChanginInDailyExpense', N'2.2.6-servicing-10079');



ALTER TABLE [StockAdjustments] ADD [Reason] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-21T14:37:08.4126597Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210921143710_reason-in-stocadjust', N'2.2.6-servicing-10079');



ALTER TABLE [Contacts] ADD [IsRaw] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-22T06:52:23.1792647Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210922065224_Raw-Supplier', N'2.2.6-servicing-10079');



ALTER TABLE [DailyExpenses] ADD [PaymetType] nvarchar(max) NULL;



ALTER TABLE [DailyExpenses] ADD [Reason] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-22T11:03:24.6674855Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210922110326_ReasonInDailyExpense', N'2.2.6-servicing-10079');



ALTER TABLE [DayStarts] ADD [IsExpenseDay] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-23T06:58:13.6403115Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210923065815_expenseday-in-daystart', N'2.2.6-servicing-10079');



ALTER TABLE [EmployeeRegistrations] ADD [AccountId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-23T10:51:25.3967698Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_EmployeeRegistrations_AccountId] ON [EmployeeRegistrations] ([AccountId]);



ALTER TABLE [EmployeeRegistrations] ADD CONSTRAINT [FK_EmployeeRegistrations_Accounts_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210923105127_AddEmployeeAccount', N'2.2.6-servicing-10079');



ALTER TABLE [EmployeeRegistrations] DROP CONSTRAINT [FK_EmployeeRegistrations_Accounts_AccountId];



EXEC sp_rename N'[EmployeeRegistrations].[AccountId]', N'PayableAccountId', N'COLUMN';



EXEC sp_rename N'[EmployeeRegistrations].[IX_EmployeeRegistrations_AccountId]', N'IX_EmployeeRegistrations_PayableAccountId', N'INDEX';



ALTER TABLE [EmployeeRegistrations] ADD [EmployeeAccountId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-23T11:51:47.3444558Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_EmployeeRegistrations_EmployeeAccountId] ON [EmployeeRegistrations] ([EmployeeAccountId]);



ALTER TABLE [EmployeeRegistrations] ADD CONSTRAINT [FK_EmployeeRegistrations_Accounts_EmployeeAccountId] FOREIGN KEY ([EmployeeAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [EmployeeRegistrations] ADD CONSTRAINT [FK_EmployeeRegistrations_Accounts_PayableAccountId] FOREIGN KEY ([PayableAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210923115149_AccountInEmployee', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-09-27T07:06:01.9567097Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Save Expense as Draft'
WHERE [Id] = 196;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Edit Expense as Draft'
WHERE [Id] = 197;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Delete Expense as Draft'
WHERE [Id] = 198;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can View  Expense as Draft'
WHERE [Id] = 199;
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES (304, N'Expense', N'Can Save Expense as Post', 10),
(305, N'Expense', N'Can Edit Expense as Post', 10),
(306, N'Expense', N'Can Delete Expense as Post', 10),
(307, N'Expense', N'Can View  Expense as Post', 10),
(308, N'Expense', N'Can Save Expense as Reject', 10),
(309, N'Expense', N'Can Edit Expense as Reject', 10),
(310, N'Expense', N'Can Delete Expense as Reject', 10),
(311, N'Expense', N'Can View  Expense as Reject', 10);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210927070603_PermissionOfExpenseAsDraftPostRejct', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-09-27T07:20:03.6386913Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES (312, N'Expense', N'Can Bulk Expense Rejected', 10);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES (313, N'Expense', N'Can Bulk Expense Approved', 10);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210927072005_BulkApproveAndRejectInExpense', N'2.2.6-servicing-10079');



ALTER TABLE [Purchases] ADD [Raw] bit NOT NULL DEFAULT 0;



ALTER TABLE [PurchasePosts] ADD [Raw] bit NOT NULL DEFAULT 0;



ALTER TABLE [PurchaseOrders] ADD [Raw] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-27T07:20:46.0931188Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210927072047_purchase-raw-material-check', N'2.2.6-servicing-10079');



ALTER TABLE [WareHouseTransfers] ADD [ApprovalStatus] int NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-09-29T10:08:15.5468048Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210929100817_ApprovalStatusInStockTransfer', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-09-30T07:51:25.5207358Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Save Stock Transfer as Draft'
WHERE [Id] = 136;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Edit Stock Transfer as Draft'
WHERE [Id] = 137;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can Delete Stock Transfer as Draft'
WHERE [Id] = 138;
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can View  Stock Transfer as Draft'
WHERE [Id] = 139;
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES (318, N'Denomination Setup', N'Can Save Denomination Setup', 1),
(319, N'Denomination Setup', N'Can Edit Denomination Setup', 1),
(320, N'Denomination Setup', N'Can Delete Denomination Setup', 1),
(321, N'Denomination Setup', N'Can View Denomination Setup', 1),
(314, N'Stock Transfer', N'Can Save Stock Transfer as Post', 3),
(315, N'Stock Transfer', N'Can Edit Stock Transfer as Post', 3),
(316, N'Stock Transfer', N'Can Delete Stock Transfer as Post', 3),
(317, N'Stock Transfer', N'Can View  Stock Transfer as Draft', 3);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210930075127_DenominationSetupAndPermission', N'2.2.6-servicing-10079');



CREATE TABLE [DenominationSetups] (
    [Id] uniqueidentifier NOT NULL,
    [Number] nvarchar(max) NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_DenominationSetups] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DenominationSetups_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-09-30T08:52:20.3510789Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_DenominationSetups_CompanyId] ON [DenominationSetups] ([CompanyId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210930085222_DenominationSetup', N'2.2.6-servicing-10079');



DECLARE @var22 sysname;
SELECT @var22 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[DenominationSetups]') AND [c].[name] = N'Number');
IF @var22 IS NOT NULL EXEC(N'ALTER TABLE [DenominationSetups] DROP CONSTRAINT [' + @var22 + '];');
ALTER TABLE [DenominationSetups] ALTER COLUMN [Number] decimal(18,4) NOT NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-09-30T10:44:03.9039604Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210930104405_DenominationSetupDecimalNumber', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-09-30T11:07:22.5902166Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [Description] = N'Can View  Stock Transfer as Post'
WHERE [Id] = 317;
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210930110724_PermissionOnStockTransfer', N'2.2.6-servicing-10079');



ALTER TABLE [RecipeNos] ADD [RecipeName] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-10-04T05:57:21.0710002Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211004055722_recipe-name', N'2.2.6-servicing-10079');



ALTER TABLE [ProductionBatchs] ADD [DamageStock] decimal(18,2) NOT NULL DEFAULT 0.0;



ALTER TABLE [ProductionBatchs] ADD [EndTime] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';



ALTER TABLE [ProductionBatchs] ADD [LateReason] nvarchar(max) NULL;



ALTER TABLE [ProductionBatchs] ADD [RemainingStock] decimal(18,2) NOT NULL DEFAULT 0.0;



ALTER TABLE [ProductionBatchs] ADD [StartTime] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';



UPDATE [Companies] SET [CreatedDate] = '2021-10-04T06:06:33.3448685Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211004060635_ExectuationTimeInBatch', N'2.2.6-servicing-10079');



ALTER TABLE [ProductionBatchs] ADD [LateReasonCompletion] nvarchar(max) NULL;



ALTER TABLE [ProductionBatchs] ADD [LateReasonTransfer] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-10-04T14:38:59.5574543Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211004143901_ReasonFromCompletionInBatch', N'2.2.6-servicing-10079');



DECLARE @var23 sysname;
SELECT @var23 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ProductionBatchs]') AND [c].[name] = N'StartTime');
IF @var23 IS NOT NULL EXEC(N'ALTER TABLE [ProductionBatchs] DROP CONSTRAINT [' + @var23 + '];');
ALTER TABLE [ProductionBatchs] ALTER COLUMN [StartTime] datetime2 NULL;



DECLARE @var24 sysname;
SELECT @var24 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ProductionBatchs]') AND [c].[name] = N'EndTime');
IF @var24 IS NOT NULL EXEC(N'ALTER TABLE [ProductionBatchs] DROP CONSTRAINT [' + @var24 + '];');
ALTER TABLE [ProductionBatchs] ALTER COLUMN [EndTime] datetime2 NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-10-05T08:15:49.3625443Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211005081551_NullableDatesInBatch', N'2.2.6-servicing-10079');



ALTER TABLE [ProductionBatchs] ADD [CompleteBy] nvarchar(max) NULL;



ALTER TABLE [ProductionBatchs] ADD [ProcessBy] nvarchar(max) NULL;



ALTER TABLE [ProductionBatchs] ADD [TransferBy] nvarchar(max) NULL;



CREATE TABLE [ProductionStockTransfer] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NOT NULL,
    [Code] nvarchar(max) NULL,
    [DamageStock] decimal(18,2) NOT NULL,
    [RemainingStock] decimal(18,2) NOT NULL,
    [Note] nvarchar(max) NULL,
    [RemainingWareHouse] uniqueidentifier NOT NULL,
    [DamageWareHouse] uniqueidentifier NOT NULL,
    [Product] uniqueidentifier NOT NULL,
    [Quantity] decimal(18,4) NOT NULL,
    [RecipeName] nvarchar(max) NULL,
    CONSTRAINT [PK_ProductionStockTransfer] PRIMARY KEY ([Id])
);



UPDATE [Companies] SET [CreatedDate] = '2021-10-05T10:56:43.3630218Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211005105645_ProductionStockTransferInBatch', N'2.2.6-servicing-10079');



ALTER TABLE [ProductionStockTransfer] DROP CONSTRAINT [PK_ProductionStockTransfer];



DECLARE @var25 sysname;
SELECT @var25 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ProductionStockTransfer]') AND [c].[name] = N'Quantity');
IF @var25 IS NOT NULL EXEC(N'ALTER TABLE [ProductionStockTransfer] DROP CONSTRAINT [' + @var25 + '];');
ALTER TABLE [ProductionStockTransfer] DROP COLUMN [Quantity];



EXEC sp_rename N'[ProductionStockTransfer]', N'ProductionStockTransfers';



EXEC sp_rename N'[ProductionStockTransfers].[RecipeName]', N'ModifiedById', N'COLUMN';



EXEC sp_rename N'[ProductionStockTransfers].[Product]', N'RecipeId', N'COLUMN';



ALTER TABLE [ProductionStockTransfers] ADD [CompanyId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [ProductionStockTransfers] ADD [CreatedById] nvarchar(max) NULL;



ALTER TABLE [ProductionStockTransfers] ADD [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate());



ALTER TABLE [ProductionStockTransfers] ADD [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate());



ALTER TABLE [ProductionStockTransfers] ADD CONSTRAINT [PK_ProductionStockTransfers] PRIMARY KEY ([Id]);



UPDATE [Companies] SET [CreatedDate] = '2021-10-05T13:07:52.8525560Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_ProductionStockTransfers_CompanyId] ON [ProductionStockTransfers] ([CompanyId]);



ALTER TABLE [ProductionStockTransfers] ADD CONSTRAINT [FK_ProductionStockTransfers_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211005130754_ProductionStockTransfer1.1', N'2.2.6-servicing-10079');



DECLARE @var26 sysname;
SELECT @var26 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ProductionStockTransfers]') AND [c].[name] = N'RemainingStock');
IF @var26 IS NOT NULL EXEC(N'ALTER TABLE [ProductionStockTransfers] DROP CONSTRAINT [' + @var26 + '];');
ALTER TABLE [ProductionStockTransfers] ALTER COLUMN [RemainingStock] decimal(18,4) NOT NULL;



DECLARE @var27 sysname;
SELECT @var27 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ProductionStockTransfers]') AND [c].[name] = N'DamageStock');
IF @var27 IS NOT NULL EXEC(N'ALTER TABLE [ProductionStockTransfers] DROP CONSTRAINT [' + @var27 + '];');
ALTER TABLE [ProductionStockTransfers] ALTER COLUMN [DamageStock] decimal(18,4) NOT NULL;



ALTER TABLE [ProductionStockTransfers] ADD [UnitPrice] decimal(18,4) NOT NULL DEFAULT 0.0;



UPDATE [Companies] SET [CreatedDate] = '2021-10-06T07:20:34.8936243Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211006072037_UnitPriceInProductionBatchStockTransfer', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [SaleInvoiceId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-10-06T08:42:44.8630754Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211006084246_saleinvoiceid-in-sale', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [IsSaleReturn] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-10-06T08:51:52.2035465Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211006085154_IsSaleReturn-in-sale', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [IsSaleReturnPost] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-10-06T10:55:57.1876147Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211006105559_IsSaleReturnPost-in-sale', N'2.2.6-servicing-10079');



DECLARE @var28 sysname;
SELECT @var28 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ProductionBatchs]') AND [c].[name] = N'RemainingStock');
IF @var28 IS NOT NULL EXEC(N'ALTER TABLE [ProductionBatchs] DROP CONSTRAINT [' + @var28 + '];');
ALTER TABLE [ProductionBatchs] ALTER COLUMN [RemainingStock] decimal(18,4) NOT NULL;



DECLARE @var29 sysname;
SELECT @var29 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ProductionBatchs]') AND [c].[name] = N'DamageStock');
IF @var29 IS NOT NULL EXEC(N'ALTER TABLE [ProductionBatchs] DROP CONSTRAINT [' + @var29 + '];');
ALTER TABLE [ProductionBatchs] ALTER COLUMN [DamageStock] decimal(18,4) NOT NULL;



ALTER TABLE [ProductionBatchs] ADD [CompleteDate] datetime2 NULL;



ALTER TABLE [ProductionBatchs] ADD [ProcessDate] datetime2 NULL;



ALTER TABLE [ProductionBatchs] ADD [RecipeQuantity] decimal(18,4) NOT NULL DEFAULT 0.0;



ALTER TABLE [ProductionBatchs] ADD [TransferDate] datetime2 NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-10-06T13:56:26.2790321Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211006135628_ProductionBatch1.4', N'2.2.6-servicing-10079');



EXEC sp_rename N'[ProductionStockTransfers].[RecipeId]', N'ProductionBatchId', N'COLUMN';



UPDATE [Companies] SET [CreatedDate] = '2021-10-07T11:09:21.8494498Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211007110923_ProductionBatchView1.1', N'2.2.6-servicing-10079');



ALTER TABLE [ProductionStockTransfers] ADD [ProductId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



UPDATE [Companies] SET [CreatedDate] = '2021-10-07T11:27:28.0138505Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211007112729_ProductionBatchView1.2', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [SaleReturnInvoiceId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-10-08T12:13:00.3238884Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211008121302_salereturnid-in-sale', N'2.2.6-servicing-10079');



ALTER TABLE [Companies] ADD [TermsCondition] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-10-12T07:19:22.7319282Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211012071924_TermsAndConditionBoolInCompany', N'2.2.6-servicing-10079');



ALTER TABLE [PurchasePosts] ADD [PurchaseInvoiceId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-10-15T07:29:37.9303277Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211015072939_purchaseInvoiceId-In-PurchasePost', N'2.2.6-servicing-10079');



ALTER TABLE [PurchasePosts] ADD [IsClose] bit NOT NULL DEFAULT 0;



ALTER TABLE [PurchasePostItems] ADD [RemainingQuantity] int NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-10-15T09:50:41.2433639Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211015095043_purchaseInvoice-remaining-quantity', N'2.2.6-servicing-10079');



ALTER TABLE [SaleItems] ADD [RemainingQuantity] int NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-10-20T08:28:47.3588406Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211020082849_RemainingQuantity-In-SaleInvoice', N'2.2.6-servicing-10079');



ALTER TABLE [SalePayments] ADD [Amount] decimal(18,2) NOT NULL DEFAULT 0.0;



ALTER TABLE [SalePayments] ADD [Rate] decimal(18,2) NOT NULL DEFAULT 0.0;



UPDATE [Companies] SET [CreatedDate] = '2021-10-25T12:00:05.8589440Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211025120007_amount-rate-in-othercurrency', N'2.2.6-servicing-10079');



ALTER TABLE [CashCustomer] ADD [CustomerId] nvarchar(max) NULL;



ALTER TABLE [CashCustomer] ADD [Email] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-10-25T12:57:58.4994891Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211025125800_email-customerid-in-cashcustomer', N'2.2.6-servicing-10079');



CREATE TABLE [LoginHistories] (
    [Id] int NOT NULL IDENTITY,
    [UserId] uniqueidentifier NOT NULL,
    [LoginDateTime] datetime2 NOT NULL,
    [LoutDateTime] datetime2 NOT NULL,
    [IpAddress] nvarchar(max) NULL,
    [OperatingSystem] nvarchar(max) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_LoginHistories] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_LoginHistories_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-10-26T08:08:19.4002526Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_LoginHistories_CompanyId] ON [LoginHistories] ([CompanyId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211026080822_loginHistory', N'2.2.6-servicing-10079');



ALTER TABLE [LoginHistories] DROP CONSTRAINT [FK_LoginHistories_Companies_CompanyId];



DROP INDEX [IX_LoginHistories_CompanyId] ON [LoginHistories];



UPDATE [Companies] SET [CreatedDate] = '2021-10-26T10:30:18.4235793Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211026103020_addCompanyIdInLoginHistory', N'2.2.6-servicing-10079');



ALTER TABLE [CompanyAccountSetups] ADD [BackupPath] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-10-27T02:15:54.8123514Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211027021559_add-backup-path', N'2.2.6-servicing-10079');



ALTER TABLE [JournalVouchers] ADD [OpeningCash] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-10-28T06:59:38.5841923Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211028065940_OpeningCashOneTimeEntry', N'2.2.6-servicing-10079');



CREATE TABLE [InventoryBlinds] (
    [Id] uniqueidentifier NOT NULL,
    [WarehouseId] uniqueidentifier NOT NULL,
    [DocumentId] nvarchar(30) NOT NULL,
    [Note] nvarchar(max) NULL,
    [DateTime] datetime2 NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_InventoryBlinds] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_InventoryBlinds_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_InventoryBlinds_Warehouses_WarehouseId] FOREIGN KEY ([WarehouseId]) REFERENCES [Warehouses] ([Id]) ON DELETE NO ACTION
);



CREATE TABLE [InventoryBlindDetails] (
    [Id] uniqueidentifier NOT NULL,
    [ProductId] uniqueidentifier NOT NULL,
    [CurrentQuantity] int NOT NULL,
    [PhysicalQuantity] int NOT NULL,
    [Remarks] nvarchar(max) NULL,
    [InventoryBlindId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_InventoryBlindDetails] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_InventoryBlindDetails_InventoryBlinds_InventoryBlindId] FOREIGN KEY ([InventoryBlindId]) REFERENCES [InventoryBlinds] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_InventoryBlindDetails_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-10-28T07:14:34.1614657Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_InventoryBlindDetails_InventoryBlindId] ON [InventoryBlindDetails] ([InventoryBlindId]);



CREATE INDEX [IX_InventoryBlindDetails_ProductId] ON [InventoryBlindDetails] ([ProductId]);



CREATE INDEX [IX_InventoryBlinds_CompanyId] ON [InventoryBlinds] ([CompanyId]);



CREATE INDEX [IX_InventoryBlinds_WarehouseId] ON [InventoryBlinds] ([WarehouseId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211028071435_inventoryBlind', N'2.2.6-servicing-10079');



ALTER TABLE [JournalVouchers] ADD [OneTimeEntry] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-10-28T10:40:50.3858944Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211028104052_OneTimeEntryInOpeningCash', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [PartiallyInvoices] int NOT NULL DEFAULT 0;



ALTER TABLE [PurchasePosts] ADD [PartiallyInvoices] int NOT NULL DEFAULT 0;



ALTER TABLE [PaymentVoucherDetails] ADD [PurchaseInvoice] uniqueidentifier NULL;



ALTER TABLE [PaymentVoucherDetails] ADD [SaleInvoice] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-10-29T05:52:55.9062319Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211029055257_PartiallyPaidEnumInPurchaseAndSale', N'2.2.6-servicing-10079');



ALTER TABLE [InventoryBlinds] ADD [IsCounted] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-10-29T08:11:30.5353447Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211029081132_isCountedAddedInBlindInventory', N'2.2.6-servicing-10079');



CREATE TABLE [CashVouchers] (
    [Id] uniqueidentifier NOT NULL,
    [VoucherNo] nvarchar(max) NULL,
    [Date] datetime2 NOT NULL,
    [Amount] decimal(18,2) NOT NULL,
    [IsActive] bit NOT NULL,
    [SaleReturnId] uniqueidentifier NULL,
    [SaleInvoiceId] uniqueidentifier NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_CashVouchers] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CashVouchers_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211101112808_cash-voucher-table', N'2.2.6-servicing-10079');



ALTER TABLE [Companies] ADD [CashVoucher] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-11-02T10:26:21.2332662Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211102102623_cash-voucher-in-company', N'2.2.6-servicing-10079');



DECLARE @var30 sysname;
SELECT @var30 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PaymentVouchers]') AND [c].[name] = N'Narration');
IF @var30 IS NOT NULL EXEC(N'ALTER TABLE [PaymentVouchers] DROP CONSTRAINT [' + @var30 + '];');
ALTER TABLE [PaymentVouchers] ALTER COLUMN [Narration] nvarchar(200) NULL;



DECLARE @var31 sysname;
SELECT @var31 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PaymentVoucherDetails]') AND [c].[name] = N'Description');
IF @var31 IS NOT NULL EXEC(N'ALTER TABLE [PaymentVoucherDetails] DROP CONSTRAINT [' + @var31 + '];');
ALTER TABLE [PaymentVoucherDetails] ALTER COLUMN [Description] nvarchar(200) NULL;



ALTER TABLE [CompanyAccountSetups] ADD [AutoSync] bit NOT NULL DEFAULT 0;



ALTER TABLE [CompanyAccountSetups] ADD [AutoSyncInterval] int NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-11-02T22:18:31.9372407Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211102221834_add-autosync', N'2.2.6-servicing-10079');



ALTER TABLE [PaymentVoucherDetails] DROP CONSTRAINT [FK_PaymentVoucherDetails_Accounts_ContactAccountId];



ALTER TABLE [PaymentVoucherDetails] DROP CONSTRAINT [FK_PaymentVoucherDetails_PaymentVouchers_PaymentVoucherId];



ALTER TABLE [PaymentVouchers] DROP CONSTRAINT [FK_PaymentVouchers_Accounts_BankCashAccountId];



DROP INDEX [IX_PaymentVouchers_BankCashAccountId] ON [PaymentVouchers];



DROP INDEX [IX_PaymentVoucherDetails_ContactAccountId] ON [PaymentVoucherDetails];



DECLARE @var32 sysname;
SELECT @var32 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PaymentVouchers]') AND [c].[name] = N'isDraft');
IF @var32 IS NOT NULL EXEC(N'ALTER TABLE [PaymentVouchers] DROP CONSTRAINT [' + @var32 + '];');
ALTER TABLE [PaymentVouchers] DROP COLUMN [isDraft];



DECLARE @var33 sysname;
SELECT @var33 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PaymentVouchers]') AND [c].[name] = N'Narration');
IF @var33 IS NOT NULL EXEC(N'ALTER TABLE [PaymentVouchers] DROP CONSTRAINT [' + @var33 + '];');
ALTER TABLE [PaymentVouchers] ALTER COLUMN [Narration] nvarchar(500) NULL;



ALTER TABLE [PaymentVouchers] ADD [Amount] decimal(18,4) NOT NULL DEFAULT 0.0;



ALTER TABLE [PaymentVouchers] ADD [ApprovalStatus] int NOT NULL DEFAULT 0;



ALTER TABLE [PaymentVouchers] ADD [ApprovedBy] nvarchar(max) NULL;



ALTER TABLE [PaymentVouchers] ADD [ApprovedDate] datetime2 NULL;



ALTER TABLE [PaymentVouchers] ADD [ContactAccountId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [PaymentVouchers] ADD [DraftBy] nvarchar(max) NULL;



ALTER TABLE [PaymentVouchers] ADD [DraftDate] datetime2 NULL;



ALTER TABLE [PaymentVouchers] ADD [PurchaseInvoice] uniqueidentifier NULL;



ALTER TABLE [PaymentVouchers] ADD [Reason] nvarchar(max) NULL;



ALTER TABLE [PaymentVouchers] ADD [RejectBy] nvarchar(max) NULL;



ALTER TABLE [PaymentVouchers] ADD [RejectDate] datetime2 NULL;



ALTER TABLE [PaymentVouchers] ADD [SaleInvoice] uniqueidentifier NULL;



ALTER TABLE [PaymentVouchers] ADD [VoidBy] nvarchar(max) NULL;



ALTER TABLE [PaymentVouchers] ADD [VoidDate] datetime2 NULL;



ALTER TABLE [PaymentVoucherDetails] ADD [AccountId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-11-03T14:00:02.7627173Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE UNIQUE INDEX [IX_PaymentVouchers_BankCashAccountId] ON [PaymentVouchers] ([BankCashAccountId]);



CREATE UNIQUE INDEX [IX_PaymentVouchers_ContactAccountId] ON [PaymentVouchers] ([ContactAccountId]);



CREATE INDEX [IX_PaymentVoucherDetails_AccountId] ON [PaymentVoucherDetails] ([AccountId]);



ALTER TABLE [PaymentVoucherDetails] ADD CONSTRAINT [FK_PaymentVoucherDetails_Accounts_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [PaymentVoucherDetails] ADD CONSTRAINT [FK_PaymentVoucherDetails_PaymentVouchers_PaymentVoucherId] FOREIGN KEY ([PaymentVoucherId]) REFERENCES [PaymentVouchers] ([Id]) ON DELETE CASCADE;



ALTER TABLE [PaymentVouchers] ADD CONSTRAINT [FK_PaymentVouchers_Accounts_BankCashAccountId] FOREIGN KEY ([BankCashAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [PaymentVouchers] ADD CONSTRAINT [FK_PaymentVouchers_Accounts_ContactAccountId] FOREIGN KEY ([ContactAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211103140005_PaymentVoucherSingleEntrySystem', N'2.2.6-servicing-10079');



ALTER TABLE [PrintSettings] ADD [ReturnDays] decimal(18,2) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-11-04T05:41:59.0771458Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211104054201_salereturn-days-in-print-setting', N'2.2.6-servicing-10079');



DROP INDEX [IX_PaymentVouchers_BankCashAccountId] ON [PaymentVouchers];



DROP INDEX [IX_PaymentVouchers_ContactAccountId] ON [PaymentVouchers];



ALTER TABLE [PaymentVouchers] ADD [PettyCash] int NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-11-04T11:38:16.9366845Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_PaymentVouchers_BankCashAccountId] ON [PaymentVouchers] ([BankCashAccountId]);



CREATE INDEX [IX_PaymentVouchers_ContactAccountId] ON [PaymentVouchers] ([ContactAccountId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211104113818_paymentVoucherRelationwithAccountChanging', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-11-08T07:57:21.4378154Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES (334, N'Petty Cash', N'Can View Petty Cash as Draft', 2),
(335, N'Petty Cash', N'Can Save Petty Cash as Post', 2),
(336, N'Petty Cash', N'Can Edit  Petty Cash as Post', 2),
(337, N'Petty Cash', N'Can Delete  Petty Cash as Post', 2),
(338, N'Petty Cash', N'Can View Petty Cash as Post', 2),
(339, N'Petty Cash', N'Can Void Petty Cash', 2),
(340, N'Petty Cash', N'Can Reject Petty Cash', 2),
(341, N'Petty Cash', N'Can Bulk Reject Petty Cash', 2),
(342, N'Petty Cash', N'Can Bulk Post Petty Cash', 2),
(361, N'Purchase Invoice as Post', N'Can Void Purchase Invoice', 3),
(369, N'Purchase Return', N'Can Void  Purchase Return', 3),
(333, N'Petty Cash', N'Can Delete  Petty Cash as Draft', 2),
(360, N'Stock In', N'Can import Stock In Product', 3),
(363, N'Stock Out', N'Can Void Stock Out ', 3),
(370, N'Stock Return', N'Can Void Stock Return', 3),
(364, N'Stock Transfer', N'Can Void  Stock Transfer', 3),
(365, N'Sale Invoice', N'Can Void  Sale Invoice', 8),
(366, N'Sale Return', N'Can Void  Sale Return', 8),
(367, N'Touch Invoice', N'Can Void  Touch Invoice', 4),
(359, N'Product', N'Can Import Products', 6),
(373, N'Product', N'Can View Inventory Count List', 6),
(374, N'Product', N'Add Inventory Count', 6),
(375, N'Product', N'Can View Updated Inventory Count List', 6),
(368, N'Expense', N'Can Void Daily Expense', 10),
(362, N'Stock In', N'Can Void Stock In ', 3),
(371, N'System', N'Pull Record of Database', 13),
(332, N'Petty Cash', N'Can Edit  Petty Cash as Draft', 2),
(330, N'Opening Cash', N'Can Void Opening Cash', 2),
(355, N'Cash Receipt', N'Can Reject Cash Receipt', 2),
(356, N'Cash Receipt', N'Can Bulk Reject Cash Receipt', 2),
(357, N'Cash Receipt', N'Can Bulk Post Cash Receipt', 2),
(358, N'Cash Receipt', N'Can Void Cash Receipt', 2),
(351, N'Cash Pay', N'Can Reject Cash Pay', 2),
(352, N'Cash Pay', N'Can Bulk Reject Cash Pay', 2),
(353, N'Cash Pay', N'Can Bulk Post Cash Pay', 2),
(354, N'Cash Pay', N'Can Void Cash Pay', 2),
(347, N'Bank Pay', N'Can Reject Bank Pay', 2),
(348, N'Bank Pay', N'Can Bulk Reject Bank Pay', 2),
(349, N'Bank Pay', N'Can Bulk Post Bank Pay', 2),
(331, N'Petty Cash', N'Can Save Petty Cash as Draft', 2),
(350, N'Bank Pay', N'Can Void Bank Pay', 2),
(344, N'Bank Receipt', N'Can Bulk Reject Bank Receipt', 2),
(345, N'Bank Receipt', N'Can Bulk Post Bank Receipt', 2),
(346, N'Bank Receipt', N'Can Void Bank Receipt', 2),
(322, N'Opening Cash', N'Can Save Opening Cash as Draft', 2),
(323, N'Opening Cash', N'Can Edit  Opening Cash as Draft', 2),
(324, N'Opening Cash', N'Can Delete  Opening Cash as Draft', 2),
(325, N'Opening Cash', N'Can View Opening Cash as Draft', 2),
(326, N'Opening Cash', N'Can Save Opening Cash as Post', 2),
(327, N'Opening Cash', N'Can Edit  Opening Cash as Post', 2),
(328, N'Opening Cash', N'Can Delete  Opening Cash as Post', 2),
(329, N'Opening Cash', N'Can View Opening Cash as Post', 2),
(343, N'Bank Receipt', N'Can Reject Bank Receipt', 2),
(372, N'System', N'Push Record of Database', 13);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211108075723_PermissionOnForms', N'2.2.6-servicing-10079');



ALTER TABLE [Cateries] ADD [IsReturn] bit NOT NULL DEFAULT 0;



ALTER TABLE [Cateries] ADD [ReturnDays] int NOT NULL DEFAULT 0;



UPDATE [AccountTemplates] SET [JsonTemplate] = N'{"AccountsType":[{"Name":"Assets","IsActive":true,"CostCenters":[{"Name":"Cash in Hand","Description":"Cash in Hand","IsActive":true,"Code":"101000","Accounts":[{"Name":"Cash in Hand","Description":"Cash in Hand","IsActive":true,"Code":"10100001"}]},{"Name":"Cash in Hand - Store","Description":"Cash in Hand - Store","IsActive":true,"Code":"101001","Accounts":[{"Name":"Accounts receivable","Description":"Accounts receivable","IsActive":true,"Code":"10100101"}]},{"Name":"Inventory","Description":"Inventory","IsActive":true,"Code":"111000","Accounts":[{"Name":"Inventory","Description":"Inventory","IsActive":true,"Code":"11100001"}]},{"Name":"Customer Reciveables","Description":"Customer Reciveables","IsActive":true,"Code":"120000","Accounts":[{"Name":"Customer Reciveables","Description":"Customer Reciveables","IsActive":true,"Code":"1200001"}]},{"Name":"VAT Paid","Description":"VAT Paid","IsActive":true,"Code":"130000","Accounts":[{"Name":"VAT Paid on Purchases","Description":"VAT Paid on Purchases","IsActive":true,"Code":"1300001"}]},{"Name":"Banks","Description":"Banks","IsActive":true,"Code":"105000","Accounts":[{"Name":"Banks","Description":"Banks","IsActive":true,"Code":"10500001"}]},{"Name":"Accumulated Depreciation","Description":"Accumulated Depreciation","IsActive":true,"Code":"170000","Accounts":[{"Name":"Accumulated Depreciation","Description":"Accumulated Depreciation","IsActive":true,"Code":"17000001"}]},{"Name":"Fixed Assets","Description":"Fixed Assets","IsActive":true,"Code":"150000","Accounts":[{"Name":"Fixed Assets","Description":"Fixed Assets","IsActive":true,"Code":"1500001"}]},{"Name":"Due from Employee","Description":"Due from Employee","IsActive":true,"Code":"126000","Accounts":[{"Name":"Due from Employee","Description":"Due from Employee","IsActive":true,"Code":"12600001"}]}]},{"Name":"Liabilities","IsActive":true,"CostCenters":[{"Name":"Supplier Payable","Description":"Supplier Payable","IsActive":true,"Code":"200000","Accounts":[{"Name":"Supplier Payable","Description":"Supplier Payable","IsActive":true,"Code":"20000001"}]},{"Name":"Payroll Liabilities","Description":"Payroll Liabilities","IsActive":true,"Code":"240000","Accounts":[{"Name":"Payroll Liabilities","Description":"Payroll Liabilities","IsActive":true,"Code":"24000001"}]},{"Name":"VAT Payable","Description":"VAT Payable","IsActive":true,"Code":"250000","Accounts":[{"Name":"VAT Payable on Sale","Description":"VAT Payable on Sale","IsActive":true,"Code":"25000001"}]},{"Name":"Loan Payable","Description":"Loan Payable","IsActive":true,"Code":"253001","Accounts":[{"Name":"Loan Payable","Description":"Loan Payable","IsActive":true,"Code":"2530101"}]}]},{"Name":"Equity","IsActive":true,"CostCenters":[{"Name":"Opening Balance Equity","Description":"Opening Balance Equity","IsActive":true,"Code":"300000","Accounts":[{"Name":"Opening Balance Equity","Description":"Opening Balance Equity","IsActive":true,"Code":"30000001"}]},{"Name":"Owner Investment","Description":"Owner Investment","IsActive":true,"Code":"301001","Accounts":[{"Name":"Owner Investment","Description":"Owner Investment","IsActive":true,"Code":"30100101"}]},{"Name":"Owner Withdrawals","Description":"Owner Withdrawals","IsActive":true,"Code":"302001","Accounts":[{"Name":"Owner Withdrawals","Description":"Owner Withdrawals","IsActive":true,"Code":"30200101"}]},{"Name":"Retained Earnings","Description":"Retained Earnings","IsActive":true,"Code":"320000","Accounts":[{"Name":"Retained Earnings","Description":"Retained Earnings","IsActive":true,"Code":"32000001"}]},{"Name":"Net Profit for the period","Description":"Net Profit for the period","IsActive":true,"Code":"321002","Accounts":[{"Name":"Net Profit for the period","Description":"Net Profit for the period","IsActive":true,"Code":"32100201"}]}]},{"Name":"Income","IsActive":true,"CostCenters":[{"Name":"Sale","Description":"Sale","IsActive":true,"Code":"420000","Accounts":[{"Name":"Sale","Description":"Sale","IsActive":true,"Code":"42000001"}]},{"Name":"Teller","Description":"Teller","IsActive":true,"Code":"421000","Accounts":[{"Name":"Teller","Description":"Teller","IsActive":true,"Code":"42100001"}]},{"Name":"POS-Terminal","Description":"POS-Terminal","IsActive":true,"Code":"425000","Accounts":[{"Name":"POS-Terminal","Description":"POS-Terminal","IsActive":true,"Code":"42500001"}]},{"Name":"Discount Taken","Description":"Discount Taken","IsActive":true,"Code":"426000","Accounts":[{"Name":"Discount Taken","Description":"Discount Taken","IsActive":true,"Code":"42600001"}]}]},{"Name":"Expenses","IsActive":true,"CostCenters":[{"Name":"Cost of ods Sold","Description":"Cost of ods Sold","IsActive":true,"Code":"600001","Accounts":[{"Name":"Cost of ods Sold","Description":"Cost of ods Sold","IsActive":true,"Code":"60000101"}]},{"Name":"Freight Paid","Description":"Freight Paid","IsActive":true,"Code":"608001","Accounts":[{"Name":"Freight Paid","Description":"Freight Paid","IsActive":true,"Code":"60800101"}]},{"Name":"Discount Given","Description":"Discount Given","IsActive":true,"Code":"607001","Accounts":[{"Name":"Discount Given","Description":"Discount Given","IsActive":true,"Code":"60700101"}]},{"Name":"Depreciation Expense","Description":"Depreciation Expense","IsActive":true,"Code":"606001","Accounts":[{"Name":"Depreciation Expense","Description":"Depreciation Expense","IsActive":true,"Code":"60600101"}]},{"Name":"General Expenses","Description":"General Expenses","IsActive":true,"Code":"605050","Accounts":[{"Name":"General Expenses","Description":"General Expenses","IsActive":true,"Code":"60505001"}]},{"Name":"Payroll","Description":"Payroll","IsActive":true,"Code":"603001","Accounts":[{"Name":"Payroll","Description":"Payroll","IsActive":true,"Code":"60300101"}]},{"Name":"Utilities","Description":"Utilities","IsActive":true,"Code":"604001","Accounts":[{"Name":"Utilities","Description":"Utilities","IsActive":true,"Code":"60400101"}]},{"Name":"Rent","Description":"Rent","IsActive":true,"Code":"604050","Accounts":[{"Name":"Rent","Description":"Rent","IsActive":true,"Code":"60405001"}]},{"Name":"Legal Expenses","Description":"Legal Expenses","IsActive":true,"Code":"605001","Accounts":[{"Name":"Legal Expenses","Description":"Legal Expenses","IsActive":true,"Code":"60500101"}]}]}]}'
WHERE [Id] = 'ecfe29c8-c6af-4a3d-9c24-f87b30bf831c';
SELECT @@ROWCOUNT;




UPDATE [Companies] SET [CreatedDate] = '2021-11-08T13:17:06.0891730Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211108131708_ReturnDaysInCatery', N'2.2.6-servicing-10079');



ALTER TABLE [Terminals] ADD [CashAccountId] uniqueidentifier NULL;



ALTER TABLE [PrintSettings] ADD [BankAccountId] uniqueidentifier NULL;



ALTER TABLE [PrintSettings] ADD [CashAccountId] uniqueidentifier NULL;



ALTER TABLE [Companies] ADD [IsOpenDay] bit NOT NULL DEFAULT 0;



ALTER TABLE [Companies] ADD [IsTransferAllow] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-11-09T08:32:12.6409591Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_Terminals_CashAccountId] ON [Terminals] ([CashAccountId]);



CREATE INDEX [IX_PrintSettings_BankAccountId] ON [PrintSettings] ([BankAccountId]);



CREATE INDEX [IX_PrintSettings_CashAccountId] ON [PrintSettings] ([CashAccountId]);



ALTER TABLE [PrintSettings] ADD CONSTRAINT [FK_PrintSettings_Accounts_BankAccountId] FOREIGN KEY ([BankAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [PrintSettings] ADD CONSTRAINT [FK_PrintSettings_Accounts_CashAccountId] FOREIGN KEY ([CashAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [Terminals] ADD CONSTRAINT [FK_Terminals_Accounts_CashAccountId] FOREIGN KEY ([CashAccountId]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211109083214_forDayStartChanging', N'2.2.6-servicing-10079');



ALTER TABLE [LoginPermissions] ADD [IsSupervisor] bit NOT NULL DEFAULT 0;



ALTER TABLE [DayStarts] ADD [CreditReason] nvarchar(max) NULL;



ALTER TABLE [DayStarts] ADD [DayStartId] uniqueidentifier NULL;



ALTER TABLE [DayStarts] ADD [EndTime] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';



ALTER TABLE [DayStarts] ADD [IsDayStart] bit NOT NULL DEFAULT 0;



ALTER TABLE [DayStarts] ADD [Password] nvarchar(max) NULL;



ALTER TABLE [DayStarts] ADD [StartBy] nvarchar(max) NULL;



ALTER TABLE [DayStarts] ADD [StartFor] nvarchar(max) NULL;



ALTER TABLE [DayStarts] ADD [StartTime] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';



ALTER TABLE [DayStarts] ADD [SupervisorPassword] nvarchar(max) NULL;



ALTER TABLE [DayStarts] ADD [SupervisorUserName] nvarchar(max) NULL;



ALTER TABLE [DayStarts] ADD [TerminalId] uniqueidentifier NULL;



ALTER TABLE [DayStarts] ADD [TransferFrom] nvarchar(max) NULL;



ALTER TABLE [DayStarts] ADD [TransferTo] nvarchar(max) NULL;



ALTER TABLE [DayStarts] ADD [UserName] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-11-10T06:58:42.6288192Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211110065844_dayStarChanging', N'2.2.6-servicing-10079');



ALTER TABLE [DayStarts] ADD [ExpenseCash] decimal(18,2) NOT NULL DEFAULT 0.0;



ALTER TABLE [DayStarts] ADD [SupervisorCash] decimal(18,2) NOT NULL DEFAULT 0.0;



UPDATE [Companies] SET [CreatedDate] = '2021-11-10T13:27:32.8176346Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211110132734_ExpenseAndSupplierCashInDayStart', N'2.2.6-servicing-10079');



DECLARE @var34 sysname;
SELECT @var34 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[DayStarts]') AND [c].[name] = N'EndTime');
IF @var34 IS NOT NULL EXEC(N'ALTER TABLE [DayStarts] DROP CONSTRAINT [' + @var34 + '];');
ALTER TABLE [DayStarts] DROP COLUMN [EndTime];



DECLARE @var35 sysname;
SELECT @var35 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[DayStarts]') AND [c].[name] = N'Password');
IF @var35 IS NOT NULL EXEC(N'ALTER TABLE [DayStarts] DROP CONSTRAINT [' + @var35 + '];');
ALTER TABLE [DayStarts] DROP COLUMN [Password];



DECLARE @var36 sysname;
SELECT @var36 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[DayStarts]') AND [c].[name] = N'StartBy');
IF @var36 IS NOT NULL EXEC(N'ALTER TABLE [DayStarts] DROP CONSTRAINT [' + @var36 + '];');
ALTER TABLE [DayStarts] DROP COLUMN [StartBy];



DECLARE @var37 sysname;
SELECT @var37 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[DayStarts]') AND [c].[name] = N'StartFor');
IF @var37 IS NOT NULL EXEC(N'ALTER TABLE [DayStarts] DROP CONSTRAINT [' + @var37 + '];');
ALTER TABLE [DayStarts] DROP COLUMN [StartFor];



DECLARE @var38 sysname;
SELECT @var38 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[DayStarts]') AND [c].[name] = N'StartTime');
IF @var38 IS NOT NULL EXEC(N'ALTER TABLE [DayStarts] DROP CONSTRAINT [' + @var38 + '];');
ALTER TABLE [DayStarts] DROP COLUMN [StartTime];



DECLARE @var39 sysname;
SELECT @var39 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[DayStarts]') AND [c].[name] = N'TerminalId');
IF @var39 IS NOT NULL EXEC(N'ALTER TABLE [DayStarts] DROP CONSTRAINT [' + @var39 + '];');
ALTER TABLE [DayStarts] DROP COLUMN [TerminalId];



EXEC sp_rename N'[DayStarts].[UserName]', N'StartTerminalFor', N'COLUMN';



EXEC sp_rename N'[DayStarts].[TransferTo]', N'StartTerminalBy', N'COLUMN';



EXEC sp_rename N'[DayStarts].[TransferFrom]', N'EndTerminalFor', N'COLUMN';



EXEC sp_rename N'[DayStarts].[SupervisorUserName]', N'EndTerminalBy', N'COLUMN';



EXEC sp_rename N'[DayStarts].[SupervisorPassword]', N'DuringSaleCloseReason', N'COLUMN';



ALTER TABLE [DayStarts] ADD [DuringSaleClose] int NOT NULL DEFAULT 0;



ALTER TABLE [DayStarts] ADD [TotalCash] decimal(18,2) NOT NULL DEFAULT 0.0;



CREATE TABLE [TransferHistories] (
    [Id] uniqueidentifier NOT NULL,
    [Date] datetime2 NULL,
    [CounterId] uniqueidentifier NOT NULL,
    [OpeningCash] decimal(18,2) NOT NULL,
    [CashInHand] decimal(18,2) NOT NULL,
    [VerifyCash] decimal(18,2) NOT NULL,
    [ExpenseCash] decimal(18,2) NOT NULL,
    [TotalCash] decimal(18,2) NOT NULL,
    [SupervisorCash] decimal(18,2) NOT NULL,
    [FromTime] datetime2 NULL,
    [ToTime] datetime2 NULL,
    [IsActive] bit NOT NULL,
    [DayStartUser] nvarchar(max) NULL,
    [DayEndUser] nvarchar(max) NULL,
    [CarryCash] decimal(18,2) NOT NULL,
    [Reason] nvarchar(max) NULL,
    [IsExpenseDay] bit NOT NULL,
    [StartTerminalBy] nvarchar(max) NULL,
    [StartTerminalFor] nvarchar(max) NULL,
    [CreditReason] nvarchar(max) NULL,
    [DayStartId] uniqueidentifier NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_TransferHistories] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_TransferHistories_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-11-11T07:57:08.8683770Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_TransferHistories_CompanyId] ON [TransferHistories] ([CompanyId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211111075710_addTransferHistory', N'2.2.6-servicing-10079');



ALTER TABLE [DayStarts] ADD [BankAmount] decimal(18,2) NOT NULL DEFAULT 0.0;



ALTER TABLE [DayStarts] ADD [NoOfTransaction] int NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-11-11T10:50:32.7284814Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211111105034_addBankAmountAndTotalTransaction', N'2.2.6-servicing-10079');



ALTER TABLE [SalePayments] ADD [BusinessId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [SalePayments] ADD [ClientId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [SalePayments] ADD [CounterId] uniqueidentifier NULL;



ALTER TABLE [SalePayments] ADD [DayId] uniqueidentifier NULL;



ALTER TABLE [SalePayments] ADD [UserId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



UPDATE [Companies] SET [CreatedDate] = '2021-11-11T16:32:18.1919878Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211111163220_addCounterId', N'2.2.6-servicing-10079');



ALTER TABLE [TransferHistories] ADD [BankAmount] decimal(18,2) NOT NULL DEFAULT 0.0;



ALTER TABLE [TransferHistories] ADD [NoOfTransaction] int NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-11-12T09:38:26.8040010Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211112093828_addbankAccountinTranseferHistory', N'2.2.6-servicing-10079');



ALTER TABLE [DayStarts] ADD [SuperVisorName] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-11-17T13:17:53.6875501Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211117131755_SuperVisorNameInDayStart', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [BarCode] nvarchar(max) NULL;



ALTER TABLE [PrintSettings] ADD [PrintTemplate] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-11-18T09:00:58.9134046Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211118090100_invoice-template-and-InvoicebarCode', N'2.2.6-servicing-10079');



ALTER TABLE [Terminals] ADD [PosTerminalId] uniqueidentifier NULL;



CREATE TABLE [BankPosTerminals] (
    [Id] uniqueidentifier NOT NULL,
    [TerminalId] nvarchar(max) NULL,
    [BankId] uniqueidentifier NOT NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_BankPosTerminals] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_BankPosTerminals_Banks_BankId] FOREIGN KEY ([BankId]) REFERENCES [Banks] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_BankPosTerminals_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-11-18T10:32:01.0031476Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_Terminals_PosTerminalId] ON [Terminals] ([PosTerminalId]);



CREATE INDEX [IX_BankPosTerminals_BankId] ON [BankPosTerminals] ([BankId]);



CREATE INDEX [IX_BankPosTerminals_CompanyId] ON [BankPosTerminals] ([CompanyId]);



ALTER TABLE [Terminals] ADD CONSTRAINT [FK_Terminals_BankPosTerminals_PosTerminalId] FOREIGN KEY ([PosTerminalId]) REFERENCES [BankPosTerminals] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211118103203_BankPosTerminal', N'2.2.6-servicing-10079');



ALTER TABLE [BankPosTerminals] DROP CONSTRAINT [FK_BankPosTerminals_Banks_BankId];



UPDATE [Companies] SET [CreatedDate] = '2021-11-18T12:23:51.2546537Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




ALTER TABLE [BankPosTerminals] ADD CONSTRAINT [FK_BankPosTerminals_Accounts_BankId] FOREIGN KEY ([BankId]) REFERENCES [Accounts] ([Id]) ON DELETE CASCADE;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211118122353_AccountRelationWithPOSBank', N'2.2.6-servicing-10079');



EXEC sp_rename N'[Banks].[Currency]', N'SwiftCode', N'COLUMN';



ALTER TABLE [Products] ADD [ProductMasterId] uniqueidentifier NULL;



ALTER TABLE [Companies] ADD [MasterProduct] bit NOT NULL DEFAULT 0;



ALTER TABLE [Banks] ADD [AccoutNameArabic] nvarchar(max) NULL;



ALTER TABLE [Banks] ADD [BranchAddress] nvarchar(max) NULL;



ALTER TABLE [Banks] ADD [BranchCode] nvarchar(max) NULL;



ALTER TABLE [Banks] ADD [CurrencyId] uniqueidentifier NULL;



CREATE TABLE [ProductMasters] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [NameArabic] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [Code] nvarchar(max) NULL,
    [isActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_ProductMasters] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ProductMasters_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-11-22T09:04:34.6055071Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES (376, N'Super Product', N'Can Save Super Product', 6),
(377, N'Super Product', N'Can Edit Super Product', 6),
(378, N'Super Product', N'Can Delete Super Product', 6),
(379, N'Super Product', N'Can View  Super Product', 6);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



CREATE INDEX [IX_Products_ProductMasterId] ON [Products] ([ProductMasterId]);



CREATE INDEX [IX_Banks_CurrencyId] ON [Banks] ([CurrencyId]);



CREATE INDEX [IX_ProductMasters_CompanyId] ON [ProductMasters] ([CompanyId]);



ALTER TABLE [Banks] ADD CONSTRAINT [FK_Banks_Currencies_CurrencyId] FOREIGN KEY ([CurrencyId]) REFERENCES [Currencies] ([Id]) ON DELETE NO ACTION;



ALTER TABLE [Products] ADD CONSTRAINT [FK_Products_ProductMasters_ProductMasterId] FOREIGN KEY ([ProductMasterId]) REFERENCES [ProductMasters] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211122090437_ProductMaster', N'2.2.6-servicing-10079');



ALTER TABLE [PrintSettings] ADD [PrinterName] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-11-22T12:07:54.7590742Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211122120756_PrinterNameInPrintSetting', N'2.2.6-servicing-10079');



ALTER TABLE [PaymentVouchers] ADD [Image] nvarchar(max) NULL;



ALTER TABLE [PaymentVouchers] ADD [PaymentMethod] int NOT NULL DEFAULT 0;



ALTER TABLE [PaymentVouchers] ADD [PaymentMode] int NOT NULL DEFAULT 0;



ALTER TABLE [JournalVoucherItems] ADD [ChequeNo] nvarchar(max) NULL;



ALTER TABLE [JournalVoucherItems] ADD [ChequeNumber] nvarchar(max) NULL;



ALTER TABLE [JournalVoucherItems] ADD [PaymentMethod] int NOT NULL DEFAULT 0;



ALTER TABLE [JournalVoucherItems] ADD [PaymentMode] int NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-11-22T13:04:06.0373355Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211122130408_PaymentVoucherCustomerAndSupplierChanging', N'2.2.6-servicing-10079');



DROP TABLE [NobleRolePermissions];



DROP TABLE [CompanyPermissions];



UPDATE [Companies] SET [CreatedDate] = '2021-11-22T20:12:25.5264378Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211122201229_remoove-CompanyPermission-NobleRolePermission', N'2.2.6-servicing-10079');



CREATE TABLE [CompanyPermissions] (
    [Id] uniqueidentifier NOT NULL,
    [Description] nvarchar(max) NULL,
    [Catery] nvarchar(max) NULL,
    [NobleModuleId] int NOT NULL,
    [BusinessType] int NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_CompanyPermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CompanyPermissions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_CompanyPermissions_NobleModules_NobleModuleId] FOREIGN KEY ([NobleModuleId]) REFERENCES [NobleModules] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [NobleRolePermissions] (
    [Id] uniqueidentifier NOT NULL,
    [IsActive] bit NOT NULL,
    [RoleId] uniqueidentifier NOT NULL,
    [PermissionId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_NobleRolePermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_NobleRolePermissions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_NobleRolePermissions_CompanyPermissions_PermissionId] FOREIGN KEY ([PermissionId]) REFERENCES [CompanyPermissions] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_NobleRolePermissions_NobleRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [NobleRoles] ([Id]) ON DELETE CASCADE
);



UPDATE [Companies] SET [CreatedDate] = '2021-11-22T20:38:49.1499363Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_CompanyPermissions_CompanyId] ON [CompanyPermissions] ([CompanyId]);



CREATE INDEX [IX_CompanyPermissions_NobleModuleId] ON [CompanyPermissions] ([NobleModuleId]);



CREATE INDEX [IX_NobleRolePermissions_CompanyId] ON [NobleRolePermissions] ([CompanyId]);



CREATE INDEX [IX_NobleRolePermissions_PermissionId] ON [NobleRolePermissions] ([PermissionId]);



CREATE INDEX [IX_NobleRolePermissions_RoleId] ON [NobleRolePermissions] ([RoleId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211122203857_Add-CompanyPermission-NobleRolePermission', N'2.2.6-servicing-10079');



DECLARE @var40 sysname;
SELECT @var40 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PaymentVouchers]') AND [c].[name] = N'Image');
IF @var40 IS NOT NULL EXEC(N'ALTER TABLE [PaymentVouchers] DROP CONSTRAINT [' + @var40 + '];');
ALTER TABLE [PaymentVouchers] DROP COLUMN [Image];



CREATE TABLE [PaymentVoucherAttachments] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [NameArabic] nvarchar(max) NULL,
    [Path] nvarchar(max) NULL,
    [Description] nvarchar(300) NULL,
    [PaymentVoucherId] uniqueidentifier NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_PaymentVoucherAttachments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PaymentVoucherAttachments_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PaymentVoucherAttachments_PaymentVouchers_PaymentVoucherId] FOREIGN KEY ([PaymentVoucherId]) REFERENCES [PaymentVouchers] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-11-23T05:33:16.8229225Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_PaymentVoucherAttachments_CompanyId] ON [PaymentVoucherAttachments] ([CompanyId]);



CREATE INDEX [IX_PaymentVoucherAttachments_PaymentVoucherId] ON [PaymentVoucherAttachments] ([PaymentVoucherId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211123053319_AttachmENTInPaymentVoucher', N'2.2.6-servicing-10079');



ALTER TABLE [PrintSettings] ADD [IsHeaderFooter] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-11-23T10:33:13.9327012Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211123103315_header-footer-invoice', N'2.2.6-servicing-10079');



DROP TABLE [NoblePermissions];



DROP TABLE [NobleRolePermissions];



DROP TABLE [CompanyPermissions];



DROP TABLE [NobleModules];



UPDATE [Companies] SET [CreatedDate] = '2021-11-24T07:21:35.8810786Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211124072138_moduleandNoblePermission1', N'2.2.6-servicing-10079');



CREATE TABLE [NobleModules] (
    [Id] uniqueidentifier NOT NULL,
    [Description] nvarchar(max) NULL,
    [ModuleName] nvarchar(max) NULL,
    [ArabicName] nvarchar(max) NULL,
    [BusinessType] int NOT NULL,
    CONSTRAINT [PK_NobleModules] PRIMARY KEY ([Id])
);



CREATE TABLE [CompanyPermissions] (
    [Id] uniqueidentifier NOT NULL,
    [Description] nvarchar(max) NULL,
    [Catery] nvarchar(max) NULL,
    [NobleModuleId] uniqueidentifier NOT NULL,
    [BusinessType] int NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_CompanyPermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CompanyPermissions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_CompanyPermissions_NobleModules_NobleModuleId] FOREIGN KEY ([NobleModuleId]) REFERENCES [NobleModules] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [NoblePermissions] (
    [Id] uniqueidentifier NOT NULL,
    [Description] nvarchar(max) NULL,
    [Catery] nvarchar(max) NULL,
    [NobleModuleId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_NoblePermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_NoblePermissions_NobleModules_NobleModuleId] FOREIGN KEY ([NobleModuleId]) REFERENCES [NobleModules] ([Id]) ON DELETE CASCADE
);



CREATE TABLE [NobleRolePermissions] (
    [Id] uniqueidentifier NOT NULL,
    [IsActive] bit NOT NULL,
    [RoleId] uniqueidentifier NOT NULL,
    [PermissionId] uniqueidentifier NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_NobleRolePermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_NobleRolePermissions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_NobleRolePermissions_CompanyPermissions_PermissionId] FOREIGN KEY ([PermissionId]) REFERENCES [CompanyPermissions] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_NobleRolePermissions_NobleRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [NobleRoles] ([Id]) ON DELETE CASCADE
);



UPDATE [Companies] SET [CreatedDate] = '2021-11-24T07:32:23.9776054Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_CompanyPermissions_CompanyId] ON [CompanyPermissions] ([CompanyId]);



CREATE INDEX [IX_CompanyPermissions_NobleModuleId] ON [CompanyPermissions] ([NobleModuleId]);



CREATE INDEX [IX_NoblePermissions_NobleModuleId] ON [NoblePermissions] ([NobleModuleId]);



CREATE INDEX [IX_NobleRolePermissions_CompanyId] ON [NobleRolePermissions] ([CompanyId]);



CREATE INDEX [IX_NobleRolePermissions_PermissionId] ON [NobleRolePermissions] ([PermissionId]);



CREATE INDEX [IX_NobleRolePermissions_RoleId] ON [NobleRolePermissions] ([RoleId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211124073226_changeinttoguid', N'2.2.6-servicing-10079');



DECLARE @var41 sysname;
SELECT @var41 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PurchasePostItems]') AND [c].[name] = N'Discount');
IF @var41 IS NOT NULL EXEC(N'ALTER TABLE [PurchasePostItems] DROP CONSTRAINT [' + @var41 + '];');
ALTER TABLE [PurchasePostItems] ALTER COLUMN [Discount] decimal(18,2) NOT NULL;



DECLARE @var42 sysname;
SELECT @var42 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[PurchaseItems]') AND [c].[name] = N'Discount');
IF @var42 IS NOT NULL EXEC(N'ALTER TABLE [PurchaseItems] DROP CONSTRAINT [' + @var42 + '];');
ALTER TABLE [PurchaseItems] ALTER COLUMN [Discount] decimal(18,2) NOT NULL;



DECLARE @var43 sysname;
SELECT @var43 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Accounts]') AND [c].[name] = N'Name');
IF @var43 IS NOT NULL EXEC(N'ALTER TABLE [Accounts] DROP CONSTRAINT [' + @var43 + '];');
ALTER TABLE [Accounts] ALTER COLUMN [Name] nvarchar(100) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-11-24T11:42:13.8199555Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211124114216_ChangingInQuantityToIntAndDiscountToDecimal', N'2.2.6-servicing-10079');



ALTER TABLE [Sales] ADD [SaleOrderId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-11-24T13:18:50.0541623Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_Sales_SaleOrderId] ON [Sales] ([SaleOrderId]);



ALTER TABLE [Sales] ADD CONSTRAINT [FK_Sales_SaleOrders_SaleOrderId] FOREIGN KEY ([SaleOrderId]) REFERENCES [SaleOrders] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211124131852_saleorder-relation-to-saleInvoive', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-11-24T14:15:35.0904117Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ArabicName', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] ON;
INSERT INTO [NobleModules] ([Id], [ArabicName], [BusinessType], [Description], [ModuleName])
VALUES ('f172d244-fef6-4cb0-826e-55778f3e196f', NULL, 0, N'Setup Form', N'Setup Form'),
('29aac720-971b-43ef-9f02-9c60cd4e168b', NULL, 0, N'Accounting', N'Accounting'),
('7600596a-7cad-4514-91f3-21fe30628593', NULL, 0, N'Purchase Order', N'Purchase Order'),
('eb578e43-58ef-4e59-b50c-9f4c9c5b129e', NULL, 0, N'HR', N'HR'),
('fdd1a2ee-6792-4db2-9a05-f9377175470c', NULL, 0, N'Sale Invoice', N'Sale Invoice'),
('c82f8189-5419-4268-a5b8-8a527e62e3a8', NULL, 0, N'Touch Invoice', N'Touch Invoice'),
('ca3978f8-9aa3-49a3-95da-7bb35be89289', NULL, 0, N'Product & Bundles', N'Product & Bundles'),
('80346a2f-7934-45f0-b669-060a3924d382', NULL, 0, N'Contact', N'Contact'),
('cfcf2315-0697-401c-a5bb-38c8aaced1e1', NULL, 0, N'Expense', N'Expense'),
('cac77350-befb-4063-969f-461f188d063e', NULL, 0, N'Report', N'Report'),
('b04179a6-deaf-4b50-b3b8-7d5cb3bd0296', NULL, 0, N'Production', N'Production'),
('0a00c448-c2ba-4ee4-972d-9352bc6175b8', NULL, 0, N'System', N'System');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ArabicName', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES ('91b7b87b-9c39-49c4-89b9-19c52cfcc592', N'Brand', N'Can Save Brand', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('cc65a663-483f-4bd3-855f-65ea1d7c8f75', N'Bundles', N'Can Edit Bundles', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('e646c347-d3d1-41d5-88db-2cd5f672b6a5', N'Bundles', N'Can Save Bundles', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('d652d884-8b21-42d6-bf48-1c0337be1475', N'Product', N'Can View  Product', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('7f9edec7-09d8-4e25-8f61-b8c4876a9068', N'Product', N'Can Delete Product', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('5d78148c-057a-46b5-a9c3-63245c323c6c', N'Product', N'Can Edit Product', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('32c5fbd7-642b-4f65-a875-919025ae6d18', N'Product', N'Can Save Product', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('8631c097-f267-4b0d-9e3a-a32da30402c5', N'Touch Invoice', N'Can View  Touch Invoice', 'c82f8189-5419-4268-a5b8-8a527e62e3a8'),
('98bc72aa-d005-4e27-88db-657a778c99f7', N'Touch Invoice', N'Can Delete Touch Invoice', 'c82f8189-5419-4268-a5b8-8a527e62e3a8'),
('9af9f141-28fb-4bc6-aeff-1880841f4bc9', N'Touch Invoice', N'Can Edit Touch Invoice', 'c82f8189-5419-4268-a5b8-8a527e62e3a8'),
('7c1f24c2-7ae3-4d4e-b32e-f8a9d2109436', N'Touch Invoice', N'Can Save Touch Invoice', 'c82f8189-5419-4268-a5b8-8a527e62e3a8'),
('621a8253-b3d8-4943-82bb-27be56ac7031', N'Day Start', N'Day Counter', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('952f4fc4-7c5f-4f25-89a5-f3bf3a5abf12', N'Day Start', N'Day Close', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('70f3e79c-d703-48dd-8aa7-1565998c47be', N'Day Start', N'Day Register', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('b721b192-a6c2-405d-b083-1d0ad699ea60', N'Day Start', N'Day Start', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('161b2ed5-2702-4c34-bbf5-9f49dbdafab4', N'Sale Return', N'Can View  Sale Return', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('07902830-3480-440e-bbf6-5dd1aa924949', N'Bundles', N'Can Delete Bundles', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('5127c542-4bf8-4029-80c4-2b2149864152', N'Sale Return', N'Can Delete Sale Return', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('5bc6e4ef-a2b2-458b-bc62-93c0b7103579', N'Bundles', N'Can View  Bundles', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('64a7fba3-aadf-47f0-a8d8-df53888a3863', N'Promotion', N'Can Edit Promotion', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('3a87487d-2950-4366-b3b4-3fcafc47651e', N'Expense', N'Can Save Expense as Post', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('68a0b70c-02ae-4d29-89ee-0a550a805259', N'Expense', N'Can View  Expense as Draft', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('89491549-353b-4fed-b397-77770f3d713b', N'Expense', N'Can Delete Expense as Draft', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('216a8f48-be1e-44f7-85d2-7ac90bf17b12', N'Expense', N'Can Edit Expense as Draft', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('22122094-19d8-42c1-9ba3-d67087ed5d88', N'Expense', N'Can Save Expense as Draft', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('9fe5b3d0-1d1f-4d3d-bb0a-968188e70345', N'Supplier', N'Can View  Supplier', '80346a2f-7934-45f0-b669-060a3924d382'),
('00b0c128-0698-4ec2-ab02-fcc7150f614d', N'Supplier', N'Can Delete Supplier', '80346a2f-7934-45f0-b669-060a3924d382'),
('5215425a-5226-4b80-93bc-4c81e4555144', N'Supplier', N'Can Edit Supplier', '80346a2f-7934-45f0-b669-060a3924d382'),
('c4121042-4d8c-4fc2-95d2-cfc4c4f8fa12', N'Supplier', N'Can Save Supplier', '80346a2f-7934-45f0-b669-060a3924d382'),
('8adb14b7-3549-4e2e-8214-04d7e1348207', N'Customer', N'Can View  Customer', '80346a2f-7934-45f0-b669-060a3924d382'),
('b16ab14a-e25f-4807-a69b-07a2cf930f17', N'Customer', N'Can Delete Customer', '80346a2f-7934-45f0-b669-060a3924d382'),
('487ee180-f4f3-4846-94cc-df404fda8ef1', N'Customer', N'Can Edit Customer', '80346a2f-7934-45f0-b669-060a3924d382'),
('175f38fb-f20f-4daf-80c8-ffc105469703', N'Customer', N'Can Save Customer', '80346a2f-7934-45f0-b669-060a3924d382'),
('0f77f740-823f-4643-8dc7-30d6bb124144', N'Promotion', N'Can View  Promotion', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('72d8bd35-702c-4ea2-81e1-10f72ef8f58c', N'Promotion', N'Can Delete Promotion', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('95c0fc68-3dc2-4e8f-9577-0e8da47ed580', N'Promotion', N'Can Save Promotion', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('264f10a3-7006-428d-938b-716101e3b113', N'Expense', N'Can Edit Expense as Post', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('637a753d-5f9f-490f-8f26-cf2060972f2b', N'Sale Return', N'Can Edit  Sale Return', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('c4f75f26-32b3-4bd8-8f20-328be7d82197', N'Mobile Order', N'Can View   Mobile Order', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('8e82686e-c68d-4d91-8681-c8eecd2a6de3', N'Stock Transfer', N'Can View  Stock Transfer as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('52779803-f0e9-4da1-b228-8afd3ea8d88a', N'Stock Transfer', N'Can Delete Stock Transfer as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('7ee087c4-981f-42e2-af43-f52761d96f83', N'Stock Transfer', N'Can Edit Stock Transfer as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('fcf03061-8bc8-4b53-9866-74844f730db5', N'Stock Transfer', N'Can Save Stock Transfer as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('379354e8-36ab-47d7-b023-4cea93a133eb', N'Stock Transfer', N'Can View  Stock Transfer as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('c9849a14-1b2c-4993-b50e-a6bc64f69095', N'Stock Transfer', N'Can Delete Stock Transfer as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('e1b98cfa-d450-4c36-818d-296e16082a3a', N'Stock Transfer', N'Can Edit Stock Transfer as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('cb9d0f1e-4b2e-4cdb-8d66-8dcb05fab5b9', N'Stock Transfer', N'Can Save Stock Transfer as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('a9008a7a-5c19-4ccd-97c7-42f9937529e1', N'Stock Return', N'Can View  Stock Return', '7600596a-7cad-4514-91f3-21fe30628593'),
('855377c8-a74f-4542-acd0-8aa52ab7e7f5', N'Stock Return', N'Can Delete Stock Return', '7600596a-7cad-4514-91f3-21fe30628593'),
('e303975e-5fb0-49dd-89dd-6550d9f796e4', N'Stock Return', N'Can Edit Stock Return', '7600596a-7cad-4514-91f3-21fe30628593'),
('f10732d2-0f61-4676-b86c-3530be9eff17', N'Stock Return', N'Can Save Stock Return', '7600596a-7cad-4514-91f3-21fe30628593'),
('2646a8c9-2002-403a-bed1-26b6a90a381a', N'Stock Out', N'Can View  Stock Out as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('6e575b38-55d2-4925-aafb-5654acf48116', N'Stock Out', N'Can Delete Stock Out as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('02d93298-0f97-4d8b-82f0-3da7359018ae', N'Stock Out', N'Can Edit Stock Out as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('6a496fb2-7e61-4bf7-843c-9b92888fe4ec', N'Employee', N'Can Save Employee', 'eb578e43-58ef-4e59-b50c-9f4c9c5b129e'),
('8821831a-f344-4455-8ee0-be85389e20dc', N'Sale Return', N'Can Save Sale Return', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('e3609735-21cb-447c-acea-2f7b10053c72', N'Employee', N'Can Edit Employee', 'eb578e43-58ef-4e59-b50c-9f4c9c5b129e'),
('6a096fb2-7e61-4bf7-843c-9b92888fe4ec', N'Employee', N'Can View  Employee', 'eb578e43-58ef-4e59-b50c-9f4c9c5b129e'),
('9045f6de-fac6-44f0-b90f-a6d61361ca66', N'Mobile Order', N'Can Delete  Mobile Order', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('28ea4238-e4d0-4f6f-8c85-b5e51083b423', N'Mobile Order', N'Can Edit  Mobile Order', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('d576e3f9-b5d6-43a6-9799-171d8d8d470a', N'Mobile Order', N'Can Save  Mobile Order', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('d5758ee0-699a-410b-8d11-67667e284b8e', N'Sale Invoice', N'Can View  Sale Invoice as Paid', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('924a6f86-fb2b-4afb-b8aa-5632ac9eedde', N'Sale Invoice', N'Can Delete Sale Invoice as Paid', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('604a7045-c03f-4bd7-b23d-8d21cd649864', N'Sale Invoice', N'Can Edit Sale Invoice as Paid', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('81ce93cc-9fbe-4a99-8449-a4d1fdb6a935', N'Sale Invoice', N'Can Save Sale Invoice as Paid', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('c8a96a66-87d6-46fd-86f8-86377ebe5a9c', N'Sale Invoice', N'Can View  Sale Invoice as Hold', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('f862b14c-9cf5-4514-b86c-d3bf64eb6b25', N'Sale Invoice', N'Can Delete Sale Invoice as Hold', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('738dff20-0e10-44ae-821e-a67deabb765f', N'Sale Invoice', N'Can Edit Sale Invoice as Hold', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('ec2bb155-7d9e-4746-a7da-ee8b9fab59d0', N'Sale Invoice', N'Can Save Sale Invoice as Hold', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('ee737eb1-7aee-4806-9982-6e410928d1c8', N'Sign up User', N'Can View  Sign up User', 'eb578e43-58ef-4e59-b50c-9f4c9c5b129e'),
('c7519c17-a863-4654-b5ce-3640600f9eb7', N'Sign up User', N'Can Delete Signup User', 'eb578e43-58ef-4e59-b50c-9f4c9c5b129e'),
('9d857030-ede1-4a36-bbe6-3ddf252e3b86', N'Sign up User', N'Can Edit Sign up User', 'eb578e43-58ef-4e59-b50c-9f4c9c5b129e'),
('29aac720-971b-43ef-9f02-9c60cd4e168b', N'Sign up User', N'Can Save Sign up User', 'eb578e43-58ef-4e59-b50c-9f4c9c5b129e'),
('f443fbdb-86f0-4dcb-b411-bc709d2a0361', N'Employee', N'Can Delete Employee', 'eb578e43-58ef-4e59-b50c-9f4c9c5b129e'),
('2164ec38-de68-4b78-a5cd-5cdae140e09f', N'Stock Out', N'Can Save Stock Out as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('04cdcddd-475c-4e66-8390-a7e15e133b3f', N'Expense', N'Can Delete Expense as Post', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('633de319-f00d-4ac4-bbc7-a77eb44fa672', N'Expense', N'Can Save Expense as Reject', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('b93e7e1b-9041-43a5-974d-7b980dfdb750', N'Despatch Note', N'Can View Despatch Note as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('d42760b7-96c0-476d-bb9d-d5587ee7466c', N'Despatch Note', N'Can Delete Despatch Note as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('1ec28e57-e9cc-48f6-ab2b-d4ea025be4fe', N'Despatch Note', N'Can Edit Despatch Note as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('6d7f02bd-058f-4f2c-8e02-6aacbaaf66dc', N'Despatch Note', N'Can Save Despatch Note as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('e8b25346-fd48-4249-bf38-7450f0b71eb4', N'Despatch Note', N'Can View Despatch Note as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('c3c79cf2-9624-4ad4-8bce-2a3c514abb8a', N'Despatch Note', N'Can Delete Despatch Note as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('1cfacdf4-4d05-43fb-85bb-1570f7dfc42b', N'Despatch Note', N'Can Edit Despatch Note as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('d1d2fc80-55d4-408e-9e1e-7f59369f6b7e', N'Despatch Note', N'Can Save Despatch Note as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('ddd70ae5-83ad-4f25-884d-51989ddbeaad', N'Production Batch', N'Can View Production Batch as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('2a7710c0-eada-406f-9548-671e3e9bec80', N'Production Batch', N'Can Delete Production Batch as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('d7935a0c-7985-439c-b75f-52a1b9fc5d2e', N'Production Batch', N'Can Edit Production Batch as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('baa059e1-32a6-4843-a1e6-5ef6f14a93e2', N'Production Batch', N'Can Save Production Batch as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('5d045860-b3a1-42ff-8dd3-82661fd1d939', N'Production Batch', N'Can View Production Batch as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('148f1f0d-ab0f-49d3-9d02-fec1d9bd10bf', N'Production Batch', N'Can Delete Production Batch as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('de8f915c-843e-4548-8c8f-2d7dc3cd573e', N'Production Batch', N'Can Edit Production Batch as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('90a74990-2cc1-4224-b90a-1be6d53191ce', N'Production Stock', N'Can Save Production Stock as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('53140b33-89e1-4fc2-90ce-b2b2e577f66f', N'Production Batch', N'Can Save Production Batch as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('cdbc8e2c-70f3-46a7-9aab-0666a6b49309', N'Production Stock', N'Can Edit Production Stock as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('5c060004-7c7a-4539-b097-c3a8cead671c', N'Production Stock', N'Can View Production Stock as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('6ee0462d-4bf1-4074-8a42-6709e2375267', N'System', N'Restore Database', '0a00c448-c2ba-4ee4-972d-9352bc6175b8'),
('d04864b9-c51c-4f40-9d01-639f5be114ca', N'System', N'Database Backup', '0a00c448-c2ba-4ee4-972d-9352bc6175b8'),
('482e0412-62de-46e7-add5-2fb443596f11', N'System', N'Can Change Company Profile', '0a00c448-c2ba-4ee4-972d-9352bc6175b8'),
('326661b9-3293-478b-a5a2-1c646c43d1ad', N'Sale Order', N'Can View Sale Order as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('24e9d982-8fea-4c96-823a-bad0669d2634', N'Sale Order', N'Can Delete Sale Order as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('b77e401c-80e9-4302-a9e5-1d6fcdb69815', N'Sale Order', N'Can Edit Sale Order as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('1f844c71-c41e-4068-8731-e86f76873fce', N'Sale Order', N'Can Save Sale Order as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('5f0ca00f-d9f3-4620-8e1b-d89a563af1fa', N'Sale Order', N'Can View Sale Order as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('c1e20c47-08d2-4628-b283-8bac062e956e', N'Sale Order', N'Can Delete Sale Order as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('6a02310e-be2d-4dd1-9eb9-9887a8efe5e5', N'Sale Order', N'Can Edit Sale Order as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('1f9797f1-4639-443f-b687-6b64a4a83c05', N'Sale Order', N'Can Save Sale Order as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('08ca50ee-442e-4e68-8065-850cccf751ed', N'Production Stock', N'Can View Production Stock as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('0be0d795-2652-4884-b939-58d154043ba1', N'Production Stock', N'Can Delete Production Stock as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('e272bca6-7a9f-44cd-943a-27d55f4ef932', N'Production Stock', N'Can Edit Production Stock as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('57069004-7c7a-4539-b097-c3a8cead671c', N'Production Stock', N'Can Save Production Stock as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('bec3dd0c-fc1f-4743-ac34-c06d3770b7e0', N'Production Stock', N'Can Delete Production Stock as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('2f314227-8b9f-44fc-985d-4a9eca30e1db', N'Expense', N'Can View  Expense as Post', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('d8e6bc84-774d-462a-b5d2-18de27f90c8c', N'Recipe', N'Can View  Recipe as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('0e6e2786-7eb9-4e45-9b5d-afc67def4980', N'Recipe', N'Can Edit Recipe as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('4047f716-fc4e-498a-950a-04f3b4038880', N'Customer Wise Product Sale', N'Can Print Customer Wise Product Sale Report', 'cac77350-befb-4063-969f-461f188d063e'),
('7447ab3c-dfba-4644-9b3f-80e8b031c5a7', N'Customer Wise Product Sale', N'Can View Customer Wise Product Sale Report', 'cac77350-befb-4063-969f-461f188d063e'),
('3c3febd7-54df-4a2a-895b-731e8fe72128', N'Transaction Type Stock Value Report', N'Can Print Transaction Type Stock Value Report', 'cac77350-befb-4063-969f-461f188d063e'),
('030fd7a5-8bec-4cce-a4bf-e3bbd49ff3b7', N'Transaction Type Stock Value Report', N'Can View Transaction Type Stock Value Report', 'cac77350-befb-4063-969f-461f188d063e'),
('fcee2e1f-3bdf-40ac-8983-07a9da81255c', N'Stock Averag Value Report', N'Can Print Stock Average Value Report', 'cac77350-befb-4063-969f-461f188d063e'),
('1b8c15d1-c29b-48e5-a117-d961a53aefa5', N'Stock Averag Value Report', N'Can View Stock Average  Value Report', 'cac77350-befb-4063-969f-461f188d063e'),
('51dca813-bb8b-473a-aec8-47e32493fe01', N'Stock Value Report', N'Can Stock Value Report', 'cac77350-befb-4063-969f-461f188d063e'),
('8cc04d98-f1c4-4fb3-a3da-735ae2e0b8a3', N'Stock Value Report', N'Can View Stock Value Report', 'cac77350-befb-4063-969f-461f188d063e'),
('1ccca4ad-c148-45a6-bfdb-6e875f3c70f4', N'Inventory Report', N'Can Print Report', 'cac77350-befb-4063-969f-461f188d063e'),
('04b567b5-b5db-47e1-9b48-3d10f14a36a2', N'Inventory Report', N'Can View Report', 'cac77350-befb-4063-969f-461f188d063e'),
('1a1f8a7b-c256-435f-90ee-9ff5e2ed03da', N'Expense', N'Can Bulk Expense Approved', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('a973d44c-684d-4473-9b48-81e8ccf3cbc3', N'Expense', N'Can Bulk Expense Rejected', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('1ceefeeb-9b95-4caa-97f4-0d78e5c718ea', N'Expense', N'Can View  Expense as Reject', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('73fdea15-53df-46c8-99f8-fe911a2765a7', N'Expense', N'Can Delete Expense as Reject', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('725374f9-867e-40bb-a8a2-eb3661c2223d', N'Expense', N'Can Edit Expense as Reject', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('a5cc534a-12fa-4a90-827c-0600fe148b3f', N'Supplier Wise Product Purchase', N'Can View Supplier Wise Product Purchase Report', 'cac77350-befb-4063-969f-461f188d063e'),
('8909bb3c-4784-456c-b306-58fa20fc49e9', N'Recipe', N'Can Delete Recipe as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('ea8b0004-0327-4a06-a01f-7e0bc278ccc0', N'Supplier Wise Product Purchase', N'Can Print Supplier Wise Product Purchase Report', 'cac77350-befb-4063-969f-461f188d063e'),
('ff863483-15de-44ed-97d4-f1ba2d9161c3', N'Customer Discount Product', N'Can Print Customer Discount Product Report', 'cac77350-befb-4063-969f-461f188d063e'),
('17997ed1-7510-41e0-b84e-0338f2439b0e', N'Recipe', N'Can Save Recipe as Post', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('528c1062-d45b-4524-bcbf-05f3cd24ab31', N'Recipe', N'Can View  Recipe as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('91ea3770-c0da-49d3-be8d-8e0cd4ab24fd', N'Recipe', N'Can Delete Recipe as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('fbbb462c-5501-4ce9-85d2-5eaa3c6f256a', N'Recipe', N'Can Edit Recipe as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('277ed0cf-c965-4ebb-bde3-2b8ea94f4735', N'Recipe', N'Can Save Recipe as Draft', 'b04179a6-deaf-4b50-b3b8-7d5cb3bd0296'),
('e1e28e4b-7c6f-4106-ad84-43637284a975', N'Account Ledger', N'Can Print Account Ledger Report', 'cac77350-befb-4063-969f-461f188d063e'),
('62b7bb8e-de4c-4201-b3cc-c247c0e0f620', N'Account Ledger', N'Can View Account Ledger Report', 'cac77350-befb-4063-969f-461f188d063e'),
('42d8ba7d-8a08-4897-a17c-ed83fa815a59', N'Free of Cost Sale', N'Can Print Free of Cost Sale Report', 'cac77350-befb-4063-969f-461f188d063e'),
('6687be37-b66a-421b-8e98-61d2b6dd630c', N'Free of Cost Sale', N'Can View Free of Cost Sale Report', 'cac77350-befb-4063-969f-461f188d063e'),
('006272b6-1197-422c-bfec-95367d7fbe04', N'Product Discount Supplier', N'Can Print Product Discount Supplier Report', 'cac77350-befb-4063-969f-461f188d063e'),
('8df9d4f8-9ace-4b10-b96f-758442eaa164', N'Product Discount Supplier', N'Can View Product Discount Supplier Report', 'cac77350-befb-4063-969f-461f188d063e'),
('56e15d9c-3db6-46a0-a830-6ba8078a54ca', N'Product Discount Customer', N'Can Print Product Discount Customer Report', 'cac77350-befb-4063-969f-461f188d063e'),
('71dc039f-5b2e-43af-9bd3-592632d3ffe8', N'Product Discount Customer', N'Can View Product Discount Customer Report', 'cac77350-befb-4063-969f-461f188d063e'),
('036c6c73-fa06-4995-aa2a-770db17157d3', N'Supplier Discount Product', N'Can Print Supplier Discount Product Report', 'cac77350-befb-4063-969f-461f188d063e'),
('0c261749-97a6-41d9-9705-a9106dfb76d3', N'Supplier Discount Product', N'Can View Supplier Discount Product Report', 'cac77350-befb-4063-969f-461f188d063e'),
('306f33c5-42dd-48da-b6af-922182d8596a', N'Customer Discount Product', N'Can View Customer Discount Product Report', 'cac77350-befb-4063-969f-461f188d063e'),
('69624997-4c9c-4a23-b178-93233c1028a0', N'System', N'Flush Database', '0a00c448-c2ba-4ee4-972d-9352bc6175b8'),
('c546ee15-506d-444c-aefd-1c86231bc0c9', N'Stock Out', N'Can View  Stock Out as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('8df1d3d9-358b-4062-9cd6-eff5efc7c5d3', N'Stock Out', N'Can Edit Stock Out as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('b4fd3f41-684d-413b-98d8-bbbbdb8eb0a8', N'Monthly Cost', N'Can Edit Monthly Cost', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('38df78a2-2e02-448e-8458-70ae509d2a5e', N'Monthly Cost', N'Can Save Monthly Cost', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('0232b199-7c83-4199-bdc1-1e057d3678d3', N'Currency', N'Can View Currency', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('6d11941f-4efc-4184-891b-95d1bb486d98', N'Currency', N'Can Delete Currency', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f466e424-e5ec-4a8f-9893-675a5a96e526', N'Currency', N'Can Edit Currency', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('57282478-e239-45e6-bf8c-3b11a84f5a8c', N'Currency', N'Can Save Currency', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('40e034fd-00dd-4ea8-8ff2-f5ae34e7cb7b', N'Terminals', N'Can View Terminals', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('52b993b9-65ee-45ed-b044-9f488f05ea9e', N'Terminals', N'Can Delete Terminals', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('ab6c2caa-fe02-4b01-8ae3-639318a4f09a', N'Terminals', N'Can Edit Terminals', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('01b9e41d-c0dc-4065-9c04-fff087468616', N'Terminals', N'Can Save Terminals', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('9ba25565-c988-499a-8c7c-604cd3d0b5fc', N'Payment Option', N'Can View Payment Option', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f0f8183b-6e0a-4a47-8ba3-a49200d5c564', N'Payment Option', N'Can Delete Payment Option', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('589a7313-8b15-40d1-9863-8b23bcf5f387', N'Payment Option', N'Can Edit Payment Option', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('48a7e968-c394-48b3-97f3-ca170d69bf07', N'Payment Option', N'Can Save Payment Option', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('3c707a3b-16ef-4d69-8b8d-2906cd97c1a8', N'Company Setup', N'Can View Company Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('998e1ae2-071c-4687-ba77-4db8b7786888', N'Monthly Cost', N'Can Delete Monthly Cost', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('01471545-b55b-4820-9fa5-37a13da008b0', N'Company Setup', N'Can Delete Company Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f75adbd1-53ea-4713-873b-a21d4eb2c658', N'Monthly Cost', N'Can View Monthly Cost', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('e14fd3bb-1d4a-4878-90db-5a29b56e6500', N'Size', N'Can Edit Size', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('1966796c-cb72-4f4c-bba4-1d10d8a1dc5f', N'Bank', N'Can Save  Bank', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('a3ad316c-7d58-4466-9920-5d421699d9ef', N'Denomination Setup', N'Can View Denomination Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('6f4cc69e-937e-416a-819f-591f83867984', N'Denomination Setup', N'Can Delete Denomination Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('d65035c8-8f9d-463f-b528-8160f1a02f38', N'Denomination Setup', N'Can Edit Denomination Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('5441b964-256b-4722-b761-3844fbf33532', N'Denomination Setup', N'Can Save Denomination Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('98558d0d-8032-4b8d-b91b-d97936b9fdb1', N'Can View Location Attachment', N'Can View Location Attachment', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('cff3d9a2-b4ed-46f9-b0c1-080f0c6e0d4e', N'View Dashboard', N'Can View Dashboard', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('949ad470-96e6-4a46-bbfd-5384457bc2dc', N'Permission', N'Can Change Profile', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('1438f661-3dd7-42d4-a9e9-81fc1d8a0c54', N'Permission', N'Can Update Permission', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('c19e11d3-977f-4a77-8b6e-b87b5769bb5e', N'Permission', N'Can Assign User', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('7441b264-1d06-4c56-a80a-b0272110273f', N'Permission', N'Can View Permission', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('604ff746-2bd5-4558-a6b0-ef5f49ccd9e8', N'Role', N'Can View Role', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('aa96f625-5526-4cb8-b0d7-01fbcaed6f45', N'Role', N'Can Save Role', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('62a3710d-f16f-4ce5-ab72-04b717e48890', N'Size', N'Can View Size', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('0bf63044-8c7a-42c5-8764-bf795bb37447', N'Size', N'Can Delete Size', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('99af4d7b-731f-4456-8d03-37fc76682625', N'Size', N'Can Save Size', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('8872d4db-6554-441e-9513-af35e4963433', N'Bank', N'Can Edit Bank', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('0f3caa9a-07ba-4c5f-b4c5-e8ccb88ea421', N'Company Setup', N'Can Edit Company Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('63edf9d4-feb8-44f3-8fee-12022aff1e54', N'Ware House', N'Can View Ware House', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('2c57f8de-23f6-4fdf-a99e-a87cd6a48083', N'Color', N'Can View Color', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('53805cd0-480d-49e3-a792-040611c2776f', N'Color', N'Can Delete Color', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('b11a0c0c-934c-4e0b-b652-932c8c507c1f', N'Color', N'Can Edit Color', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('df168358-99a7-41cf-bc2d-32dcd6b62d03', N'Color', N'Can Save Color', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('669ed81d-96bc-4ed6-a3e5-0f3f01954114', N'Catery', N'Can View Catery', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('4ad20abc-4e2d-4cdf-a70d-863ae4ee5588', N'Catery', N'Can Delete Catery', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('06bff7fc-ecca-4305-886e-3d7aa5246bea', N'Catery', N'Can Edit Catery', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('079f4f75-7b77-4339-bc73-fc3e40e36c8d', N'Catery', N'Can Save Catery', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f161d9bd-7db7-467e-a86d-7eb812bead04', N'BarCode Printing', N'Can View BarCode Printing', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f1e667a4-b7d4-4105-a232-eac63c804ccd', N'BarCode Printing', N'Can Delete BarCode Printing', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('6e045010-76d2-4261-8c0b-378d5252af49', N'BarCode Printing', N'Can Edit BarCode Printing', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('5e2a63e0-2cd3-43e5-825a-0ce263be0765', N'BarCode Printing', N'Can Save BarCode Printing', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('082de882-9836-4869-abb1-698e264ef6f4', N'Brand', N'Can View Brand', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('ed83e71c-4949-485c-84fb-fe8c01ca279a', N'Brand', N'Can Delete Brand', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('ae1a7c13-daa5-4466-a8a8-544dcd2b76d1', N'Brand', N'Can Edit Brand', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('452c8428-fa7c-421d-89d6-cd12e6fc8439', N'Origin', N'Can Save Origin', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('d0f5705e-9bef-405b-a925-56b833d5c029', N'Company Setup', N'Can Save Company Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('d79afa05-039b-4f3b-8038-ed835e7123ed', N'Origin', N'Can Edit Origin', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('1f093ea3-814d-4338-8aa5-6b25013d5878', N'Origin', N'Can View Origin', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('e2092c9b-7051-485e-9002-e4bdfb987005', N'Ware House', N'Can Delete Ware House', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('804b8823-c980-4b11-9d7d-3936469dfde6', N'Ware House', N'Can Edit Ware House', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('75ef2940-38d4-41f2-8de0-89cb8c216592', N'Ware House', N'Can Save Ware House', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('7e17ff28-b433-4d27-bf29-51afd7709dd0', N'Unit', N'Can View Unit', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f09f60e6-8ac3-444f-86d8-b4489a40ec7b', N'Unit', N'Can Delete Unit', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f70377ca-2e6c-435f-9025-23c1361579b6', N'Unit', N'Can Edit Unit', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('38c57c94-31a9-48c5-ab03-b20b6fe24ef5', N'Unit', N'Can Save Unit', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('63b07e2c-eab5-4cce-b838-d592553f8d06', N'Tax Rate', N'Can View Tax Rate', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('6c5a8310-4508-48da-9228-c81da9b4f84a', N'Tax Rate', N'Can Delete Tax Rate', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('2a2a3400-d8e4-4d85-83e8-adfa8d3e6428', N'Tax Rate', N'Can Edit Tax Rate', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('3aecc007-62cc-4657-9cff-f26e6d91d3f4', N'Tax Rate', N'Can Save Tax Rate', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('c6c23136-17b8-4787-8f96-563389a204ab', N'SubCateries', N'Can View SubCateries', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('7e04d43e-aa36-404c-9633-288da5ae072e', N'SubCateries', N'Can Delete SubCateries', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('977102ef-9524-4ab8-a163-1fe4672348a8', N'SubCateries', N'Can Edit SubCateries', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('e72be317-8c29-4487-9382-a0cca1aed819', N'SubCateries', N'Can Save SubCateries', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('e14bc4e1-8d09-4a3e-8550-04bcc331af1c', N'Origin', N'Can Delete Origin', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('091991aa-37ce-467a-9ef4-e9358a201d2a', N'Stock Out', N'Can Delete Stock Out as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('d5565381-58f5-4c97-975e-3d7cd44e7c0b', N'Bank', N'Can Delete Bank', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('c16c04d9-72e1-4bd6-8aec-f630d7b4a1f4', N'Cash Receipt', N'Can Save Cash Receipt as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('853f028d-2a1d-419f-be3c-81d7619c2e96', N'Purchase Invoice as Draft', N'Can Edit Purchase Invoice as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('3d175f3f-efd6-42b0-9013-0e4bc148bcd0', N'Purchase Invoice as Draft', N'Can Save  Purchase Invoice as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('55b674da-88ed-4a38-a056-8a88e72ce7a6', N'Purchase Order as Post', N'Can View  Purchase Order as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('fdb7cea6-6bcc-4cb6-94a9-c7981c6eea7c', N'Purchase Order as Post', N'Can Delete Purchase Order as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('238f7d1b-243b-4854-abca-cb06309a6822', N'Purchase Order as Post', N'Can Edit Purchase Order as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('bc24546b-0aba-4da8-b2bb-2db326a70783', N'Purchase Order as Post', N'Can Save Purchase Order as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('c7d6f1af-395f-4eb2-9a24-8fde4b775074', N'Purchase Order as Draft', N'Can View Purchase Order as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('f2b3751e-d8f9-49b3-95c9-abc3116c11fc', N'Purchase Order as Draft', N'Can Delete Purchase Order as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('f8a3751e-d8f9-49b3-95c9-abc3116c11fc', N'Purchase Order as Draft', N'Can Edit Purchase Order as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('61afaf5a-6eaf-4387-b81b-a96a7165a44e', N'Purchase Order as Draft', N'Can Save  Purchase Order as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('c628ab0c-5109-46fa-97b5-4d3954d1f566', N'Journal Voucher', N'Can View Journal Voucher as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('5f7b17fd-6dc4-4b8d-b772-7c80ec0bf148', N'Journal Voucher', N'Can Delete  Journal Voucher as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('61705c54-0304-4a43-bc5f-9d4c46a0583c', N'Journal Voucher', N'Can Edit  Journal Voucher as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('ecb25b27-0afd-4888-9b96-dcbb930b0c89', N'Journal Voucher', N'Can Save Journal Voucher as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('fe7234e7-1b45-4147-836c-df0538e36446', N'Journal Voucher', N'Can View Journal Voucher as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('4f37e638-1793-48aa-b5a6-25a5cf215b0d', N'Purchase Invoice as Draft', N'Can Delete Purchase Invoice as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('2dea3c02-5ece-4f77-a4e2-51bd228b1b26', N'Journal Voucher', N'Can Delete  Journal Voucher as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('f5e47e34-e531-4e91-b288-fb09b7f950e7', N'Purchase Invoice as Draft', N'Can View Purchase Invoice as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('f2a3751e-d8f9-49b3-95c9-0bc3116c11fc', N'Purchase Invoice as Post', N'Can Edit Purchase Invoice as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('abb53fbb-7c75-4c1c-b5e5-b9b148c81218', N'Stock Out', N'Can Save Stock Out as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('73da0510-b625-488d-b5e1-8c51be6852e1', N'Stock In', N'Can View  Stock In as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('4a8ea498-5b32-467c-8598-0b56f4895856', N'Stock In', N'Can Delete Stock In as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('e999cbea-cb6c-492f-bbd2-085b94123526', N'Stock In', N'Can Edit Stock In as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('08339baa-2b00-4508-9afa-0176c095b655', N'Stock In', N'Can Save Stock In as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('508d3cb2-a1f7-4940-91ea-55fa3ca60567', N'Stock In', N'Can View  Stock In as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('11b73791-0e85-4edc-8089-260d79579a8d', N'Stock In', N'Can Delete Stock In as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('9593897e-63b0-4d35-bd8c-d5f6ad49ed73', N'Stock In', N'Can Edit Stock In as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('af665ba5-4c02-45aa-ab00-cf533c037df2', N'Stock In', N'Can Save Stock In as Draft', '7600596a-7cad-4514-91f3-21fe30628593'),
('f8dcbdf3-fe8b-4251-9672-9dfd2535e6e8', N'Purchase Return', N'Can View  Purchase Return', '7600596a-7cad-4514-91f3-21fe30628593'),
('66b335a9-85cb-45f8-8a40-8de42a214d48', N'Purchase Return', N'Can Delete Purchase Return', '7600596a-7cad-4514-91f3-21fe30628593'),
('2d116856-8144-43a8-8297-633c6e1fa69a', N'Purchase Return', N'Can Edit Purchase Return', '7600596a-7cad-4514-91f3-21fe30628593'),
('ee288fce-c3b4-45c6-9a98-68068ec3f5db', N'Purchase Return', N'Can Save Purchase Return', '7600596a-7cad-4514-91f3-21fe30628593'),
('36bdc1cd-de83-4443-871a-07782e048499', N'Purchase Invoice as Post', N'Can View  Purchase Invoice as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('df4c05f4-afea-48cb-9b94-06aa7d04f1df', N'Purchase Invoice as Post', N'Can Delete Purchase Invoice as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('02651eb3-3f41-4c78-8d3b-92c8e401c37c', N'Purchase Invoice as Post', N'Can Save Purchase Invoice as Post', '7600596a-7cad-4514-91f3-21fe30628593'),
('7c1327b2-ab3b-4462-8a32-5f202d6b6886', N'Bank', N'Can View Bank', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('232517a9-f32d-48b2-b570-8cd830ae1abf', N'Journal Voucher', N'Can Edit  Journal Voucher as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('15813b93-e6b9-47e0-af83-01ed14dba606', N'Chart Of Account', N'Can View Chart Of Account', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('5f290a32-02f2-4893-947d-dfa81b83f8cd', N'Cash Pay', N'Can View Cash Pay as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('31bc4a88-10a6-493a-8fcb-5c2c6100d7ef', N'Cash Pay', N'Can Delete Cash Pay as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('fafa3dee-7560-4713-a664-9877470e485b', N'Cash Pay', N'Can Edit  Cash Pay as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('d0a55259-37ff-4987-9a17-ec17b56107da', N'Cash Pay', N'Can Save Cash Pay  as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('de921db2-438c-4e82-a956-6674dbf27860', N'Cash Pay', N'Can View Cash Pay as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('4aee9684-139c-44d8-b7e6-efe076995ba2', N'Cash Pay', N'Can Delete Cash Pay as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('93fd99d1-458a-4446-954c-8ddfa631def5', N'Cash Pay', N'Can Edit  Cash Pay as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('324744b6-54ae-4a7a-9c47-8c36a8383f3a', N'Cash Pay', N'Can Save Cash Pay  as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('e09194b3-e355-4975-8247-c0170438e849', N'Cash Receipt', N'Can View Cash Receipt as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('93449156-d2fc-4402-9e83-a168ba0fb4c3', N'Cash Receipt', N'Can Delete Cash Receipt as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('3f145b00-bb89-4a5f-9cb8-babb540803db', N'Cash Receipt', N'Can Edit Cash Receipt as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('adde6b14-a937-4b3b-998d-350d01fd198b', N'Cash Receipt', N'Can Save Cash Receipt as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('073faf36-caaa-4d70-876a-aff78e5a6530', N'Cash Receipt', N'Can View Cash Receipt as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('053493a2-5755-4e07-bc3b-30942f506b92', N'Cash Receipt', N'Can Delete Cash Receipt as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('155a03af-ebbd-4260-b010-2ed20d7cfd63', N'Cash Receipt', N'Can Edit Cash Receipt as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('b2de6dad-5f4a-4e16-9247-efb55626ce9a', N'Bank Pay', N'Can Save Bank Pay  as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('611753d3-0399-4c52-b335-c3efab8afe03', N'Journal Voucher', N'Can Save Journal Voucher as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('5fb823ea-615e-455c-8c85-d43f1653d3bf', N'Bank Pay', N'Can Edit Bank Pay as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('d15d5014-2312-4b71-911a-beddc3bd9065', N'Bank Pay', N'Can View Bank Pay as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('27559dba-5fc7-42e7-82aa-38863113f5d0', N'Chart Of Account', N'Can Delete Chart Of Account', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('5062204b-6bd7-40d5-8b1a-dd4f3be10095', N'Chart Of Account', N'Can Edit Chart Of Account', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('6e935bc8-6bb3-428a-93c8-dfed39f62aa5', N'Chart Of Account', N'Can Save Chart Of Account', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('d0c71d2a-06cc-45e3-8d63-6302bd85019a', N'Bank Receipt', N'Can View Bank Receipt as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('6143bb33-1034-448e-8433-e50f39f83360', N'Bank Receipt', N'Can Delete Bank Receipt as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('40624f69-1c4e-4c43-9ea3-f8f31b74ab34', N'Bank Receipt', N'Can Edit Bank Receipt as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('53a5207a-2e57-4636-80b6-e1e0b9390b6f', N'Bank Receipt', N'Can Save Bank Receipt as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('dadd482e-d6ea-466a-a32d-4a836070480e', N'Bank Receipt', N'Can View Bank Receipt as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('dcb93d01-a317-446f-a51b-80cc065c9415', N'Bank Receipt', N'Can Delete Bank Receipt as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('0e469f66-b4fd-4627-8590-0761ad978259', N'Bank Receipt', N'Can Edit Bank Receipt as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('e9dd831f-02ec-4b41-baf8-5a5d96a3450a', N'Bank Receipt', N'Can Save Bank Receipt as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('d7a683a8-7e98-4ce3-806e-3a849546d84b', N'Bank Pay', N'Can View Bank Pay as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('689bcdad-0197-41c6-97b0-628fcf9f4456', N'Bank Pay', N'Can Delete Bank Pay as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('1c051982-f3d2-469d-be5e-a9d89b780152', N'Bank Pay', N'Can Edit Bank Pay as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('272e9227-35f4-47bc-9566-c2eec585e66b', N'Bank Pay', N'Can Save Bank Pay  as Post', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('5e489851-97b6-4c42-be7d-4aff035e17aa', N'Bank Pay', N'Can Delete Bank Pay as Draft', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('3f674de2-d92a-4633-9d76-b48d6dfc4612', N'System', N'Can Change Invoice Setting', '0a00c448-c2ba-4ee4-972d-9352bc6175b8');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211124141537_Addsetupdata1', N'2.2.6-servicing-10079');



UPDATE [AccountTemplates] SET [JsonTemplate] = N'{"AccountsType":[{"Name":"Assets","NameArabic":"الاساس","IsActive":true,"CostCenters":[{"Name":"Cash in Hand","NameArabic":"صندوق","Description":"Cash in Hand","IsActive":true,"Code":"101000","Accounts":[{"Name":"Cash in Hand","NameArabic":"صندوق","Description":"Cash in Hand","IsActive":true,"Code":"10100001"}]},{"Name":"Cash in Hand - Store","NameArabic":"صندوق المستودع","Description":"Cash in Hand - Store","IsActive":true,"Code":"101001","Accounts":[{"Name":"Accounts receivable","NameArabic":"الحسبات المستحقه","Description":"Accounts receivable","IsActive":true,"Code":"10100101"}]},{"Name":"Inventory","NameArabic":"المخزون","Description":"Inventory","IsActive":true,"Code":"111000","Accounts":[{"Name":"Inventory","NameArabic":"المخزون","Description":"Inventory","IsActive":true,"Code":"11100001"}]},{"Name":"Customer Reciveables","NameArabic":"مستحقات العملاء","Description":"Customer Reciveables","IsActive":true,"Code":"120000","Accounts":[{"Name":"Customer Reciveables","NameArabic":"مستحقات العملاء","Description":"Customer Reciveables","IsActive":true,"Code":"1200001"}]},{"Name":"VAT Paid","NameArabic":"مدفوعات القيمه المضافه","Description":"VAT Paid","IsActive":true,"Code":"130000","Accounts":[{"Name":"VAT Paid on Purchases","NameArabic":"","Description":"VAT Paid on Purchases","IsActive":true,"Code":"1300001"}]},{"Name":"Banks","NameArabic":"البنوك","Description":"Banks","IsActive":true,"Code":"105000","Accounts":[{"Name":"Banks","NameArabic":"البنوك","Description":"Banks","IsActive":true,"Code":"10500001"}]},{"Name":"Accumulated Depreciation","NameArabic":"الاستهلاك التراكمي","Description":"Accumulated Depreciation","IsActive":true,"Code":"170000","Accounts":[{"Name":"Accumulated Depreciation","NameArabic":"الاستهلاك التراكمي","Description":"Accumulated Depreciation","IsActive":true,"Code":"17000001"}]},{"Name":"Fixed Assets","NameArabic":"الاساس الثابت","Description":"Fixed Assets","IsActive":true,"Code":"150000","Accounts":[{"Name":"Fixed Assets","NameArabic":"الاساس الثابت","Description":"Fixed Assets","IsActive":true,"Code":"1500001"}]},{"Name":"Due from Employee","NameArabic":"مديونات الموظف","Description":"Due from Employee","IsActive":true,"Code":"126000","Accounts":[{"Name":"Due from Employee","NameArabic":"مديونات الموظف","Description":"Due from Employee","IsActive":true,"Code":"12600001"}]}]},{"Name":"Liabilities","NameArabic":"التزامات","IsActive":true,"CostCenters":[{"Name":"Supplier Payable","NameArabic":"مدفوعات الموردين","Description":"Supplier Payable","IsActive":true,"Code":"200000","Accounts":[{"Name":"Supplier Payable","NameArabic":"مدفوعات الموردين","Description":"Supplier Payable","IsActive":true,"Code":"20000001"}]},{"Name":"Payroll Liabilities","NameArabic":"مدفوعات الرواتب","Description":"Payroll Liabilities","IsActive":true,"Code":"240000","Accounts":[{"Name":"Payroll Liabilities","NameArabic":"مدفوعات الرواتب","Description":"Payroll Liabilities","IsActive":true,"Code":"24000001"}]},{"Name":"VAT Payable","NameArabic":"مدفوعات الضريبه","Description":"VAT Payable","IsActive":true,"Code":"250000","Accounts":[{"Name":"VAT Payable on Sale","NameArabic":"مدفوعات الضريبه","Description":"VAT Payable on Sale","IsActive":true,"Code":"25000001"}]},{"Name":"Loan Payable","NameArabic":"قرض مستحق الدفع","Description":"Loan Payable","IsActive":true,"Code":"253001","Accounts":[{"Name":"Loan Payable","NameArabic":"قرض مستحق الدفع","Description":"Loan Payable","IsActive":true,"Code":"2530101"}]}]},{"Name":"Equity","NameArabic":"رأس المال","IsActive":true,"CostCenters":[{"Name":"Opening Balance Equity","NameArabic":"الرصيد الافتتاحي","Description":"Opening Balance Equity","IsActive":true,"Code":"300000","Accounts":[{"Name":"Opening Balance Equity","NameArabic":"الرصيد الافتتاحي","Description":"Opening Balance Equity","IsActive":true,"Code":"30000001"}]},{"Name":"Owner Investment","NameArabic":"استثمار المالك ","Description":"Owner Investment","IsActive":true,"Code":"301001","Accounts":[{"Name":"Owner Investment","NameArabic":"استثمار المالك ","Description":"Owner Investment","IsActive":true,"Code":"30100101"}]},{"Name":"Owner Withdrawals","NameArabic":"انسحابات المالك ","Description":"Owner Withdrawals","IsActive":true,"Code":"302001","Accounts":[{"Name":"Owner Withdrawals","NameArabic":"انسحابات المالك ","Description":"Owner Withdrawals","IsActive":true,"Code":"30200101"}]},{"Name":"Retained Earnings","NameArabic":"الارباح","Description":"Retained Earnings","IsActive":true,"Code":"320000","Accounts":[{"Name":"Retained Earnings","NameArabic":"الارباح","Description":"Retained Earnings","IsActive":true,"Code":"32000001"}]},{"Name":"Net Profit for the period","NameArabic":"صافي الربح للفتره","Description":"Net Profit for the period","IsActive":true,"Code":"321002","Accounts":[{"Name":"Net Profit for the period","NameArabic":"صافي الربح للفتره","Description":"Net Profit for the period","IsActive":true,"Code":"32100201"}]}]},{"Name":"Income","NameArabic":"ايرادات","IsActive":true,"CostCenters":[{"Name":"Sale","NameArabic":"مبيعات","Description":"Sale","IsActive":true,"Code":"420000","Accounts":[{"Name":"Sale","NameArabic":"مبيعات","Description":"Sale","IsActive":true,"Code":"42000001"}]},{"Name":"Teller","NameArabic":"الصندوق","Description":"Teller","IsActive":true,"Code":"421000","Accounts":[{"Name":"Teller","NameArabic":"الصندوق","Description":"Teller","IsActive":true,"Code":"42100001"}]},{"Name":"POS-Terminal","NameArabic":"نقاط البيع - بنك","Description":"POS-Terminal","IsActive":true,"Code":"425000","Accounts":[{"Name":"POS-Terminal","NameArabic":"نقاط البيع - بنك","Description":"POS-Terminal","IsActive":true,"Code":"42500001"}]},{"Name":"Discount Taken","NameArabic":"الخصم المأخوذ","Description":"Discount Taken","IsActive":true,"Code":"426000","Accounts":[{"Name":"Discount Taken","NameArabic":"الخصم المأخوذ","Description":"Discount Taken","IsActive":true,"Code":"42600001"}]}]},{"Name":"Expenses","NameArabic":"المصاريف","IsActive":true,"CostCenters":[{"Name":"Cost of ods Sold","NameArabic":"تكلفه البضاعه المباعه","Description":"Cost of ods Sold","IsActive":true,"Code":"600001","Accounts":[{"Name":"Cost of ods Sold","NameArabic":"تكلفه البضاعه المباعه","Description":"Cost of ods Sold","IsActive":true,"Code":"60000101"}]},{"Name":"Freight Paid","NameArabic":"مدفوعات الشحن","Description":"Freight Paid","IsActive":true,"Code":"608001","Accounts":[{"Name":"Freight Paid","NameArabic":"مدفوعات الشحن","Description":"Freight Paid","IsActive":true,"Code":"60800101"}]},{"Name":"Discount Given","NameArabic":"الخصم المقدم","Description":"Discount Given","IsActive":true,"Code":"607001","Accounts":[{"Name":"Discount Given","NameArabic":"الخصم المقدم","Description":"Discount Given","IsActive":true,"Code":"60700101"}]},{"Name":"Depreciation Expense","NameArabic":"مصاريف الاستقدام","Description":"Depreciation Expense","IsActive":true,"Code":"606001","Accounts":[{"Name":"Depreciation Expense","NameArabic":"مصاريف الاستقدام","Description":"Depreciation Expense","IsActive":true,"Code":"60600101"}]},{"Name":"General Expenses","NameArabic":"المصاريف العامة","Description":"General Expenses","IsActive":true,"Code":"605050","Accounts":[{"Name":"General Expenses","NameArabic":"المصاريف العامة","Description":"General Expenses","IsActive":true,"Code":"60505001"}]},{"Name":"Payroll","NameArabic":"الرواتب","Description":"Payroll","IsActive":true,"Code":"603001","Accounts":[{"Name":"Payroll","NameArabic":"الرواتب","Description":"Payroll","IsActive":true,"Code":"60300101"}]},{"Name":"Utilities","NameArabic":"الخدمات","Description":"Utilities","IsActive":true,"Code":"604001","Accounts":[{"Name":"Utilities","NameArabic":"الخدمات","Description":"Utilities","IsActive":true,"Code":"60400101"}]},{"Name":"Rent","NameArabic":"ايجارات","Description":"Rent","IsActive":true,"Code":"604050","Accounts":[{"Name":"Rent","NameArabic":"ايجارات","Description":"Rent","IsActive":true,"Code":"60405001"}]},{"Name":"Legal Expenses","NameArabic":"المصاريف القانونيه","Description":"Legal Expenses","IsActive":true,"Code":"605001","Accounts":[{"Name":"Legal Expenses","NameArabic":"المصاريف القانونيه","Description":"Legal Expenses","IsActive":true,"Code":"60500101"}]}]}]}'
WHERE [Id] = 'ecfe29c8-c6af-4a3d-9c24-f87b30bf831c';
SELECT @@ROWCOUNT;




UPDATE [Companies] SET [CreatedDate] = '2021-11-25T07:36:10.2053683Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211125073612_COAinArabic', N'2.2.6-servicing-10079');



ALTER TABLE [InventoryBlindDetails] ADD [BusinessId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [InventoryBlindDetails] ADD [ClientId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [InventoryBlindDetails] ADD [CompanyId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



ALTER TABLE [InventoryBlindDetails] ADD [CounterId] uniqueidentifier NULL;



ALTER TABLE [InventoryBlindDetails] ADD [CreatedById] nvarchar(max) NULL;



ALTER TABLE [InventoryBlindDetails] ADD [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate());



ALTER TABLE [InventoryBlindDetails] ADD [DayId] uniqueidentifier NULL;



ALTER TABLE [InventoryBlindDetails] ADD [IsDeleted] bit NOT NULL DEFAULT 0;



ALTER TABLE [InventoryBlindDetails] ADD [ModifiedById] nvarchar(max) NULL;



ALTER TABLE [InventoryBlindDetails] ADD [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate());



ALTER TABLE [InventoryBlindDetails] ADD [UserId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';



CREATE TABLE [Logistics] (
    [Id] uniqueidentifier NOT NULL,
    [Code] nvarchar(max) NULL,
    [EnglishName] nvarchar(max) NULL,
    [ArabicName] nvarchar(max) NULL,
    [LicenseNo] nvarchar(max) NULL,
    [Address] nvarchar(500) NULL,
    [ContactNo] nvarchar(max) NULL,
    [Email] nvarchar(max) NULL,
    [Website] nvarchar(max) NULL,
    [TermsAndCondition] nvarchar(max) NULL,
    [Xcoordinates] nvarchar(max) NULL,
    [Ycoordinates] nvarchar(max) NULL,
    [Ports] int NOT NULL,
    [ServiceFor] nvarchar(max) NULL,
    [ClearanceAgent] uniqueidentifier NULL,
    [LogisticsForm] int NOT NULL,
    [IsActive] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [IsDeleted] bit NOT NULL,
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_Logistics] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Logistics_Accounts_ClearanceAgent] FOREIGN KEY ([ClearanceAgent]) REFERENCES [Accounts] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Logistics_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-11-29T07:01:27.3623205Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_InventoryBlindDetails_CompanyId] ON [InventoryBlindDetails] ([CompanyId]);



CREATE INDEX [IX_Logistics_ClearanceAgent] ON [Logistics] ([ClearanceAgent]);



CREATE INDEX [IX_Logistics_CompanyId] ON [Logistics] ([CompanyId]);



ALTER TABLE [InventoryBlindDetails] ADD CONSTRAINT [FK_InventoryBlindDetails_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211129070129_LogisticsInformation', N'2.2.6-servicing-10079');



ALTER TABLE [SaleOrders] ADD [ClientPurchaseNo] nvarchar(max) NULL;



ALTER TABLE [SaleOrders] ADD [IsQuotation] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-11-29T07:04:21.5529455Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211129070423_quotaion-check-in-saleorder', N'2.2.6-servicing-10079');



ALTER TABLE [SaleOrders] ADD [QuotationId] uniqueidentifier NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-11-29T10:43:29.2951527Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211129104331_quotaion-in-saleinvoice', N'2.2.6-servicing-10079');



ALTER TABLE [Companies] ADD [SaleOrder] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-11-29T13:06:15.8325703Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211129130618_saleOrder-check-in-company', N'2.2.6-servicing-10079');



DELETE FROM [NobleModules]
WHERE [Id] = 'f172d244-fef6-4cb0-826e-55778f3e196f';
SELECT @@ROWCOUNT;




UPDATE [Companies] SET [CreatedDate] = '2021-11-30T03:36:29.7837985Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ArabicName', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] ON;
INSERT INTO [NobleModules] ([Id], [ArabicName], [BusinessType], [Description], [ModuleName])
VALUES ('e8217e77-786c-4e37-8fc1-d800a55d8fa9', NULL, 0, N'Super Product', N'Super Product'),
('eb023060-25b5-4cf3-9850-b9a27dd82b8f', NULL, 0, N'Sale Return', N'Sale Return'),
('59d41cda-8b68-46d5-b46f-aa0ae6592fab', NULL, 0, N'Stock Transfer', N'Stock Transfer'),
('a1c6ae96-a6b5-4a2b-b803-e688a7ecaa2c', NULL, 0, N'Stock Out', N'Stock Out'),
('5930455b-f54d-4c62-aae4-510cf844e3c9', NULL, 0, N'Stock In', N'Stock In'),
('fe448d69-e152-4d03-a68d-7e7d21420a74', NULL, 0, N'Purchase Return', N'Purchase Return'),
('daa49ef1-b2b3-4098-9a31-b5c0e501b1d0', NULL, 0, N'Stock Return', N'Stock Return'),
('f9ceab2b-9eb3-4da1-bd35-49fe51375faf', NULL, 0, N'Petty Cash', N'Petty Cash'),
('bc9c5967-19b3-460e-ace7-77229907e1e3', NULL, 0, N'Opening Cash', N'Opening Cash'),
('8d800a27-2c0d-4d8c-b530-44cf83a8b7c8', NULL, 0, N'Bank Receipt', N'Bank Receipt'),
('134a06ea-9447-4ea1-982e-2b688ca243d0', NULL, 0, N'Cash Pay', N'Cash Pay'),
('27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a', NULL, 0, N'Cash Receipt', N'Cash Receipt'),
('e328e825-8d13-4ccf-83ba-3ed0b2560e42', NULL, 0, N'Purchase Invoice as Post', N'Purchase Invoice as Post');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ArabicName', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES ('daeeb948-fc4f-44ee-9747-23edc3918b9c', N'Touch Invoice', N'Can Void  Touch Invoice', 'c82f8189-5419-4268-a5b8-8a527e62e3a8'),
('21de1004-5a7b-4d6c-b21a-8775d023ef88', N'Expense', N'Can Void Daily Expense', 'cfcf2315-0697-401c-a5bb-38c8aaced1e1'),
('da645710-8dad-47f6-b602-b7be96103033', N'Product', N'Can View Updated Inventory Count List', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('67d24ed6-9003-44ec-b2f4-787585afd4e8', N'Product', N'Add Inventory Count', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('77392a41-fb96-409c-8852-0a27b76f3fb3', N'Product', N'Can View Inventory Count List', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('16df871a-5635-451d-a9bd-8756c3a2ec50', N'Product', N'Can Import Products', 'ca3978f8-9aa3-49a3-95da-7bb35be89289'),
('dd8a4f4e-6b6c-49e3-9c98-a6a05616f531', N'Sale Invoice', N'Can Void  Sale Invoice', 'fdd1a2ee-6792-4db2-9a05-f9377175470c'),
('a7cdee78-22cc-4764-8b4f-33b849423114', N'Bank Pay', N'Can Bulk Reject Bank Pay', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('9b7912bb-390f-4993-a35e-fdfd8af9903f', N'Stock Out', N'Can Void Stock Out ', '7600596a-7cad-4514-91f3-21fe30628593'),
('21505cb9-7791-4583-8cf4-e574f051bc4b', N'Stock In', N'Can Void Stock In ', '7600596a-7cad-4514-91f3-21fe30628593'),
('1b106f55-3e86-4c18-b146-285c9207bd88', N'Stock In', N'Can import Stock In Product', '7600596a-7cad-4514-91f3-21fe30628593'),
('c4e89441-577f-4820-955d-1805b7333c16', N'Bank Pay', N'Can Void Bank Pay', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('6f9de553-985f-49c8-a12d-6304757b9fd4', N'Bank Pay', N'Can Bulk Post Bank Pay', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('85a3c9b8-7e86-4a26-8a7c-1910c186144b', N'System', N'Pull Record of Database', '0a00c448-c2ba-4ee4-972d-9352bc6175b8'),
('00a03a14-4cc3-4a50-90f9-2d128c054241', N'Bank Pay', N'Can Reject Bank Pay', '29aac720-971b-43ef-9f02-9c60cd4e168b'),
('7e45912d-f341-4466-b00e-7ae1eba45593', N'Stock Transfer', N'Can Void  Stock Transfer', '7600596a-7cad-4514-91f3-21fe30628593'),
('6c5e1875-1b3f-410c-825c-9349d07a85a5', N'System', N'Push Record of Database', '0a00c448-c2ba-4ee4-972d-9352bc6175b8');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



UPDATE [NoblePermissions] SET [NobleModuleId] = 'e328e825-8d13-4ccf-83ba-3ed0b2560e42'
WHERE [Id] = '02651eb3-3f41-4c78-8d3b-92c8e401c37c';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'
WHERE [Id] = '053493a2-5755-4e07-bc3b-30942f506b92';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'
WHERE [Id] = '073faf36-caaa-4d70-876a-aff78e5a6530';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'a1c6ae96-a6b5-4a2b-b803-e688a7ecaa2c'
WHERE [Id] = '091991aa-37ce-467a-9ef4-e9358a201d2a';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '8d800a27-2c0d-4d8c-b530-44cf83a8b7c8'
WHERE [Id] = '0e469f66-b4fd-4627-8590-0761ad978259';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '5930455b-f54d-4c62-aae4-510cf844e3c9'
WHERE [Id] = '11b73791-0e85-4edc-8089-260d79579a8d';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'
WHERE [Id] = '155a03af-ebbd-4260-b010-2ed20d7cfd63';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'eb023060-25b5-4cf3-9850-b9a27dd82b8f'
WHERE [Id] = '161b2ed5-2702-4c34-bbf5-9f49dbdafab4';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'fe448d69-e152-4d03-a68d-7e7d21420a74'
WHERE [Id] = '2d116856-8144-43a8-8297-633c6e1fa69a';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '134a06ea-9447-4ea1-982e-2b688ca243d0'
WHERE [Id] = '31bc4a88-10a6-493a-8fcb-5c2c6100d7ef';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'e328e825-8d13-4ccf-83ba-3ed0b2560e42'
WHERE [Id] = '36bdc1cd-de83-4443-871a-07782e048499';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '59d41cda-8b68-46d5-b46f-aa0ae6592fab'
WHERE [Id] = '379354e8-36ab-47d7-b023-4cea93a133eb';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'
WHERE [Id] = '3f145b00-bb89-4a5f-9cb8-babb540803db';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '5930455b-f54d-4c62-aae4-510cf844e3c9'
WHERE [Id] = '508d3cb2-a1f7-4940-91ea-55fa3ca60567';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'eb023060-25b5-4cf3-9850-b9a27dd82b8f'
WHERE [Id] = '5127c542-4bf8-4029-80c4-2b2149864152';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '8d800a27-2c0d-4d8c-b530-44cf83a8b7c8'
WHERE [Id] = '53a5207a-2e57-4636-80b6-e1e0b9390b6f';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '134a06ea-9447-4ea1-982e-2b688ca243d0'
WHERE [Id] = '5f290a32-02f2-4893-947d-dfa81b83f8cd';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '8d800a27-2c0d-4d8c-b530-44cf83a8b7c8'
WHERE [Id] = '6143bb33-1034-448e-8433-e50f39f83360';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'eb023060-25b5-4cf3-9850-b9a27dd82b8f'
WHERE [Id] = '637a753d-5f9f-490f-8f26-cf2060972f2b';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'fe448d69-e152-4d03-a68d-7e7d21420a74'
WHERE [Id] = '66b335a9-85cb-45f8-8a40-8de42a214d48';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'daa49ef1-b2b3-4098-9a31-b5c0e501b1d0'
WHERE [Id] = '855377c8-a74f-4542-acd0-8aa52ab7e7f5';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'eb023060-25b5-4cf3-9850-b9a27dd82b8f'
WHERE [Id] = '8821831a-f344-4455-8ee0-be85389e20dc';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'a1c6ae96-a6b5-4a2b-b803-e688a7ecaa2c'
WHERE [Id] = '8df1d3d9-358b-4062-9cd6-eff5efc7c5d3';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'
WHERE [Id] = '93449156-d2fc-4402-9e83-a168ba0fb4c3';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '5930455b-f54d-4c62-aae4-510cf844e3c9'
WHERE [Id] = '9593897e-63b0-4d35-bd8c-d5f6ad49ed73';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'daa49ef1-b2b3-4098-9a31-b5c0e501b1d0'
WHERE [Id] = 'a9008a7a-5c19-4ccd-97c7-42f9937529e1';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'a1c6ae96-a6b5-4a2b-b803-e688a7ecaa2c'
WHERE [Id] = 'abb53fbb-7c75-4c1c-b5e5-b9b148c81218';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'
WHERE [Id] = 'adde6b14-a937-4b3b-998d-350d01fd198b';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '5930455b-f54d-4c62-aae4-510cf844e3c9'
WHERE [Id] = 'af665ba5-4c02-45aa-ab00-cf533c037df2';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'
WHERE [Id] = 'c16c04d9-72e1-4bd6-8aec-f630d7b4a1f4';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'a1c6ae96-a6b5-4a2b-b803-e688a7ecaa2c'
WHERE [Id] = 'c546ee15-506d-444c-aefd-1c86231bc0c9';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '59d41cda-8b68-46d5-b46f-aa0ae6592fab'
WHERE [Id] = 'c9849a14-1b2c-4993-b50e-a6bc64f69095';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '59d41cda-8b68-46d5-b46f-aa0ae6592fab'
WHERE [Id] = 'cb9d0f1e-4b2e-4cdb-8d66-8dcb05fab5b9';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '134a06ea-9447-4ea1-982e-2b688ca243d0'
WHERE [Id] = 'd0a55259-37ff-4987-9a17-ec17b56107da';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '8d800a27-2c0d-4d8c-b530-44cf83a8b7c8'
WHERE [Id] = 'd0c71d2a-06cc-45e3-8d63-6302bd85019a';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '8d800a27-2c0d-4d8c-b530-44cf83a8b7c8'
WHERE [Id] = 'dadd482e-d6ea-466a-a32d-4a836070480e';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '8d800a27-2c0d-4d8c-b530-44cf83a8b7c8'
WHERE [Id] = 'dcb93d01-a317-446f-a51b-80cc065c9415';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'e328e825-8d13-4ccf-83ba-3ed0b2560e42'
WHERE [Id] = 'df4c05f4-afea-48cb-9b94-06aa7d04f1df';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'
WHERE [Id] = 'e09194b3-e355-4975-8247-c0170438e849';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '59d41cda-8b68-46d5-b46f-aa0ae6592fab'
WHERE [Id] = 'e1b98cfa-d450-4c36-818d-296e16082a3a';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'daa49ef1-b2b3-4098-9a31-b5c0e501b1d0'
WHERE [Id] = 'e303975e-5fb0-49dd-89dd-6550d9f796e4';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '8d800a27-2c0d-4d8c-b530-44cf83a8b7c8'
WHERE [Id] = 'e9dd831f-02ec-4b41-baf8-5a5d96a3450a';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'fe448d69-e152-4d03-a68d-7e7d21420a74'
WHERE [Id] = 'ee288fce-c3b4-45c6-9a98-68068ec3f5db';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'daa49ef1-b2b3-4098-9a31-b5c0e501b1d0'
WHERE [Id] = 'f10732d2-0f61-4676-b86c-3530be9eff17';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'e328e825-8d13-4ccf-83ba-3ed0b2560e42'
WHERE [Id] = 'f2a3751e-d8f9-49b3-95c9-0bc3116c11fc';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = 'fe448d69-e152-4d03-a68d-7e7d21420a74'
WHERE [Id] = 'f8dcbdf3-fe8b-4251-9672-9dfd2535e6e8';
SELECT @@ROWCOUNT;




UPDATE [NoblePermissions] SET [NobleModuleId] = '134a06ea-9447-4ea1-982e-2b688ca243d0'
WHERE [Id] = 'fafa3dee-7560-4713-a664-9877470e485b';
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES ('e66d99a3-92d3-4e85-a435-d427e024e057', N'Purchase Invoice as Post', N'Can Void Purchase Invoice', 'e328e825-8d13-4ccf-83ba-3ed0b2560e42'),
('655f9534-7685-40d1-a7fa-bd4a817f7317', N'Purchase Return', N'Can Void  Purchase Return', 'fe448d69-e152-4d03-a68d-7e7d21420a74'),
('5b5446ba-2274-4c23-bf1a-cec5bd014557', N'Super Product', N'Can Save Super Product', 'e8217e77-786c-4e37-8fc1-d800a55d8fa9'),
('9992ee2a-4686-473d-ba2f-e7a8cbcd1dcc', N'Sale Return', N'Can Void  Sale Return', 'eb023060-25b5-4cf3-9850-b9a27dd82b8f'),
('446231d8-667b-483f-8ceb-9b00b13b58ad', N'Super Product', N'Can Edit Super Product', 'e8217e77-786c-4e37-8fc1-d800a55d8fa9'),
('b70f468b-b540-4638-b05b-513ea6c31414', N'Stock Return', N'Can Void Stock Return', 'daa49ef1-b2b3-4098-9a31-b5c0e501b1d0'),
('ce5b3803-8506-4d67-8e1e-7b40308db7b3', N'Petty Cash', N'Can View Petty Cash as Draft', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('f35e55ae-5122-4c0a-b792-40d1794df0ad', N'Petty Cash', N'Can Bulk Reject Petty Cash', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('65798e08-466b-4385-8e9f-667b97fd2550', N'Cash Receipt', N'Can Reject Cash Receipt', '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'),
('4c70e79d-8f4d-429b-82fa-3593e90f1f8b', N'Cash Receipt', N'Can Bulk Reject Cash Receipt', '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'),
('3d295fd3-6e71-47a1-8ba9-af0ad840a4ca', N'Cash Receipt', N'Can Bulk Post Cash Receipt', '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'),
('39e11111-d914-407f-b5c6-3faabec8e049', N'Cash Receipt', N'Can Void Cash Receipt', '27f9aa66-5fde-49b3-a9d8-0a16e65d3f7a'),
('3eaa85dc-db63-45fc-98c8-1dee0bcb4d5e', N'Cash Pay', N'Can Reject Cash Pay', '134a06ea-9447-4ea1-982e-2b688ca243d0'),
('13993ed5-8adb-4253-bc48-932b4c9c02b3', N'Cash Pay', N'Can Bulk Reject Cash Pay', '134a06ea-9447-4ea1-982e-2b688ca243d0'),
('060956a5-c1d7-4a18-95d0-27b25880f2d8', N'Cash Pay', N'Can Bulk Post Cash Pay', '134a06ea-9447-4ea1-982e-2b688ca243d0'),
('f9a309a0-7ec5-4180-9bfe-87c4e6d03b9c', N'Cash Pay', N'Can Void Cash Pay', '134a06ea-9447-4ea1-982e-2b688ca243d0'),
('121dfea0-d3dc-4f6c-92eb-942a1961929c', N'Bank Receipt', N'Can Reject Bank Receipt', '8d800a27-2c0d-4d8c-b530-44cf83a8b7c8'),
('e63597ae-2c66-4378-a110-627d444a721b', N'Bank Receipt', N'Can Bulk Reject Bank Receipt', '8d800a27-2c0d-4d8c-b530-44cf83a8b7c8'),
('38b88d18-d6e6-4e97-9e79-045ef2e971fd', N'Bank Receipt', N'Can Bulk Post Bank Receipt', '8d800a27-2c0d-4d8c-b530-44cf83a8b7c8'),
('d6d6c184-762e-42c9-b11b-395245d599e4', N'Bank Receipt', N'Can Void Bank Receipt', '8d800a27-2c0d-4d8c-b530-44cf83a8b7c8'),
('b72de9f0-2571-4378-b855-b4c8218cccbb', N'Opening Cash', N'Can Save Opening Cash as Draft', 'bc9c5967-19b3-460e-ace7-77229907e1e3'),
('3b7fd3bd-43ff-40f3-af08-f71cea6942f3', N'Opening Cash', N'Can Edit  Opening Cash as Draft', 'bc9c5967-19b3-460e-ace7-77229907e1e3'),
('afea8ee7-482b-408c-9820-0e9e8d39b3de', N'Opening Cash', N'Can Delete  Opening Cash as Draft', 'bc9c5967-19b3-460e-ace7-77229907e1e3'),
('479f1176-3194-4dc5-b167-d08c78ae0a59', N'Opening Cash', N'Can View Opening Cash as Draft', 'bc9c5967-19b3-460e-ace7-77229907e1e3'),
('cb5c4ed6-889c-4c45-bab0-976367852964', N'Opening Cash', N'Can Save Opening Cash as Post', 'bc9c5967-19b3-460e-ace7-77229907e1e3'),
('020dcac7-b35a-4b72-8298-4f191d8f9a61', N'Petty Cash', N'Can Reject Petty Cash', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('7631bad7-72e7-44d4-a67c-735dfa462ba8', N'Petty Cash', N'Can Void Petty Cash', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('eaef4f9a-f788-44a5-893f-07650026de50', N'Petty Cash', N'Can View Petty Cash as Post', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('2a42d57c-5b2d-4672-b97f-2d8a1431aca4', N'Petty Cash', N'Can Delete  Petty Cash as Post', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('ef57786c-fb62-419b-abee-17476cb98384', N'Petty Cash', N'Can Edit  Petty Cash as Post', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('ec36441f-0f6a-4a3d-9363-88b8167a2e7a', N'Petty Cash', N'Can Save Petty Cash as Post', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('d1a81b53-64af-485a-8d81-442d7c447436', N'Petty Cash', N'Can Bulk Post Petty Cash', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('af16373f-e5d3-429f-9780-8935d9961846', N'Super Product', N'Can Delete Super Product', 'e8217e77-786c-4e37-8fc1-d800a55d8fa9'),
('0b67db30-940c-426f-b836-06bdeaa6bf3b', N'Petty Cash', N'Can Edit  Petty Cash as Draft', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('0d45f8f5-eef4-477c-b218-5f8a50c53f23', N'Petty Cash', N'Can Save Petty Cash as Draft', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('d333dd22-bd80-48cf-b5e1-d477b26a2c39', N'Opening Cash', N'Can Void Opening Cash', 'bc9c5967-19b3-460e-ace7-77229907e1e3'),
('d7e02612-0a24-4055-85f5-2870449b5376', N'Opening Cash', N'Can View Opening Cash as Post', 'bc9c5967-19b3-460e-ace7-77229907e1e3'),
('fd94fd5c-ab4c-4904-8507-cdce421a8717', N'Opening Cash', N'Can Delete  Opening Cash as Post', 'bc9c5967-19b3-460e-ace7-77229907e1e3'),
('6d1bbe01-c642-47ad-9adb-2745a8e377f4', N'Opening Cash', N'Can Edit  Opening Cash as Post', 'bc9c5967-19b3-460e-ace7-77229907e1e3'),
('60d0f8fa-cef0-4b4d-8a31-088a3592767f', N'Petty Cash', N'Can Delete  Petty Cash as Draft', 'f9ceab2b-9eb3-4da1-bd35-49fe51375faf'),
('4634ce35-db20-44a9-a2a0-23b2ba6c80e2', N'Super Product', N'Can View  Super Product', 'e8217e77-786c-4e37-8fc1-d800a55d8fa9');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211130033636_change-int-guid-remainig', N'2.2.6-servicing-10079');



ALTER TABLE [Products] ADD [Guarantee] bit NOT NULL DEFAULT 0;



ALTER TABLE [Products] ADD [Serial] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-11-30T07:33:11.2444857Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211130073313_serial-guarantee-in-product', N'2.2.6-servicing-10079');



DECLARE @var44 sysname;
SELECT @var44 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[InventoryBlindDetails]') AND [c].[name] = N'BusinessId');
IF @var44 IS NOT NULL EXEC(N'ALTER TABLE [InventoryBlindDetails] DROP CONSTRAINT [' + @var44 + '];');
ALTER TABLE [InventoryBlindDetails] DROP COLUMN [BusinessId];



DECLARE @var45 sysname;
SELECT @var45 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[InventoryBlindDetails]') AND [c].[name] = N'ClientId');
IF @var45 IS NOT NULL EXEC(N'ALTER TABLE [InventoryBlindDetails] DROP CONSTRAINT [' + @var45 + '];');
ALTER TABLE [InventoryBlindDetails] DROP COLUMN [ClientId];



DECLARE @var46 sysname;
SELECT @var46 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[InventoryBlindDetails]') AND [c].[name] = N'CounterId');
IF @var46 IS NOT NULL EXEC(N'ALTER TABLE [InventoryBlindDetails] DROP CONSTRAINT [' + @var46 + '];');
ALTER TABLE [InventoryBlindDetails] DROP COLUMN [CounterId];



DECLARE @var47 sysname;
SELECT @var47 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[InventoryBlindDetails]') AND [c].[name] = N'DayId');
IF @var47 IS NOT NULL EXEC(N'ALTER TABLE [InventoryBlindDetails] DROP CONSTRAINT [' + @var47 + '];');
ALTER TABLE [InventoryBlindDetails] DROP COLUMN [DayId];



DECLARE @var48 sysname;
SELECT @var48 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[InventoryBlindDetails]') AND [c].[name] = N'UserId');
IF @var48 IS NOT NULL EXEC(N'ALTER TABLE [InventoryBlindDetails] DROP CONSTRAINT [' + @var48 + '];');
ALTER TABLE [InventoryBlindDetails] DROP COLUMN [UserId];



ALTER TABLE [Logistics] ADD [ContactName] nvarchar(max) NULL;



UPDATE [Companies] SET [CreatedDate] = '2021-11-30T09:55:11.9373550Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211130095514_ContactNameInLogistic', N'2.2.6-servicing-10079');



DELETE FROM [NoblePermissions]
WHERE [Id] = '01471545-b55b-4820-9fa5-37a13da008b0';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '01b9e41d-c0dc-4065-9c04-fff087468616';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '0232b199-7c83-4199-bdc1-1e057d3678d3';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '06bff7fc-ecca-4305-886e-3d7aa5246bea';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '079f4f75-7b77-4339-bc73-fc3e40e36c8d';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '082de882-9836-4869-abb1-698e264ef6f4';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '0bf63044-8c7a-42c5-8764-bf795bb37447';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '0f3caa9a-07ba-4c5f-b4c5-e8ccb88ea421';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '1438f661-3dd7-42d4-a9e9-81fc1d8a0c54';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '1f093ea3-814d-4338-8aa5-6b25013d5878';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '2a2a3400-d8e4-4d85-83e8-adfa8d3e6428';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '2c57f8de-23f6-4fdf-a99e-a87cd6a48083';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '38c57c94-31a9-48c5-ab03-b20b6fe24ef5';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '38df78a2-2e02-448e-8458-70ae509d2a5e';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '3aecc007-62cc-4657-9cff-f26e6d91d3f4';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '3c707a3b-16ef-4d69-8b8d-2906cd97c1a8';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '40e034fd-00dd-4ea8-8ff2-f5ae34e7cb7b';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '452c8428-fa7c-421d-89d6-cd12e6fc8439';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '48a7e968-c394-48b3-97f3-ca170d69bf07';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '4ad20abc-4e2d-4cdf-a70d-863ae4ee5588';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '52b993b9-65ee-45ed-b044-9f488f05ea9e';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '53805cd0-480d-49e3-a792-040611c2776f';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '5441b964-256b-4722-b761-3844fbf33532';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '57282478-e239-45e6-bf8c-3b11a84f5a8c';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '589a7313-8b15-40d1-9863-8b23bcf5f387';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '5e2a63e0-2cd3-43e5-825a-0ce263be0765';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '604ff746-2bd5-4558-a6b0-ef5f49ccd9e8';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '62a3710d-f16f-4ce5-ab72-04b717e48890';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '63b07e2c-eab5-4cce-b838-d592553f8d06';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '63edf9d4-feb8-44f3-8fee-12022aff1e54';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '669ed81d-96bc-4ed6-a3e5-0f3f01954114';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '6c5a8310-4508-48da-9228-c81da9b4f84a';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '6d11941f-4efc-4184-891b-95d1bb486d98';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '6e045010-76d2-4261-8c0b-378d5252af49';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '6f4cc69e-937e-416a-819f-591f83867984';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '7441b264-1d06-4c56-a80a-b0272110273f';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '75ef2940-38d4-41f2-8de0-89cb8c216592';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '7e04d43e-aa36-404c-9633-288da5ae072e';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '7e17ff28-b433-4d27-bf29-51afd7709dd0';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '804b8823-c980-4b11-9d7d-3936469dfde6';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '91b7b87b-9c39-49c4-89b9-19c52cfcc592';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '949ad470-96e6-4a46-bbfd-5384457bc2dc';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '977102ef-9524-4ab8-a163-1fe4672348a8';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '98558d0d-8032-4b8d-b91b-d97936b9fdb1';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '998e1ae2-071c-4687-ba77-4db8b7786888';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '99af4d7b-731f-4456-8d03-37fc76682625';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = '9ba25565-c988-499a-8c7c-604cd3d0b5fc';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'a3ad316c-7d58-4466-9920-5d421699d9ef';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'aa96f625-5526-4cb8-b0d7-01fbcaed6f45';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'ab6c2caa-fe02-4b01-8ae3-639318a4f09a';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'ae1a7c13-daa5-4466-a8a8-544dcd2b76d1';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'b11a0c0c-934c-4e0b-b652-932c8c507c1f';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'b4fd3f41-684d-413b-98d8-bbbbdb8eb0a8';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'c19e11d3-977f-4a77-8b6e-b87b5769bb5e';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'c6c23136-17b8-4787-8f96-563389a204ab';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'cff3d9a2-b4ed-46f9-b0c1-080f0c6e0d4e';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'd0f5705e-9bef-405b-a925-56b833d5c029';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'd65035c8-8f9d-463f-b528-8160f1a02f38';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'd79afa05-039b-4f3b-8038-ed835e7123ed';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'df168358-99a7-41cf-bc2d-32dcd6b62d03';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'e14bc4e1-8d09-4a3e-8550-04bcc331af1c';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'e14fd3bb-1d4a-4878-90db-5a29b56e6500';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'e2092c9b-7051-485e-9002-e4bdfb987005';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'e72be317-8c29-4487-9382-a0cca1aed819';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'ed83e71c-4949-485c-84fb-fe8c01ca279a';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'f09f60e6-8ac3-444f-86d8-b4489a40ec7b';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'f0f8183b-6e0a-4a47-8ba3-a49200d5c564';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'f161d9bd-7db7-467e-a86d-7eb812bead04';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'f1e667a4-b7d4-4105-a232-eac63c804ccd';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'f466e424-e5ec-4a8f-9893-675a5a96e526';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'f70377ca-2e6c-435f-9025-23c1361579b6';
SELECT @@ROWCOUNT;




DELETE FROM [NoblePermissions]
WHERE [Id] = 'f75adbd1-53ea-4713-873b-a21d4eb2c658';
SELECT @@ROWCOUNT;




UPDATE [Companies] SET [CreatedDate] = '2021-12-01T08:05:06.5839872Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211201080509_remove-setup', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-12-01T08:09:48.7151383Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ArabicName', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] ON;
INSERT INTO [NobleModules] ([Id], [ArabicName], [BusinessType], [Description], [ModuleName])
VALUES ('f172d244-fef6-4cb0-826e-55778f3e196f', NULL, 0, N'Setup Form', N'Setup Form');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ArabicName', N'BusinessType', N'Description', N'ModuleName') AND [object_id] = OBJECT_ID(N'[NobleModules]'))
    SET IDENTITY_INSERT [NobleModules] OFF;



IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] ON;
INSERT INTO [NoblePermissions] ([Id], [Catery], [Description], [NobleModuleId])
VALUES ('91b7b87b-9c39-49c4-89b9-19c52cfcc592', N'Brand', N'Can Save Brand', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('0232b199-7c83-4199-bdc1-1e057d3678d3', N'Currency', N'Can View Currency', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('6d11941f-4efc-4184-891b-95d1bb486d98', N'Currency', N'Can Delete Currency', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f466e424-e5ec-4a8f-9893-675a5a96e526', N'Currency', N'Can Edit Currency', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('57282478-e239-45e6-bf8c-3b11a84f5a8c', N'Currency', N'Can Save Currency', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('40e034fd-00dd-4ea8-8ff2-f5ae34e7cb7b', N'Terminals', N'Can View Terminals', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('52b993b9-65ee-45ed-b044-9f488f05ea9e', N'Terminals', N'Can Delete Terminals', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('38df78a2-2e02-448e-8458-70ae509d2a5e', N'Monthly Cost', N'Can Save Monthly Cost', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('ab6c2caa-fe02-4b01-8ae3-639318a4f09a', N'Terminals', N'Can Edit Terminals', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('9ba25565-c988-499a-8c7c-604cd3d0b5fc', N'Payment Option', N'Can View Payment Option', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f0f8183b-6e0a-4a47-8ba3-a49200d5c564', N'Payment Option', N'Can Delete Payment Option', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('589a7313-8b15-40d1-9863-8b23bcf5f387', N'Payment Option', N'Can Edit Payment Option', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('48a7e968-c394-48b3-97f3-ca170d69bf07', N'Payment Option', N'Can Save Payment Option', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('3c707a3b-16ef-4d69-8b8d-2906cd97c1a8', N'Company Setup', N'Can View Company Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('01471545-b55b-4820-9fa5-37a13da008b0', N'Company Setup', N'Can Delete Company Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('01b9e41d-c0dc-4065-9c04-fff087468616', N'Terminals', N'Can Save Terminals', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('0f3caa9a-07ba-4c5f-b4c5-e8ccb88ea421', N'Company Setup', N'Can Edit Company Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('b4fd3f41-684d-413b-98d8-bbbbdb8eb0a8', N'Monthly Cost', N'Can Edit Monthly Cost', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f75adbd1-53ea-4713-873b-a21d4eb2c658', N'Monthly Cost', N'Can View Monthly Cost', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('d65035c8-8f9d-463f-b528-8160f1a02f38', N'Denomination Setup', N'Can Edit Denomination Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('5441b964-256b-4722-b761-3844fbf33532', N'Denomination Setup', N'Can Save Denomination Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('98558d0d-8032-4b8d-b91b-d97936b9fdb1', N'Can View Location Attachment', N'Can View Location Attachment', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('cff3d9a2-b4ed-46f9-b0c1-080f0c6e0d4e', N'View Dashboard', N'Can View Dashboard', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('949ad470-96e6-4a46-bbfd-5384457bc2dc', N'Permission', N'Can Change Profile', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('1438f661-3dd7-42d4-a9e9-81fc1d8a0c54', N'Permission', N'Can Update Permission', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('998e1ae2-071c-4687-ba77-4db8b7786888', N'Monthly Cost', N'Can Delete Monthly Cost', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('c19e11d3-977f-4a77-8b6e-b87b5769bb5e', N'Permission', N'Can Assign User', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('604ff746-2bd5-4558-a6b0-ef5f49ccd9e8', N'Role', N'Can View Role', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('aa96f625-5526-4cb8-b0d7-01fbcaed6f45', N'Role', N'Can Save Role', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('62a3710d-f16f-4ce5-ab72-04b717e48890', N'Size', N'Can View Size', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('0bf63044-8c7a-42c5-8764-bf795bb37447', N'Size', N'Can Delete Size', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('e14fd3bb-1d4a-4878-90db-5a29b56e6500', N'Size', N'Can Edit Size', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('99af4d7b-731f-4456-8d03-37fc76682625', N'Size', N'Can Save Size', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('7441b264-1d06-4c56-a80a-b0272110273f', N'Permission', N'Can View Permission', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('d0f5705e-9bef-405b-a925-56b833d5c029', N'Company Setup', N'Can Save Company Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('63edf9d4-feb8-44f3-8fee-12022aff1e54', N'Ware House', N'Can View Ware House', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('e2092c9b-7051-485e-9002-e4bdfb987005', N'Ware House', N'Can Delete Ware House', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('53805cd0-480d-49e3-a792-040611c2776f', N'Color', N'Can Delete Color', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('b11a0c0c-934c-4e0b-b652-932c8c507c1f', N'Color', N'Can Edit Color', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('df168358-99a7-41cf-bc2d-32dcd6b62d03', N'Color', N'Can Save Color', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('669ed81d-96bc-4ed6-a3e5-0f3f01954114', N'Catery', N'Can View Catery', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('4ad20abc-4e2d-4cdf-a70d-863ae4ee5588', N'Catery', N'Can Delete Catery', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('06bff7fc-ecca-4305-886e-3d7aa5246bea', N'Catery', N'Can Edit Catery', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('2c57f8de-23f6-4fdf-a99e-a87cd6a48083', N'Color', N'Can View Color', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('079f4f75-7b77-4339-bc73-fc3e40e36c8d', N'Catery', N'Can Save Catery', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f1e667a4-b7d4-4105-a232-eac63c804ccd', N'BarCode Printing', N'Can Delete BarCode Printing', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('6e045010-76d2-4261-8c0b-378d5252af49', N'BarCode Printing', N'Can Edit BarCode Printing', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('5e2a63e0-2cd3-43e5-825a-0ce263be0765', N'BarCode Printing', N'Can Save BarCode Printing', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('082de882-9836-4869-abb1-698e264ef6f4', N'Brand', N'Can View Brand', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('ed83e71c-4949-485c-84fb-fe8c01ca279a', N'Brand', N'Can Delete Brand', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('ae1a7c13-daa5-4466-a8a8-544dcd2b76d1', N'Brand', N'Can Edit Brand', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f161d9bd-7db7-467e-a86d-7eb812bead04', N'BarCode Printing', N'Can View BarCode Printing', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('452c8428-fa7c-421d-89d6-cd12e6fc8439', N'Origin', N'Can Save Origin', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('d79afa05-039b-4f3b-8038-ed835e7123ed', N'Origin', N'Can Edit Origin', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('e14bc4e1-8d09-4a3e-8550-04bcc331af1c', N'Origin', N'Can Delete Origin', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('804b8823-c980-4b11-9d7d-3936469dfde6', N'Ware House', N'Can Edit Ware House', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('75ef2940-38d4-41f2-8de0-89cb8c216592', N'Ware House', N'Can Save Ware House', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('7e17ff28-b433-4d27-bf29-51afd7709dd0', N'Unit', N'Can View Unit', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f09f60e6-8ac3-444f-86d8-b4489a40ec7b', N'Unit', N'Can Delete Unit', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('f70377ca-2e6c-435f-9025-23c1361579b6', N'Unit', N'Can Edit Unit', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('38c57c94-31a9-48c5-ab03-b20b6fe24ef5', N'Unit', N'Can Save Unit', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('63b07e2c-eab5-4cce-b838-d592553f8d06', N'Tax Rate', N'Can View Tax Rate', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('6c5a8310-4508-48da-9228-c81da9b4f84a', N'Tax Rate', N'Can Delete Tax Rate', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('2a2a3400-d8e4-4d85-83e8-adfa8d3e6428', N'Tax Rate', N'Can Edit Tax Rate', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('3aecc007-62cc-4657-9cff-f26e6d91d3f4', N'Tax Rate', N'Can Save Tax Rate', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('c6c23136-17b8-4787-8f96-563389a204ab', N'SubCateries', N'Can View SubCateries', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('7e04d43e-aa36-404c-9633-288da5ae072e', N'SubCateries', N'Can Delete SubCateries', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('977102ef-9524-4ab8-a163-1fe4672348a8', N'SubCateries', N'Can Edit SubCateries', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('e72be317-8c29-4487-9382-a0cca1aed819', N'SubCateries', N'Can Save SubCateries', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('1f093ea3-814d-4338-8aa5-6b25013d5878', N'Origin', N'Can View Origin', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('6f4cc69e-937e-416a-819f-591f83867984', N'Denomination Setup', N'Can Delete Denomination Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f'),
('a3ad316c-7d58-4466-9920-5d421699d9ef', N'Denomination Setup', N'Can View Denomination Setup', 'f172d244-fef6-4cb0-826e-55778f3e196f');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Catery', N'Description', N'NobleModuleId') AND [object_id] = OBJECT_ID(N'[NoblePermissions]'))
    SET IDENTITY_INSERT [NoblePermissions] OFF;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211201080951_setupform', N'2.2.6-servicing-10079');



ALTER TABLE [PurchasePostItems] ADD [GuaranteeDate] datetime2 NULL;



ALTER TABLE [PurchasePostItems] ADD [SerialNo] nvarchar(max) NULL;



ALTER TABLE [PurchaseOrderItems] ADD [GuaranteeDate] datetime2 NULL;



ALTER TABLE [PurchaseOrderItems] ADD [SerialNo] nvarchar(max) NULL;



ALTER TABLE [PurchaseItems] ADD [GuaranteeDate] datetime2 NULL;



ALTER TABLE [PurchaseItems] ADD [SerialNo] nvarchar(max) NULL;



CREATE TABLE [CompanyProcess] (
    [Id] uniqueidentifier NOT NULL,
    [ProcessNameArabic] nvarchar(max) NULL,
    [ProcessName] nvarchar(max) NULL,
    [Type] nvarchar(max) NULL,
    [Status] bit NOT NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_CompanyProcess] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CompanyProcess_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-12-02T07:49:46.0051731Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_CompanyProcess_CompanyId] ON [CompanyProcess] ([CompanyId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211202074947_company-process-db', N'2.2.6-servicing-10079');



CREATE TABLE [PurchaseOrderActions] (
    [Id] uniqueidentifier NOT NULL,
    [ProcessId] uniqueidentifier NOT NULL,
    [PurchaseOrderId] uniqueidentifier NULL,
    [Date] datetime2 NULL,
    [Description] nvarchar(max) NULL,
    [CompanyId] uniqueidentifier NOT NULL,
    [CreatedById] nvarchar(max) NULL,
    [CreatedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    [ModifiedById] nvarchar(max) NULL,
    [ModifiedOn] datetime2 NOT NULL DEFAULT (GetUtcDate()),
    CONSTRAINT [PK_PurchaseOrderActions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PurchaseOrderActions_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PurchaseOrderActions_PurchaseOrders_PurchaseOrderId] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [PurchaseOrders] ([Id]) ON DELETE NO ACTION
);



UPDATE [Companies] SET [CreatedDate] = '2021-12-02T09:00:30.2360101Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_PurchaseOrderActions_CompanyId] ON [PurchaseOrderActions] ([CompanyId]);



CREATE INDEX [IX_PurchaseOrderActions_PurchaseOrderId] ON [PurchaseOrderActions] ([PurchaseOrderId]);



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211202090032_PurchaseOrder-Action-Db', N'2.2.6-servicing-10079');



ALTER TABLE [PrintSettings] ADD [ArabicName] bit NOT NULL DEFAULT 0;



ALTER TABLE [PrintSettings] ADD [BlindPrint] bit NOT NULL DEFAULT 0;



ALTER TABLE [PrintSettings] ADD [CarName] bit NOT NULL DEFAULT 0;



ALTER TABLE [PrintSettings] ADD [CustomerAddress] bit NOT NULL DEFAULT 0;



ALTER TABLE [PrintSettings] ADD [CustomerNumber] bit NOT NULL DEFAULT 0;



ALTER TABLE [PrintSettings] ADD [CustomerTelephone] bit NOT NULL DEFAULT 0;



ALTER TABLE [PrintSettings] ADD [CustomerVat] bit NOT NULL DEFAULT 0;



ALTER TABLE [PrintSettings] ADD [EnglishName] bit NOT NULL DEFAULT 0;



ALTER TABLE [PrintSettings] ADD [ItemDescription] bit NOT NULL DEFAULT 0;



ALTER TABLE [PrintSettings] ADD [ItemPieceSize] bit NOT NULL DEFAULT 0;



ALTER TABLE [PrintSettings] ADD [ShowBankAccount] bit NOT NULL DEFAULT 0;



ALTER TABLE [PrintSettings] ADD [StyleNo] bit NOT NULL DEFAULT 0;



UPDATE [Companies] SET [CreatedDate] = '2021-12-02T12:04:48.0408144Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211202120450_ChangingInPrintSetting', N'2.2.6-servicing-10079');



UPDATE [Companies] SET [CreatedDate] = '2021-12-02T13:10:43.3231631Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




CREATE INDEX [IX_PurchaseOrderActions_ProcessId] ON [PurchaseOrderActions] ([ProcessId]);



ALTER TABLE [PurchaseOrderActions] ADD CONSTRAINT [FK_PurchaseOrderActions_CompanyProcess_ProcessId] FOREIGN KEY ([ProcessId]) REFERENCES [CompanyProcess] ([Id]) ON DELETE CASCADE;



INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211202131045_companyProcess-relation-with-purchaseorderaction', N'2.2.6-servicing-10079');



ALTER TABLE [PurchaseOrderActions] ADD [CurrentDate] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';



UPDATE [Companies] SET [CreatedDate] = '2021-12-02T13:53:05.1394667Z'
WHERE [Id] = '5f8d5614-2c7e-4ec0-868c-d254e6516b4d';
SELECT @@ROWCOUNT;




INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211202135307_date-in-PurchaseOrderAction', N'2.2.6-servicing-10079');



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



