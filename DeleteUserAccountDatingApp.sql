--USE DatingAppDB
--GO
--CREATE PROC CreateUserAccount @Id int, @FirstName nvarchar(50), @LastName nvarchar(50), @Email nvarchar(50), @Login nvarchar(50), @Password nvarchar(50), @Password2 nvarchar(50), @CreateDate datetime, @DeleteDate datetime
--AS
--BEGIN
--INSERT INTO Users(FirstName, LastName, Email, [Login], [Password], [Password2], CreateDate, DeleteDate)
--VALUES(@FirstName, @LastName, @Email, @Login, @Password, @Password2, @CreateDate, @DeleteDate)
--END
USE DatingAppDB
GO
CREATE PROC DeleteUserAccount @Id int, @Login nvarchar(50), @Password nvarchar(50)
AS
BEGIN
DELETE FROM [dbo].[Users] WHERE [Login] = @Login AND [Password] = @Password
END