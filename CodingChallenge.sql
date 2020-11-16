CREATE SCHEMA ChallengeDB;
GO

CREATE TABLE ChallengeDB.Customers (
	CustomerId INT NOT NULL PRIMARY KEY Identity,
	FirstName NVARCHAR(150) NOT NULL,
	LastName NVARCHAR(150) NOT NULL,
	CardNumber NVARCHAR(150) NOT NULL UNIQUE

);

CREATE TABLE ChallengeDB.Products (
	ProductId INT NOT NULL PRIMARY KEY IDENTITY,
	Name NVARCHAR(150) NOT NULL,
	Price DECIMAL NOT NULL CHECK (Price > 0)
);

CREATE TABLE ChallengeDB.Orders (
	OrderId INT NOT NULL PRIMARY KEY IDENTITY,
	ProductId INT NOT NULL
		FOREIGN KEY REFERENCES ChallengeDB.Products (ProductId) ON DELETE CASCADE ON UPDATE CASCADE,
	CustomerId INT NOT NULL
		FOREIGN KEY REFERENCES ChallengeDB.Customers (CustomerId) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO ChallengeDB.Customers (FirstName, LastName, CardNumber) VALUES
	('Luke', 'Fisher', '930125667'),
	('Carson', 'Wentz', '665777489' ),
	('Ashton', 'George', '987065132'),
	('Donald', 'Trump', '112324687');

INSERT INTO ChallengeDB.Products (Name, Price) VALUES
	('Dog', 300.50),
	('Cat', 250.50 ),
	('Bird', 275.34)

INSERT INTO ChallengeDB.Orders (CustomerId, ProductId) VALUES
	((SELECT CustomerId FROM ChallengeDB.Customers WHERE FirstName  = 'Luke'), (SELECT ProductId FROM ChallengeDB.Products WHERE Name = 'Dog')),
	((SELECT CustomerId FROM ChallengeDB.Customers WHERE FirstName  = 'Donald'), (SELECT ProductId FROM ChallengeDB.Products WHERE Name = 'Cat')),
	((SELECT CustomerId FROM ChallengeDB.Customers WHERE FirstName  = 'Ashton'), (SELECT ProductId FROM ChallengeDB.Products WHERE Name = 'Bird'))

INSERT INTO ChallengeDB.Products(Name, Price) VALUES
	('iPhone', 200)

INSERT INTO ChallengeDB.Customers (FirstName, LastName, CardNumber) VALUES
	('Tina', 'Smith', '897534789')

INSERT INTO ChallengeDB.Orders (CustomerId, ProductId) VALUES
	((SELECT CustomerId FROM ChallengeDB.Customers WHERE FirstName  = 'Tina'), (SELECT ProductId FROM ChallengeDB.Products WHERE Name = 'iPhone'))

SELECT * FROM ChallengeDB.Orders WHERE (CustomerId = 5) 

SELECT SUM(Price) FROM ChallengeDB.Orders 
	INNER JOIN ChallengeDB.Products ON 
	Orders.ProductId = Products.ProductId
	WHERE Name = 'iPhone'

UPDATE ChallengeDB.Products
SET Price = 250
WHERE Name = 'iPhone'

SELECT * FROM ChallengeDB.Products