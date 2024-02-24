CREATE DATABASE human_friends;
USE human_friends;
CREATE TABLE Pets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    имя VARCHAR(255),
    команда VARCHAR(255),
    дата_рождения DATE
);

CREATE TABLE Pack_animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    имя VARCHAR(255),
    команда VARCHAR(255),
    дата_рождения DATE
);

CREATE TABLE Dogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    имя VARCHAR(255),
    команда VARCHAR(255),
    дата_рождения DATE
);

CREATE TABLE cats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    имя VARCHAR(255),
    команда VARCHAR(255),
    дата_рождения DATE
);

CREATE TABLE Hamsters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    имя VARCHAR(255),
    команда VARCHAR(255),
    дата_рождения DATE
);

CREATE TABLE Horses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    имя VARCHAR(255),
    команда VARCHAR(255),
    дата_рождения DATE
);

CREATE TABLE Camels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    имя VARCHAR(255),
    команда VARCHAR(255),
    дата_рождения DATE
);

CREATE TABLE Donkeys (
    id INT AUTO_INCREMENT PRIMARY KEY,
    имя VARCHAR(255),
    команда VARCHAR(255),
    дата_рождения DATE
);


INSERT INTO dogs (имя, команда, дата_рождения) VALUES ('Рекс', 'Сидеть', '2020-05-15');
INSERT INTO cats (имя, команда, дата_рождения) VALUES ('Мурка', 'Ловить мышей', '2018-10-25');
INSERT INTO Hamsters (имя, команда, дата_рождения) VALUES ('Буся', 'Крутить колесо', '2019-03-10');
INSERT INTO Horses (имя, команда, дата_рождения) VALUES ('Белка', 'Принять всадника', '2015-07-20');
INSERT INTO Camels (имя, команда, дата_рождения) VALUES ('Али', 'Переносить грузы', '2017-12-05');
INSERT INTO Donkeys (имя, команда, дата_рождения) VALUES ('Гром', 'Тянуть воз', '2016-08-12');


DELETE FROM Camels;
ALTER TABLE Donkeys ADD COLUMN тип VARCHAR(255);
UPDATE Donkeys SET тип = 'Donkeys';
ALTER TABLE Horses ADD COLUMN тип VARCHAR(255);
UPDATE Horses SET тип = 'Horses';

CREATE TABLE Young_animals AS
SELECT id, имя, команда, дата_рождения, TIMESTAMPDIFF(YEAR, дата_рождения, CURDATE()) AS возраст_годы,
TIMESTAMPDIFF(MONTH, дата_рождения, CURDATE()) % 12 AS возраст_месяцы
FROM Pets
WHERE TIMESTAMPDIFF(YEAR, дата_рождения, CURDATE()) BETWEEN 1 AND 3;


SELECT 'Домашние' AS источник, id, имя, команда, дата_рождения FROM Pets
UNION ALL
SELECT 'Вьючные', id, имя, команда, дата_рождения FROM Pack_animals
UNION ALL
SELECT 'Молодые', id, имя, команда, дата_рождения FROM Young_animals;