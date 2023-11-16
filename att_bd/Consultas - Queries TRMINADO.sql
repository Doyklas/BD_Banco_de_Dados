USE e_shop_connect;

-- 1. Selecione todos os nomes e números de telefone dos usuários.
SELECT 
	name, 
    phoneNumber 
FROM users;

-- 2. Liste os nomes dos compradores.
SELECT * FROM buyer;
SELECT name 
FROM users 
WHERE pk_userid 
IN (SELECT pk_userid FROM buyer);

-- 3. Liste os nomes dos vendedores.
SELECT * FROM seller;

SELECT name 
FROM users 
WHERE pk_userid 
IN (SELECT pk_userid FROM seller);

-- 4. Encontre todas as informações de cartão de crédito dos usuários.
SELECT * FROM bankCard AS b;
SELECT * FROM creditCard;

SELECT 
	b.pk_cardNumber,
    b.pk_cardNumber, 
    b.bank, 
    c.fk_userid, 
    c.organization
FROM bankCard AS b 
JOIN creditCard AS c ON b.pk_cardNumber = c.pk_cardNumber;

-- 5. Selecione os nomes dos produtos e seus preços.
SELECT 
	name, 
    price 
FROM product; 

-- 6. Liste todos os produtos de uma determinada marca (por exemplo, "Samsung").
SELECT * FROM product;
SELECT 
	name, 
    type, 
    color 
FROM product 
WHERE fk_brand = "Microsoft";

-- 7. Encontre o número de itens em cada pedido.
SELECT * FROM contain;
SELECT 
	pk_ordernumber AS Pedidos,
	SUM(quantity) AS Quantidade
FROM contain
GROUP BY pk_ordernumber;

-- 8. Calcule o total de vendas por loja.
SELECT * FROM product;
SELECT * FROM orderItem;
SELECT * FROM store;

SELECT 
	s.name AS loja,
    SUM(o.price) AS valor_total
FROM store AS s -- o join junta a tabela store com a tabela product
JOIN product AS p ON s.pk_sid = p.fk_sid -- o AS cria um nome temporario para a tabela
JOIN orderItem AS o ON p.pk_pid = o.fk_pid
GROUP BY loja;

-- 9. Liste as avaliações dos produtos (grade) com seus nomes e conteúdo de usuário.
SELECT * FROM comments;
SELECT * FROM product;

SELECT 
	p.name AS nome,
	c.grade AS avaliacao,
    c.content AS conteudo
FROM product AS p
JOIN comments AS c ON p.pk_pid = c.fk_pid;

-- 10.Selecione os nomes dos compradores que fizeram pedidos.
SELECT * FROM orders;
SELECT * FROM buyer;
SELECT * FROM users;

SELECT name 
FROM users
WHERE pk_userid IN
	(SELECT fk_userid -- Descobrir o número do cartão dos usuarios
	FROM creditcard
	WHERE pk_cardNumber IN
		-- Criação de subqueries
		(SELECT fk_cardNumber
		FROM payment
		WHERE fk_orderNumber IN (SELECT pk_orderNumber FROM orders) ) );
        
-- 11.Encontre os vendedores que gerenciam várias lojas.
SELECT
	u.name,
    COUNT(m.fk_sid) AS total -- contar quantas lojas cada pessoa gerencia
FROM users u
INNER JOIN seller s ON u.pk_userid = s.pk_userid
INNER JOIN manage AS m ON s.pk_userid = m.fk_userid
GROUP BY u.name -- faz agrupamento
HAVING total > 1;

SELECT 
	sl.pk_userid,
    s.name AS loja
FROM seller AS sl
JOIN manage AS m ON sl.pk_userid = m.fk_userid
JOIN store AS s ON s.pk_sid = m.fk_sid;

-- 12.Liste os nomes das lojas que oferecem produtos de uma determinada marca (por exemplo, "Apple").
SELECT * FROM store;
SELECT * FROM product;

-- Solução professor
SELECT 
    DISTINCT s.name,
    	s.pk_sid
FROM store s
JOIN product p ON s.pk_sid = p.fk_sid
WHERE p.fk_brand = "Microsoft";

-- 13.Encontre as informações de entrega de um pedido específico (por exemplo, orderNumber = 123).
SELECT * FROM address;
SELECT * FROM orders;

SELECT 
	o.pk_orderNumber,
    a.name AS NOME,
	a.streetAddr AS RUA,
    a.contactPhoneNumber AS TELEFONE,
    a.city AS CIDADE,
    a.postCode AS CEP
FROM orders o
INNER JOIN deliver_to d ON o.pk_orderNumber = d.fk_orderNumber
INNER JOIN address a ON d.fk_addid = a.pk_addid
WHERE  pk_orderNumber = 12992012;

-- 14.Calcule o valor médio das compras dos compradores.
SELECT 
	AVG(totalAmount) AS media
FROM payment AS p
JOIN orders AS o ON o.pk_orderNumber = p.fk_orderNumber
GROUP BY o.totalAmount;

-- 15.Liste as marcas que têm pontos de serviço em uma determinada cidade(por exemplo, "Nova York").
SELECT * FROM servicepoint;
SELECT * FROM brand;

SELECT 
	b.pk_brandName 'Marcas'
FROM brand b
JOIN after_sales_service_at a ON a.fk_brandName = b.pk_brandName
JOIN servicepoint s ON s.pk_spid = a.fk_spid
WHERE city = "Quebec City";

-- 16.Encontre o nome e o endereço das lojas com uma classificação de cliente superior a 4.
SELECT * FROM store;

