--Создание таблицы

CREATE TABLE Cotroll_students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    grade VARCHAR(10)
);

--заполнение

SET SESSION max_recursive_iterations = 100000;
INSERT INTO Cotroll_students (name, age, grade)
WITH RECURSIVE numbers (n) AS (
   SELECT 0
   UNION ALL
   SELECT n + 1 FROM numbers WHERE n < 99999
)
SELECT
   CONCAT('Student', n),
   FLOOR(RAND() * 100),  -- возраст от 0 до 99
   FLOOR(RAND() * 10)    -- оценка от 0 до 9
FROM numbers;


-- Проверка без индекса 
EXPLAIN SELECT * FROM students WHERE age = 25

--Система проверяет все строки, потому что индекса ещё нет. Таблица EXPLAIN показывает type = ALL и possible_keys = NULL, что значит полный перебор.

CREATE INDEX idx_age ON students(age);

--создал индекс на колонку age, чтобы поиск стал быстрее

EXPLAIN SELECT * FROM students WHERE age = 20;

--Снова сделал запрос с фильтром по age и посмотрел план выполнения. Теперь база использует индекс, проверяет не все строки, а только те, где возраст равен 20, В EXPLAIN будет key = idx_age и type = ref, что значит быстрый поиск.
