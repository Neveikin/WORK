
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    birthday DATETIME NULL
);

CREATE TABLE subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    hours SMALLINT NULL
);

CREATE TABLE marks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    stud_id INT NOT NULL,
    subj_id INT NOT NULL,
    ddate DATETIME DEFAULT CURRENT_TIMESTAMP,
    mark TINYINT CHECK (mark >= 1 AND mark <= 5),
    FOREIGN KEY (stud_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (subj_id) REFERENCES subjects(id) ON DELETE CASCADE
);

INSERT INTO students (name, lastname, birthday) VALUES
('Ivan', 'Petrov', '2003-05-11'),
('Anna', 'Smirnova', '2004-01-23'),
('Dmitry', 'Sokolov', '2003-11-02'),
('Elena', 'Kuznetsova', '2004-07-15'),
('Pavel', 'Volkov', '2003-02-10'),
('Olga', 'Popova', '2004-09-21'),
('Sergey', 'Morozov', '2003-06-06'),
('Natalia', 'Lebedeva', '2004-04-30'),
('Andrey', 'Fedorov', '2003-12-12'),
('Maria', 'Ivanova', '2004-03-18');

INSERT INTO subjects (name, hours) VALUES
('Mathematics', 120),
('Physics', 100),
('Chemistry', 90),
('Biology', 80),
('History', 60),
('Geography', 70),
('Literature', 90),
('Computer Science', 110),
('English', 100),
('Physical Education', 60);

INSERT INTO marks (stud_id, subj_id, mark) VALUES
(1, 1, 5),
(2, 2, 4),
(3, 3, 3),
(4, 4, 5),
(5, 5, 4),
(6, 6, 5),
(7, 7, 3),
(8, 8, 5),
(9, 9, 4),
(10, 10, 5);
