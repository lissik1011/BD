CREATE TABLE Hero (
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    birthyear INT CHECK (birthyear > 1900 AND birthyear < 3000),
    gender VARCHAR(1),
    city_id INT NOT NULL,
    team_id INT NOT NULL,
    moral BOOLEAN NOT NULL,
    FOREIGN KEY (city_id) REFERENCES City (id),
    FOREIGN KEY (team_id) REFERENCES Team (id)
);


-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
CREATE TABLE Lesson (
    id INT PRIMARY KEY,
    lesson TEXT NOT NULL,
    city_id INT REFERENCES City (id),
    difficulty INT CHECK (difficulty >= 0 AND difficulty <= 10),
    teacher INT NOT NULL,
    FOREIGN KEY (teacher) REFERENCES Hero (id)
);


CREATE TABLE Team (
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    power INT CHECK (power >= 0 AND power <= 10),
    speed INT CHECK (speed >= 0 AND speed <= 10),
    city_id INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES City (id)
);

CREATE TABLE City (
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    size INT NOT NULL,
    birthyear INT CHECK (birthyear > 0 AND birthyear < 3000),
    terrain_id INT NOT NULL,
    milage_km INT CHECK (milage_km >= 0),
    FOREIGN KEY (terrain_id) REFERENCES Terrain (id)
);

CREATE TABLE Terrain (
    id INT PRIMARY KEY,
    type TEXT NOT NULL,
    prevalence INT CHECK (prevalence >= 0 AND prevalence <= 100),
    cross_county INT CHECK (prevalence >= 0 AND prevalence <= 100)
);

CREATE TABLE Learned (
    id INT PRIMARY KEY,
    hero_id INT NOT NULL,
    lesson_id INT NOT NULL,
    studied BOOLEAN,
    FOREIGN KEY (hero_id) REFERENCES Hero (id),
    FOREIGN KEY (lesson_id) REFERENCES Lesson (id)
);

INSERT INTO Hero (id, name, birthyear, gender, city_id, team_id, moral)
VALUES
(1, 'Алистра', 2004, 'F', 2, 3, false),
(2, 'Лиз', 1990, 'M', 3, 4, true),
(3, 'Кластор', 2003, 'M', 1, 1, false),
(4, 'Элинор', 2002, 'F', 1, 3, false),
(5, 'Кэлира', 2005, 'F', 2, 2, true),
(6, 'Аэлинд', 1990, 'M', 5, 4, true),
(7, 'Эсфир', 1996, 'M', 2, 4, false),
(8, 'Таэра', 2002, 'F', 3, 2, false),
(9, 'Сильвия', 2004, 'F', 5, 1, true),
(10, 'Лориэн', 1981, 'M', 4, 4, true),
(11, 'Нимериэль', 1997, 'M', 5, 1, true),
(12, 'Илвин', 1998, 'M', 2, 1, false),
(13, 'Каэлин', 2006, 'M', 4, 2, false);

INSERT INTO Lesson (id, lesson, city_id, difficulty, teacher)
VALUES
(1, 'Нежность защитника', 1, 7, 4),
(2, 'Подлинный смысл любви', 2, 10, 2),
(3, 'Сила уязвимости', 3, 3, 8),
(4, 'Голос тишины', 4, 6, 10),
(5, 'Свет в тени', 5, 4, 6),
(6, 'Цена верности', 1, 6, 2);

INSERT INTO Team (id, name, power, speed, city_id)
VALUES
(1, 'Лунолец', 7, 7, 5),
(2, 'Огновер', 4, 6, 3),
(3, 'Тенирист', 5, 4, 2),
(4, 'Илтарин', 9, 6, 3);

INSERT INTO City (id, name, size, terrain_id, birthyear, milage_km)
VALUES
(1, 'Эрли', 223, 1, 1830, 730),
(2, 'Диаспор', 856, 4, 1200, 0),
(3, 'Альтерис', 680, 5, 870, 700),
(4, 'Вейланд', 168, 3, 1870, 970),
(5, 'Ориндор', 284, 6, 1560, 950);

INSERT INTO Terrain (id, type, prevalence, cross_county)
VALUES
(1, 'Горы', 14, 6),
(2, 'Леса', 20, 8),
(3, 'Воды', 60, 7),
(4, 'Пустыни', 10, 4),
(5, 'Равнины', 25, 2),
(6, 'Подземелье', 18, 5),
(7, 'Вулканы', 6, 8);

INSERT INTO Learned (id, hero_id, lesson_id, studied)
VALUES
(1, 1, 4, true),
(2, 2, 1, true),
(3, 2, 3, true),
(4, 2, 4, true),
(5, 3, 1, true),
(6, 3, 2, true),
(7, 3, 5, true),
(8, 4, 4, true),
(9, 4, 3, false),
(10, 4, 2, true),
(11, 5, 6, false),
(12, 6, 3, true),
(13, 6, 4, false),
(14, 7, 6, true),
(15, 7, 2, true),
(16, 8, 5, false),
(17, 8, 3, true),
(18, 9, 4, true),
(19, 10, 2, false),
(20, 10, 3, true),
(21, 10, 6, true),
(22, 10, 5, false),
(23, 11, 4, true),
(24, 11, 1, false),
(25, 12, 1, true),
(26, 13, 5, false);

SELECT * FROM hero;
SELECT * FROM city;

SELECT Hero.name, Team.name as team FROM Hero, Team 
    WHERE Hero.team_id = Team.id GROUP BY Team;

SELECT City.name, Terrain.type as terrain_type FROM City, Terrain 
    WHERE City.terrain_id = Terrain.id;

select hero.id, hero.name, city.name as city, city.size from hero
    join city on hero.city_id = city.id;

select city.name, city.birthyear, terrain.type from city 
    join terrain on city.terrain_id = terrain.id;
