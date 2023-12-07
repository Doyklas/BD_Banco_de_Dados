-- AULA SOBRE STORED PROCEDURES
-- 1. Crie uma stored procedure que retorne todos os usuários 
-- que são compradores.

DELIMITER $$ -- FUNCIONA APENAS PARA A ESTRUTURA DA PROCEDURE
CREATE PROCEDURE getBuyers()

BEGIN 
	SELECT * FROM users
    WHERE pk_userid IN (SELECT pk_userid FROM buyer);
END$$
DELIMITER ;

-- criar uma procedure para retornar todos usuarios sellers
DELIMITER $$ -- FUNCIONA APENAS PARA A ESTRUTURA DA PROCEDURE
CREATE PROCEDURE getSellers()

BEGIN 
	SELECT * FROM users
    WHERE pk_userid IN (SELECT pk_userid FROM seller);
END$$
DELIMITER ;
--
DELIMITER $$ -- FUNCIONA APENAS PARA A ESTRUTURA DA PROCEDURE
CREATE PROCEDURE getAllSellers()

BEGIN 
	SELECT * FROM users
    WHERE pk_userid IN (SELECT pk_userid FROM seller);
END$$
DELIMITER ;

-- criar uma procedure para rtornar a quantidade de produtos pr marca

-- 2. Crie uma stored procedure que insira um novo produto na tabela Product.
-- IN entrada OUT saida
-- drop PROCEDURE insertProduct;
DELIMITER $$
CREATE PROCEDURE insertProduct(
	IN p_pk_pid			INT,
	IN p_fk_sid 		INT,
    IN p_fk_brand		VARCHAR(100),
    IN p_name			VARCHAR(100),
    IN p_type			VARCHAR(50),
    IN p_modelNumber	VARCHAR(50),
    IN p_color			VARCHAR(50),
    IN p_amount 		INT,
    IN p_price 			INT
)

BEGIN 
	INSERT INTO product (pk_pid, fk_sid, fk_brand, name, type, modelNumber, color, amount, price)
	VALUES  (p_pk_pid, p_fk_sid, p_fk_brand, p_name, p_type, p_modelNumber, p_color, p_amount, p_price);
END$$
select * from product;

-- 3. Crie uma stored procedure que atualize a quantidade de um produto com base no seu ID
DELIMITER $$
-- DROP PROCEDURE if EXISTS updateProductAmount;
CREATE PROCEDURE updateProductAmount(
	IN p_pk_pid			INT,
    IN p_NewAmount 		INT
   
)
BEGIN 
	UPDATE Product
    SET amount = p_NewAmount
    WHERE pk_pid = p_pk_pid;
END$$

-- 4. Crie uma stored procedure que retorne o total de vendas para uma loja específica.
DELIMITER $$
-- DROP PROCEDURE if EXISTS name;
DROP PROCEDURE if EXISTS totalVendas;
CREATE PROCEDURE totalVendas(
	IN p_fk_sid			INT,
    OUT p_totalVendas	INT
)
BEGIN 
	SELECT SUM(oi.price) INTO p_totalVendas
    FROM orderItem as oi
    JOIN product p ON p.pk_pid = oi.fk_pid
    WHERE p.fk_sid = p_fk_sid;
END$$
-- 5. Crie uma stored procedure que liste todos os produtos de uma determinada marca.
DELIMITER $$
-- DROP PROCEDURE if EXISTS name;
-- PROCEDURE if EXISTS produtoPorMarca;
CREATE PROCEDURE produtoPorMarca(
	IN p_brand VARCHAR(50)
)
BEGIN 
	SELECT * from product
    WHERE fk_brand = p_brand;
END$$
-- 6. Crie uma stored procedure que insira um novo comentário de um comprador para um produto.
select * from comments;

DELIMITER $$
-- DROP PROCEDURE if EXISTS name;
CREATE PROCEDURE comentario(
	IN p_userid INT,
    IN p_pid	INT,
    IN p_grade	FLOAT,
    IN p_content varchar(500)
    
)
BEGIN 
	INSERT INTO COMMENTS (creationTime, fk_userid, fk_pid, grade, content)
    VALUES	(CURRENT_DATE,p_userid,p_pid,p_grade,p_content);
END$$
-- 7. Crie uma stored procedure que retorne todos os pedidos feitos por um comprador específico.

-- 8. Crie uma stored procedure que cancele um pedido com base no número do pedido.
DELIMITER $$
-- DROP PROCEDURE if EXISTS name;
CREATE PROCEDURE cancelarOrdem(
	IN p_orderNumber INT
)
BEGIN 
	DELETE FROM orders
    WHERE pk_orderNumber = p_orderNumber;
END$$
-- 9. Crie uma stored procedure que retorne o total de itens em um pedido específico.

-- 10.Crie uma stored procedure que liste todos os produtos em estoque em uma determinada loja.

-- 11.Crie uma stored procedure que retorne o nome e a avaliação média de um produto específico.

-- 12.Crie uma stored procedure que atualize o número de pontos de serviço de uma marca específica.

-- 13.Crie uma stored procedure que liste todos os pedidos feitos com um determinado cartão de crédito.

-- 14.Crie uma stored procedure que retorne o endereço de entrega de um pedido específico.

-- 15.Crie uma stored procedure que retorne o nome e a quantidade 
-- total de produtos de uma determinada marca em todas as lojas