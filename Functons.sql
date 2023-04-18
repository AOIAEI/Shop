
ALTER TABLE Bàsket 

PurchaseDate datetime DEFAULT (getdate()),
DiscountValue int,
CONSTRAINT Basket CHECK (Quantity > 0 AND Value > 0)

;


