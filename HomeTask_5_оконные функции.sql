use lesson_4;

# 1. Создайте представление, в которое попадет информация о  пользователях (имя, фамилия, город и пол), которые не старше 20 лет.

create view users_20 as
select u.id, CONCAT(firstname, ' ', lastname, '; ', hometown, '; ', gender) AS 'Пользователь младше 20 лет'
FROM users u
JOIN profiles p ON u.id = p.user_id
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 20
GROUP BY u.id
;

select * from users_20;

/*2. Найдите кол-во,  отправленных сообщений каждым пользователем и выведите ранжированный список пользователей, 
указав имя и фамилию пользователя, количество отправленных сообщений и место в рейтинге 
(первое место у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK)*/

SELECT 
	CONCAT(firstname, ' ', lastname) AS 'Пользователи',
    COUNT(from_user_id) AS 'Количество отправленных сообщений',
    DENSE_RANK() OVER (ORDER BY COUNT(from_user_id) DESC) AS 'Место в рейтинге'
FROM users u
JOIN messages m ON u.id = m.from_user_id
GROUP BY u.id
;

/*Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at) 
и найдите разницу дат отправления между соседними сообщениями, получившегося списка. (используйте LEAD или LAG)*/

SELECT *, 
LAG(created_at) OVER (PARTITION BY TIMESTAMPDIFF(SECOND, created_at, created_at)) AS lag_created_at,
LEAD(created_at) OVER (PARTITION BY TIMESTAMPDIFF(SECOND, created_at, created_at)) AS lead_created_at
FROM messages ORDER BY TIMESTAMPDIFF(SECOND, created_at, NOW()) DESC;

