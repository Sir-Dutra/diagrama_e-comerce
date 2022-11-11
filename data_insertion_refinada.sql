use ecomerce;

show tables;

insert into clients (Fname, Minit, Lname, CPF, Address)
	Values('Joao', 'S', 'Marcos', '123456789','Rua 2, numero 2, centro, Ubatuba'),
          ('Kathia', 'T', 'Silva', '321654987', 'Rua 7, ap 42, bairro novo, Açailandia'),
          ('Ricardo', 'M', 'Juarez', '222444333', 'Rua patinhos, ed jardim, São Paulo');
          
insert into product (Pname, classification_kids, category, avaliação, size, unitPrice) values
		('fone de ouvido',false,'Eletronicos','4',null,200),
        ('Barbie Elsa', true, 'Brinquedos','3',null, 150),
        ('camiseta preta elis', false, 'Vestuario','5','30x40x50',80);
        
select * from clients;
select * from product;

delete from orders where idOrderClient in (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
		(1, default, 'compra via app', null, 1),
        (2, default, 'compra via web',50,0),
        (3,'confirmado',null,null,1);
        
select * from orders;


insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
		(1,1,2,null),
        (2,1,1,null),
        (3,2,1,null);

insert into productStorage (storageLocation, quantity) values
		('Rio de Janeiro', 1000),
        ('São Paulo', 20),
        ('Brasilia', 500);
    
insert into storageLocation (idLproduct, idLstorage, location) values
			(1,1,'RJ'),
            (2,3,'DF');
	
insert into supplier ( SocialName, CNPJ, contact) values
		('Sergio ltda', 123456789012345, '12345678900'),
        ('Douglas metalurgica', 111111111111111, '11111111111');
        
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
		(1,1,50),
        (2,2,80),
        (2,4,60);

insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
		('tech mais', null, 123451234512345, null, 'rio de janeiro', 11111111111),
        ('venda do zé',null,null, 123412341, 'Alagoas', 12121212121),
        ('pague mais', null, 123412341234123,null, 'São Paulo',12345678912);

select * from seller;

insert into productSeller (idPseller, idPproduct, pordQuantity) values
		(1,6,80),
        (2,7,10);
  
select * from productSeller;

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname, ' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
				(2, default,'compra via aplicativo',null,1);
 		
        
select count(*) from clients c, orders o
		where c.idClient = idOrderClient;
 
 select * from orders;
 select c.idClient, Fname, count(*) as Number_orders from clients c
			inner join orders o ON c.idClient = o.idOrderClient
			inner join productOrder p on p.inPOorder = o.idOrder
	group by c.idClient;	

 
    
 
 