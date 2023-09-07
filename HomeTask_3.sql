USE seminar_3;
SELECT * 
FROM staff;

# Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 

SELECT * 
FROM staff
ORDER BY salary;

SELECT * 
FROM staff
ORDER BY salary DESC;

# Выведите 5 максимальных заработных плат (salary)
SELECT firstname, lastname, salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

# Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT post, SUM(salary) AS sum_salary
FROM staff
GROUP BY post;

/* Найдите кол-во сотрудников с специальностью «Рабочий» в возрасте от 24 до 49 лет 
включительно*/

SELECT COUNT(id) AS count_id
FROM staff
WHERE post = "Рабочий" AND age >= 24 AND age <= 49;

#Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS count_post
FROM staff;

# Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT post, AVG(age) AS average_age
FROM staff
GROUP BY post
HAVING average_age <=30;