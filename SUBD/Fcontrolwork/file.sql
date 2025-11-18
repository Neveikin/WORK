-- Проверка без индекса 
EXPLAIN SELECT * FROM students WHERE age = 25

--Система проверяет все строки, потому что индекса ещё нет. Таблица EXPLAIN показывает type = ALL и possible_keys = NULL, что значит полный перебор.

CREATE INDEX idx_age ON students(age);

--создал индекс на колонку age, чтобы поиск стал быстрее

EXPLAIN SELECT * FROM students WHERE age = 20;

--Снова сделал запрос с фильтром по age и посмотрел план выполнения. Теперь база использует индекс, проверяет не все строки, а только те, где возраст равен 20, В EXPLAIN будет key = idx_age и type = ref, что значит быстрый поиск.
