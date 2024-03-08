use [arch]

create table [dbo].[Size](
	[Id] int primary key Identity(1,1),
	[Name] nvarchar(200) not null,
	[SmallName] varchar(100),
	[CreatedAt] datetime ,
	[CraetedBy] int not null,
	[LastModifiedAt] datetime default getdate(),
	[DeletedAt] datetime,
	[DeletedBy] int


)

create table [dbo].[Colors](
	[Id] int primary key Identity(1,1),
	[Name] nvarchar(200) not null,
	[HexCode] nvarchar(100) not null,
	[CreatedAt] datetime ,
	[CraetedBy] int not null,
	[LastModifiedAt] datetime default getdate(),
	[DeletedAt] datetime,
	[DeletedBy] int
)

create table [dbo].[Products](
	[Id] int primary key Identity(1,1),
	[Name] nvarchar(200) not null,
	[Products] nvarchar(200) not null,
	[Slug] nvarchar(200),
	[StockKeepingUnit] nvarchar(200),
	[ShortDescription] nvarchar(200),
	[Description] nvarchar(200),
	[Rate] float,
	[CategoryId] int not null,
	[BrandId] int not null,
	[CreatedAt] datetime ,
	[CraetedBy] int not null,
	[LastModifiedAt] datetime default getdate(),
	[DeletedAt] datetime,
	[DeletedBy] int
)


create table [dbo].[SpecificationValues](
	[SpecificationId] int,
	[ProductId] int ,
	[Value] nvarchar(200)
)
add constraint PK_SpecificationValues primary key ([SpecificationId],[ProductId])

create table [dbo].[ProductImages](
	[Id] int primary key Identity(1,1),
	[Name] nvarchar (200) not null,
	[ProductId] int not null
)
create table [dbo].[Categories](
	[Id] int primary key Identity(1,1),
	[ParentId] int not null,
	[Name] nvarchar(200) not null,
	[CreatedAt] datetime ,
	[CraetedBy] int not null,
	[LastModifiedAt] datetime default getdate(),
	[DeletedAt] datetime,
	[DeletedBy] int
)
create table [dbo].[Specifications](
	[Id] int primary key Identity(1,1),
	[Name] nvarchar(200) not null,
	[CreatedAt] datetime ,
	[CraetedBy] int not null,
	[LastModifiedAt] datetime default getdate(),
	[DeletedAt] datetime,
	[DeletedBy] int
)

create table [dbo].[BlogPosts](
	[Id] int primary key Identity(1,1),
	[Title] nvarchar(200) not null,
	[Slug] nvarchar(200),
	[Body] varchar(100),
	[ImagePath] varchar(100),
	[CategoryId] int not null,
	[PublishedBy] int not null,
	[PublishedAt] datetime,
	[CreatedAt] datetime ,
	[CraetedBy] int not null,
	[LastModifiedAt] datetime default getdate(),
	[DeletedAt] datetime,
	[DeletedBy] int
)

alter table [dbo].[Products]
add constraint FK_Products_Brands FOREIGN KEY([BrandId]) REFERENCES  [dbo].[Brands]([Id])

alter table [dbo].[Products]
add constraint FK_Products_Categories FOREIGN KEY([CategoryId]) REFERENCES [dbo].[Categories]([Id])

alter table [dbo].[ProductImages]
add constraint FK_ProductImages_Products FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products]([Id])

alter table [dbo].[SpecificationValues]
add constraint FK_SpecificationValues_Products FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products]([Id])

alter table [dbo].[SpecificationValues]
add constraint FK_SpecificationValues_Specifications FOREIGN KEY ([SpecificationId]) REFERENCES [dbo].[Specifications]([Id])

alter table [dbo].[BlogPosts]
add constraint FK_BlogPosts_Categories FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories]([Id])

alter table [dbo].[Categories]
add constraints FK_Categories FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Categories]([Id])