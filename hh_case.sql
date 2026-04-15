-- Диапазон заработных плат

SELECT ROUND(AVG(salary_from),2) AS avg_salary_from,
       ROUND(AVG(salary_to),2) AS avg_salary_to,
       MIN(salary_from) AS min_salary_from,
       MAX(salary_from) AS max_salary_from,
       MIN(salary_to) AS min_salary_to,
       MAX(salary_to) AS max_salary_to
FROM public.parcing_table;

avg_salary_from|avg_salary_to|min_salary_from|max_salary_from|min_salary_to|max_salary_to|
---------------+-------------+---------------+---------------+-------------+-------------+
      109525.09|    153846.71|           50.0|       398000.0|      25000.0|     497500.0|

-- Регионы с наибольшим количеством вакансий
      
SELECT area, COUNT(id) AS total_vacancies
FROM public.parcing_table
GROUP BY area 
ORDER BY total_vacancies DESC
LIMIT 10;

area           |total_vacancies|
---------------+---------------+
Москва         |           1247|
Санкт-Петербург|            181|
Екатеринбург   |             51|
Нижний Новгород|             33|
Новосибирск    |             33|
Владивосток    |             31|
Казань         |             29|
Краснодар      |             22|
Самара         |             11|
Ростов-на-Дону |             10|

-- Компании с наибольшим количеством вакансий

SELECT employer, COUNT(id) AS total_vacancies
FROM public.parcing_table
GROUP BY employer 
ORDER BY total_vacancies DESC 
LIMIT 15;

employer                             |total_vacancies
-------------------------------------+---------------
СБЕР                                 |            243
WILDBERRIES                          |             43
Ozon                                 |             34
Банк ВТБ (ПАО)                       |             28
Т1                                   |             26
МАГНИТ, Розничная сеть               |             24
МТС                                  |             22
Okko                                 |             19
Центральный банк Российской Федерации|             16
Ростелеком                           |             15
Яндекс                               |             15
Правительство Москвы                 |             15
Райффайзен Банк                      |             14
Московская Биржа                     |             13
Деловые Линии                        |             12

-- Преобладающие типы занятости

SELECT employment, COUNT(id) AS total_number
FROM public.parcing_table 
GROUP BY employment 
ORDER BY total_number DESC;

employment         |total_number|
-------------------+------------+
Полная занятость   |        1764|
Частичная занятость|          16|
Стажировка         |          16|
Проектная работа   |           5|

-- Преобладающие графики работ

SELECT schedule, COUNT(id) AS total_number
FROM public.parcing_table 
GROUP BY schedule 
ORDER BY total_number DESC;

schedule        |total_number|
----------------+------------+
Полный день     |        1441|
Удаленная работа|         310|
Гибкий график   |          41|
Сменный график  |           9|

-- Распределение грейдов

SELECT experience, COUNT(id) AS total_number
FROM public.parcing_table 
GROUP BY experience 
ORDER BY total_number DESC;

experience            |total_number|
----------------------+------------+
Junior+ (1-3 years)   |        1091|
Middle (3-6 years)    |         555|
Junior (no experience)|         142|
Senior (6+ years)     |          13|

-- Определение доли грейдов

SELECT COUNT(id) AS total_vacancies
FROM public.parcing_table
WHERE name LIKE '%Аналитик данных%' OR name LIKE '%Системный аналитик%';

total_vacancies|
---------------+
           1157|
           
SELECT experience, 
       COUNT(id) AS total_vacancies,
       ROUND(COUNT(*)*100.0/1157, 2) AS percent_vacancies
FROM public.parcing_table 
WHERE name LIKE '%Аналитик данных%' OR name LIKE '%Системный аналитик%'
GROUP BY experience
ORDER BY percent_vacancies DESC;

experience            |total_vacancies|percent_vacancies|
----------------------+---------------+-----------------+
Junior+ (1-3 years)   |            751|            64.91|
Middle (3-6 years)    |            296|            25.58|
Junior (no experience)|            105|             9.08|
Senior (6+ years)     |              5|             0.43|

-- Основные работодатели, зарплаты, условия труда

SELECT employer,
       COUNT(id) AS total_vacancies,
       ROUND(AVG(salary_from),2) AS avg_salary_from,
       ROUND(AVG(salary_to),2) AS avg_salary_to,
       schedule,
       employment 
