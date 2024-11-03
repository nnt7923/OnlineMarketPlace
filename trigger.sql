CREATE TRIGGER trg_UpdateRoleOnAccount
ON [dbo].[Account]
AFTER UPDATE
AS
BEGIN
    -- Biến lưu account_id và role_id đã thay đổi
    DECLARE @account_id INT, @role_id INT;
    
    -- Lấy thông tin của account_id và role_id sau khi cập nhật
    SELECT @account_id = INSERTED.account_id, @role_id = INSERTED.role_id
    FROM INSERTED;

    -- Kiểm tra nếu role_id là 2 (seller)
    IF @role_id = 2
    BEGIN
        -- Thêm bản ghi vào bảng Seller nếu chưa có
        IF NOT EXISTS (SELECT 1 FROM [dbo].[Seller] WHERE [account_id] = @account_id)
        BEGIN
            INSERT INTO [dbo].[Seller] ([account_id], [store_name], [rating], [join_date])
            VALUES (@account_id, N'Default Store Name', 0.00, GETDATE());
        END

        -- Xóa bản ghi khỏi Customer nếu có
        DELETE FROM [dbo].[Customer] WHERE [account_id] = @account_id;
    END

    -- Kiểm tra nếu role_id là 3 (customer)
    IF @role_id = 3
    BEGIN
        -- Thêm bản ghi vào bảng Customer nếu chưa có
        IF NOT EXISTS (SELECT 1 FROM [dbo].[Customer] WHERE [account_id] = @account_id)
        BEGIN
            INSERT INTO [dbo].[Customer] ([account_id], [customer_name], [customer_type], [customer_dob], [customer_gender], [customer_images])
            VALUES (@account_id, N'Default Customer Name', N'normal', NULL, N'unknown', NULL);
        END

        -- Xóa bản ghi khỏi Seller nếu có
        DELETE FROM [dbo].[Seller] WHERE [account_id] = @account_id;
    END
END

ALTER TABLE ProductDetails
DROP CONSTRAINT FK_ProductDetails_Product;

ALTER TABLE ProductDetails
ADD CONSTRAINT FK_ProductDetails_Product FOREIGN KEY (product_id)
    REFERENCES Product(product_id) ON DELETE CASCADE;


CREATE TRIGGER trg_InsertCustomerOnAccount
ON [dbo].[Account]
AFTER INSERT
AS
BEGIN
    -- Disable trigger nesting and recursive calls
    SET NOCOUNT ON;

    -- Insert into Customer for newly created accounts with role_id = 3 (customer)
    INSERT INTO [dbo].[Customer] ([account_id], [customer_name], [customer_type], [customer_dob], [customer_gender], [customer_images])
    SELECT account_id, N'Default Customer Name', N'normal', NULL, N'unknown', NULL
    FROM INSERTED
    WHERE role_id = 3
      AND NOT EXISTS (SELECT 1 FROM [dbo].[Customer] WHERE [account_id] = INSERTED.account_id);
END


CREATE TRIGGER trg_InsertSellerOnAccount
ON [dbo].[Account]
AFTER INSERT
AS
BEGIN
    -- Disable trigger nesting and recursive calls
    SET NOCOUNT ON;

    -- Insert into Seller for newly created accounts with role_id = 2 (seller)
    INSERT INTO [dbo].[Seller] ([account_id], [store_name], [rating], [join_date])
    SELECT account_id, N'Default Store Name', 0.00, GETDATE()
    FROM INSERTED
    WHERE role_id = 2
      AND NOT EXISTS (SELECT 1 FROM [dbo].[Seller] WHERE [account_id] = INSERTED.account_id);
END



ALTER TABLE ProductDetails
DROP CONSTRAINT FK_ProductDetails_Product;

ALTER TABLE ProductDetails
ADD CONSTRAINT FK_ProductDetails_Product FOREIGN KEY (product_id)
    REFERENCES Product(product_id) ON DELETE CASCADE;


	ALTER TABLE Feedback
DROP CONSTRAINT FK_Feedback_Product;

ALTER TABLE Feedback
ADD CONSTRAINT FK_Feedback_Product
FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE;
ALTER TABLE OrderDetail
DROP CONSTRAINT FK_OrderDetail_ProductDetails;

ALTER TABLE OrderDetail
ADD CONSTRAINT FK_OrderDetail_ProductDetails
FOREIGN KEY (pd_id) REFERENCES ProductDetails(pd_id) ON DELETE CASCADE;
ALTER TABLE CartDetails
DROP CONSTRAINT FK_Cart_ProductDetail_ProductDetails;

ALTER TABLE CartDetails
ADD CONSTRAINT FK_Cart_ProductDetail_ProductDetails
FOREIGN KEY (pd_id) REFERENCES ProductDetails(pd_id) ON DELETE CASCADE;