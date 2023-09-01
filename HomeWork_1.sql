SELECT product_name, manufacturer, price 
FROM mobile_phones
WHERE product_count >= 2;

SELECT * 
FROM mobile_phones
WHERE manufacturer = 'Samsung';

SELECT * 
FROM mobile_phones
WHERE product_name 
LIKE 'iPhone%';

SELECT * FROM mobile_phones;

SELECT * 
FROM mobile_phones
WHERE manufacturer
LIKE '%Samsung%';

SELECT * 
FROM mobile_phones
WHERE product_name 
LIKE ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');

SELECT * 
FROM mobile_phones
WHERE product_name 
LIKE ('8');
