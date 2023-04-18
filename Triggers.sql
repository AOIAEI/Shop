dbo.TR_Basket_insert_update
CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT, UPDATE
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted WHERE ID_SKU = (SELECT ID_SKU FROM inserted GROUP BY ID_SKU HAVING COUNT(*) >= 2)) >= 2
    BEGIN
        UPDATE dbo.Basket
        SET DiscountValue = Value * 0.05
        FROM dbo.Basket
        INNER JOIN inserted ON dbo.Basket.ID = inserted.ID
        WHERE dbo.Basket.ID_SKU = inserted.ID_SKU
    END
    ELSE
    BEGIN
        UPDATE dbo.Basket
        SET DiscountValue = 0
        FROM dbo.Basket
        INNER JOIN inserted ON dbo.Basket.ID = inserted.ID
        WHERE dbo.Basket.ID_SKU = inserted.ID_SKU
    END
END
;