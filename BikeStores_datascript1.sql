SELECT DISTINCT
	ord.order_id AS 'ORDER ID',
	CONCAT(cus.first_name,' ', cus.last_name) AS 'CUSTOMER',
	cus.city AS 'CITY',
	cus.state AS 'STATE',
	ord.order_date AS 'ORDER DATE',
	SUM(ite.quantity) AS 'TOTAL UNITS',
	SUM(ite.quantity * ite.list_price) AS 'REVENUE',
	pro.product_name AS 'PRODUCT',
	cat.category_name AS 'CATEGORY',
	sto.store_name,
	CONCAT(sta.first_name,' ', sta.last_name) AS 'Sales Rep'
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
JOIN production.categories cat
ON pro.category_id = cat.category_id
JOIN sales.stores sto
ON ord.store_id = sto.store_id
JOIN sales.staffs sta
ON ord.staff_id = sta.staff_id
GROUP BY 
	ord.order_id,
	CONCAT(cus.first_name,' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ', sta.last_name)
ORDER BY cus.city,cus.state
