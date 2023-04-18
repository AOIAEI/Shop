dbo.usp_MakeFamilyPurchase
CREATE PROCEDURE dbo.usp_MakeFamilyPurchase (@FamilySurName VARCHAR(255))
AS
BEGIN
    DECLARE @FamilyID INT
    SELECT @FamilyID = ID
    FROM dbo.Family
    WHERE SurName = @FamilySurName

    IF @FamilyID IS NULL
    BEGIN
        RAISERROR('Family does not exist', 16, 1)
        RETURN
    END

    UPDATE dbo.Family
    SET BudgetValue = BudgetValue - (SELECT SUM(Value) FROM dbo.Basket WHERE ID_Family = @FamilyID)
    WHERE ID = @FamilyID
END
;