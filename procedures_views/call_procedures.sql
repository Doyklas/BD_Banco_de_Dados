-- Executando as Procedures

-- 1 GET BUYERS
CALL getBuyers();

--  2 INSERT PRODUCT
CALL insertProduct(9, 8, "Dell", "Notebook Dell Inspirion 8", "laptop", "104585461", "Blue", 25, 860);
SELECT * FROM product;

-- 3 UPDATE PRODUCT
CALL updateProductAmount(9, 19);
SELECT * FROM product;

-- 4 GET STORE TOTAL SALES
CALL getStoreTotalSales(8, @a);

SELECT @a FROM product;
SELECT * FROM product;
SELECT * FROM orderitem;

-- 5 GET PRODUT BY BRAND
CALL getProductByBrand("Dell");

-- 6 INSERT COMMENTS 
CALL insertComment(24, 7, 4.5, "AMEI 5 ESTRELAS");
SELECT * FROM comments;

-- 7 GET BUYER ORDERS
CALL getBuyerOrders();
SELECT * FROM orders;

-- 8 CANCEL ORDERS
CALL cancelOrder(87291231);
SELECT * FROM orders;

-- 9 GET ORDER TOTAL ITEMS
CALL getOrderTotalItems(87291231, @d);
SELECT @d FROM contain;

-- 10 GET STORE INVENTORY
CALL getStoreInventory(8);

-- 11 GET PRODUCT AVERAGE RATING
CALL getProductAverageRating(8, @d);
SELECT @d FROM comments;

-- 12 UPDATE SERVICE POINT
SELECT * FROM servicepoint;
CALL updateServicePoint("Dell",12);

-- 13 GET ORDERS BY CREDIT CARD
SELECT * FROM creditCard;
CALL getOrdersByCreditCard('4023 1231 3431 8623');

--  14 GET DELIVERY ADDRESS
SELECT * FROM deliver_to;
CALL getDeliveryAddress(87291231, @d);
SELECT @d FROM deliver_to;

-- 15 GET TOTAL PRODUCTS BY BRAND
SELECT * FROM product;
CALL getTotalProductsByBrand('Microsoft', @d);
SELECT @d FROM product;