use ecommerce;

-- Quantos pedidos foram feitos por cliente?
select c.idClient, Fname, Lname, count(*) as Numero_de_pedidos from clients as c 
					inner join orders as p on c.idClient = p.idOrderClient
			group by idClient;
            
-- Relação de nomes dos fornecedores e nomes dos produtos:
select l.SocialName, p.Pname from suppier l
		inner join productSupplier ps on idSupplier = idPsSupplier
        inner join product p on idProduct = idPsProduct;

-- Algum vendedor também é fornecedor?
select s.SocialName, s.CNPJ, l.SocialName, l.CNPJ from seller s, supplier l
	where s.CNPJ = l.CNPJ;

-- Relação de produtos e fornecedor:
select idProduct, Pname, l.SocialName, l.CNPJ from product
		inner join productSupplier on idProduct=idPsProduct
        inner join supplier l on idSupplier = idPsSupplier;



-- Quantos clientes cadastrados?
select count(*) from clients;


-- Quantos produtos cadastrados com preço maior que 500 reais?
select count(*) from product where unitPrice > 500;


-- Mostrar o nome e preço dos produtos com preço maior que 1000 reais
select Pname, category, unitPrice from product having unitPrice > 1000 order by Pname, Category;


-- Relação do Nome do Cliente, CPF com o numero da carteira digital
select Lname, Fname, CPF, Numero_carteira from clients c
		inner join formas_pagamento on idClients = idFormas_pagamento_cliente
		inner join carteira_digital on idCarteira_digital = idFormas_pagamento_carteira_digital
        order by Lname;
		
        
 
