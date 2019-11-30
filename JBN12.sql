SELECT lprod_gu, lprod_nm, prod_id, prod_name  FROM prod JOIN lprod ON(prod_lgu=lprod_gu);
SELECT * FROM lprod;

SELECT buyer.buyer_id, buyer.buyer_name, prod.prod_id, prod.prod_name 
FROM prod, buyer 
WHERE prod.prod_buyer=buyer.buyer_id;

SELECT buyer.buyer_id, buyer.buyer_name, prod.prod_id, prod.prod_name 
FROM prod JOIN buyer ON (prod.prod_buyer=buyer.buyer_id);


SELECT * FROM buyer;
SELECT * FROM prod;

SELECT member.mem_id, member.mem_name FROM member JOIN cart ON(member.mem_id=cart.cart_member);
SELECT member.mem_id, member.mem_name FROM member, cart WHERE member.mem_id=cart.cart_member;

SELECT * FROM customer;
SELECT * FROM cycle; 

SELECT customer.cnm, cycle.* 
FROM cycle 
JOIN customer ON(customer.cid=cycle.cid) 
WHERE customer.cnm = 'brown' OR customer.cnm ='sally';

SELECT a.*, product.pnm FROM (SELECT customer.cnm, cycle.* 
FROM cycle
JOIN customer ON(customer.cid=cycle.cid) 
WHERE customer.cnm = 'brown' OR customer.cnm ='sally') a JOIN product ON(product.pid=a.pid);

SELECT customer.cnm,  
FROM cycle
JOIN customer ON(customer.cid=cycle.cid) WHERE product.pid=a.pid ;




SELECT * FROM product;
SELECT * FROM cycle;
SELECT * FROM member;
SELECT * FROM cart;

