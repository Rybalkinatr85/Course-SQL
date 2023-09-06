CREATE DATABASE homework_2;
SHOW DATABASES;
USE homework_2;

/* 1. Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными
*/

CREATE TABLE sales
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
order_date DATE,
count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;

/* 2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/ 

SELECT *,
CASE
	WHEN count_product < 100 
		THEN 'Маленький заказ'
    WHEN count_product > 300 
		THEN 'Большой заказ'
ELSE 'Средний заказ'
END AS typesales
FROM sales;