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
select @a from product;
CALL totalVendas(8, @a);

-- 5
CALL produtoPorMarca("Dell");
select * from product;
-- 6
select * from comments;
CALL comentario(18, 6, 4.9,"Amei so nao dou 5 pela demora");

-- 8
select * from orders;
CALL cancelarOrdem(93042135);
