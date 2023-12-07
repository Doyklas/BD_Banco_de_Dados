-- executando a procedure
-- 1 
CALL getBuyers();
CALL getSellers();
-- 2
CALL insertProduct(9,8,"Dell","Notebook Dell Inspirion 8","Laptop","104585461","Blue",25,879);
select * from product;
-- 3
CALL updateProductAmount(9, 19);
select * from product;
-- 4

