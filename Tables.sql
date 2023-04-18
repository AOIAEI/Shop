CREATE TABLE Family
(IDIdentity int NOT NULL 
   PRIMARY KEY,
SurName varchar(20),
BudgetValue varchar(20)
)
;
CREATE TABLE SKU
(IDIdentity int NOT NULL 
   PRIMARY KEY,
Code varchar(20),
Name varchar(20)
)
;
CREATE TABLE Bàsket
(IDIdentity int
NOT NULL 
PRIMARY KEY,
ID_SKU int
 FOREIGN KEY REFERENCES SKU(IDIdentity),
ID_Family int
 FOREIGN KEY REFERENCES Family(IDIdentity),
Quantity int,
Value int,
PurchaseDate datetime DEFAULT (getdate()),
DiscountValue int,
CONSTRAINT Basket CHECK (Quantity > 0 AND Value > 0)
)
;


