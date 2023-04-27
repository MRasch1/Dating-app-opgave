USE DatingAppDB
GO
CREATE PROC CreateUserAccount @Id int, @FirstName nvarchar(50), @LastName nvarchar(50), @Email nvarchar(50), @Login nvarchar(50), @Password nvarchar(50), @Password2 nvarchar(50), @CreateDate datetime, @DeleteDate datetime
AS
BEGIN
INSERT INTO Users(FirstName, LastName, Email, [Login], [Password], [Password2], CreateDate, DeleteDate)
VALUES(@FirstName, @LastName, @Email, @Login, @Password, @Password2, @CreateDate, @DeleteDate)
END