SELECT
	s.name Nome,
    s.streetaddr Endereço
FROM store AS s
WHERE customerGrade>4;

-- 17.Liste os produtos com estoque esgotado.
SELECT * FROM product;
SELECT * FROM orderitem;

SELECT 
		p.name 'Nomes dos produtos'
FROM product p
WHERE p.amount = 0;

-- 18.Encontre os produtos mais caros em cada marca.
SELECT * FROM product;
SELECT fk_brand FROM product;

SELECT
		p.name AS Produto,
		p.type AS Tipo,
        p.fk_brand AS Marca,
        p.price 'Preço Maximo'
FROM product AS p
WHERE (p.fk_brand, p.price) IN (
								SELECT p.fk_brand, MAX(p.price)
								FROM product p
								GROUP BY p.fk_brand);

-- 19.Calcule o total de pedidos em que um determinado cartão de crédito (por exemplo, cardNumber = 
-- '1234567890') foi usado.
SELECT 
		COUNT(p.fk_orderNumber) AS Pedidos,
        p.fk_cardNumber AS 'Cartão de crédito'
FROM payment p
JOIN creditCard c ON c.pk_cardNumber = p.fk_cardNumber
WHERE p.fk_cardNumber = '4902 9212 3402 8831'
GROUP BY p.fk_cardNumber;

-- 20.Liste os nomes e números de telefone dos usuários que não fizeram pedidos.
SELECT
		u.name Nome,
        u.phoneNumber Telefone
FROM users u 
WHERE u.pk_userid NOT IN (
	SELECT 
			u.pk_userid
	FROM users u 
    JOIN address a ON a.fk_userid = u.pk_userid
    JOIN deliver_to d ON a.pk_addid = d.fk_addid
    JOIN orders o ON o.pk_orderNumber = d.fk_orderNumber
);

-- 21.Liste os nomes dos produtos que foram revisados por compradores com uma classificação superior a 4.
SELECT 
		p.name 'Nomes dos produtos'
FROM product p
JOIN comments c ON p.pk_pid = c.fk_pid 
WHERE c.grade > 4;

-- 22.Encontre os nomes dos vendedores que não gerenciam nenhuma loja.
SELECT * FROM manage;
SELECT * FROM seller;

SELECT
	u.name Nomes
FROM users u
JOIN seller s ON u.pk_userid = s.pk_userid
WHERE s.pk_userid NOT IN(
	SELECT m.fk_userid
	FROM manage m
    );

-- 23.Liste os nomes dos compradores que fizeram pelo menos 3 pedidos.
SELECT
		u.name Nomes
FROM users u
JOIN buyer b ON b.pk_userid = u.pk_userid
JOIN address a ON u.pk_userid = a.fk_userid
JOIN deliver_to d ON a.pk_addid = d.fk_addid
WHERE d.fk_orderNumber > 3;

-- 24.Encontre o total de pedidos pagos com cartão de crédito versus cartão de débito.
SELECT
		COUNT(d.pk_cardNumber) Debito,
        COUNT(c.pk_cardNumber) Credito
FROM payment p
JOIN bankcard b ON b.pk_cardNumber = p.fk_cardNumber
LEFT JOIN creditcard c ON b.pk_cardNumber = c.pk_cardNumber
LEFT JOIN debitcard d ON b.pk_cardNumber = d.pk_cardNumber;

-- 25.Liste as marcas (brandName) que não têm produtos na loja com ID 1.
SELECT * FROM brand;
SELECT * FROM store;

SELECT
		b.pk_brandName 'Marcas'
FROM brand b
JOIN product p ON p.fk_brand = b.pk_brandName
JOIN store s ON s.pk_sid = p.fk_sid
WHERE s.pk_sid != 1;


-- 26.Calcule a quantidade média de produtos disponíveis em todas as lojas.
SELECT amount FROM product;

SELECT
		AVG(p.amount) 'Quantidade Média'
FROM product p
JOIN store s ON s.pk_sid = p.fk_sid;

-- 27.Encontre os nomes das lojas que não têm produtos em estoque (amount = 0).
SELECT 
		s.name 'Nome da loja'
FROM product p
JOIN store s ON s.pk_sid = p.fk_sid
WHERE p.amount = 0;

-- 28.Liste os nomes dos vendedores que gerenciam uma loja localizada em "São Paulo".
SELECT s.streetAddr FROM store s;

SELECT
	u.name Nomes
FROM users u
JOIN seller sl ON u.pk_userid = sl.pk_userid
JOIN manage m ON m.fk_userid = sl.pk_userid
JOIN store s ON s.pk_sid = m.fk_sid
WHERE s.city = "São Paulo";

-- 29.Encontre o número total de produtos de uma marca específica (por exemplo, "Sony") disponíveis em todas as lojas.
SELECT 
        SUM(p.amount) Total,
        p.fk_brand Marca
FROM product p
WHERE p.fk_brand = "Microsoft"
GROUP BY p.fk_brand;

-- 30.Calcule o valor total de todas as compras feitas por um comprador específico (por exemplo, userid = 1).
SELECT * FROM buyer;

SELECT
		SUM(o.totalAmount) Total
FROM users u
JOIN buyer b ON b.pk_userid = u.pk_userid
JOIN creditcard c ON u.pk_userid = c.fk_userid
JOIN bankcard bc ON bc.pk_cardNumber = c.pk_cardNumber
JOIN payment p ON bc.pk_cardNumber = p.fk_cardNumber
JOIN orders o ON p.fk_orderNumber = o.pk_orderNumber
WHERE b.pk_userid = 5;
