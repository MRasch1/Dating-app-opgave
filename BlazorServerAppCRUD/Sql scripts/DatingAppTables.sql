USE DatingAppDB
GO
create table [Users]
(
	Id int primary key identity(1,1),
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Email nvarchar(50) not null,
	[Login] nvarchar(50) not null,
	[Password] nvarchar(50) not null,
	[Password2] nvarchar(50) not null, 
	CreateDate datetime not null default getdate(),
	DeleteDate datetime null
)
GO
create table Gender
(
	Id int primary key identity(1,1),
	GenderName nvarchar(50) not null unique,
	Elaborate nvarchar(100) null
)
GO
create table City
(
	Id int primary key not null,
	CityName nvarchar(50) not null unique
)
GO
create table UserProfile
(
	Id int primary key identity(1,1),
	UserName nvarchar(50) unique not null,
	BirthDate datetime not null,
	Height int not null default 0,
	AboutMe nvarchar(255), 
	CityId int foreign key references City(Id),
	GenderId int foreign key references Gender(Id),
	UsersId int foreign key references Users(Id),
	check (BirthDate <= dateadd(year, -18, getdate()))
)
GO
create table ProfilePictures
(
	Id int primary key identity(1,1),
	Title nvarchar(50) not null,
	PicURL nvarchar(100) not null,
	UserProfileId int foreign key references UserProfile(Id)
)
GO
create table Likes
(
	Id int primary key identity(1,1),
	Liker int foreign key references UserProfile(Id) not null,
	Likee int foreign key references UserProfile(Id) not null,
	[Status] int not null default 0,
)
GO
create table [Messages]
(
	Id int primary key identity(1,1),
	Sender int foreign key references UserProfile(Id) not null,
	Receiver int foreign key references UserProfile(Id) not null,
	[Status] int not null default 0,
	Msg nvarchar(255) null
)
GO
create table [OldMessages]
(
	Id int primary key not null,
	Sender int not null,
	Receiver int not null,
	[Status] int not null,
	Msg nvarchar(255) null
)
GO