FROM public.parcing_table
WHERE name LIKE '%Аналитик данных%' OR name LIKE '%Системный аналитик%'
GROUP BY employer, schedule, employment 
ORDER BY total_vacancies DESC
LIMIT 10;

employer                                   |total_vacancies|avg_salary_from|avg_salary_to|schedule        |employment      |
-------------------------------------------+---------------+---------------+-------------+----------------+----------------+
СБЕР                                       |            103|      112000.00|     73333.33|Полный день     |Полная занятость|
Банк ВТБ (ПАО)                             |             25|               |             |Полный день     |Полная занятость|
Ozon                                       |             18|               |             |Полный день     |Полная занятость|
Т1                                         |             17|               |             |Полный день     |Полная занятость|
Правительство Москвы                       |             15|               |             |Полный день     |Полная занятость|
Яндекс                                     |             14|               |             |Полный день     |Полная занятость|
WILDBERRIES                                |             12|               |             |Полный день     |Полная занятость|
Центральный банк Российской Федерации      |             12|               |             |Полный день     |Полная занятость|
ГКУ Центр занятости населения города Москвы|             12|      101666.67|    108000.00|Полный день     |Полная занятость|
Ростелеком                                 |             11|               |    100000.00|Удаленная работа|Полная занятость|

-- Наиболее востребованные навыки

SELECT key_skills_1, COUNT(*) AS total_skills 
FROM public.parcing_table
GROUP BY key_skills_1 
ORDER BY total_skills DESC
LIMIT 5;

key_skills_1 |total_skills|
-------------+------------+
             |         383|
Анализ данных|         312|
SQL          |         161|
Документация |          89|
MS SQL       |          87|

SELECT key_skills_2, COUNT(*) AS total_skills 
FROM public.parcing_table
GROUP BY key_skills_2 
ORDER BY total_skills DESC
LIMIT 5;

key_skills_2 |total_skills|
-------------+------------+
             |         641|
SQL          |         318|
Python       |         142|
Коммуникация |          64|
Анализ данных|          62|

SELECT key_skills_3, COUNT(*) AS total_skills 
FROM public.parcing_table
GROUP BY key_skills_3
ORDER BY total_skills DESC
LIMIT 5;

key_skills_3|total_skills|
------------+------------+
            |         753|
SQL         |         220|
Python      |         130|
Power BI    |          62|
Документация|          61|

SELECT key_skills_4, COUNT(*) AS total_skills 
FROM public.parcing_table
GROUP BY key_skills_4
ORDER BY total_skills DESC
LIMIT 5;

key_skills_4                       |total_skills|
-----------------------------------+------------+
                                   |         864|
Python                             |         113|
SQL                                |          61|
Работа с большим объемом информации|          47|
Документация                       |          47|

SELECT soft_skills_1, COUNT(*) AS total_skills 
FROM public.parcing_table
GROUP BY soft_skills_1 
ORDER BY total_skills DESC
LIMIT 5;

soft_skills_1         |total_skills|
----------------------+------------+
                      |        1213|
Документация          |         234|
Коммуникация          |         181|
Аналитическое мышление|         109|
Проактивность         |          37|

SELECT soft_skills_2, COUNT(*) AS total_skills 
FROM public.parcing_table
GROUP BY soft_skills_2 
ORDER BY total_skills DESC
LIMIT 5;

soft_skills_2          |total_skills|
-----------------------+------------+
                       |        1691|
 Документация          |          46|
 Аналитическое мышление|          32|
 Проактивность         |          13|
 Переговоры            |           9|
 
SELECT soft_skills_3, COUNT(*) AS total_skills 
FROM public.parcing_table
GROUP BY soft_skills_3
ORDER BY total_skills DESC
LIMIT 5; 

soft_skills_3          |total_skills|
-----------------------+------------+
                       |        1779|
 Аналитическое мышление|           9|
 Проактивность         |           3|
 Переговоры            |           3|
 Креативность          |           3|
 
 SELECT soft_skills_4, COUNT(*) AS total_skills 
FROM public.parcing_table
GROUP BY soft_skills_4
ORDER BY total_skills DESC
LIMIT 5; 

soft_skills_4          |total_skills|
-----------------------+------------+
                       |        1796|
 Внимание к деталям    |           3|
 Аналитическое мышление|           2|
