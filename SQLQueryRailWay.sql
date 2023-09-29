use master;
create database RailWay
go
--if exists (SELECT name FROM sys.databases where name like 'RailWay')
use RailWay;

CREATE TABLE RailwayRoute (
    train_number INT primary key,
    plan_route_id INT,
    departure_time DATETIME,
    arrival_time DATETIME,
    [user_id] INT,
    track_number INT
);

--Создание таблицы "Загруженность поезда"
CREATE TABLE TrainOccupancy (
    track_number INT primary key,
    track_name VARCHAR(255),
    wagon_type VARCHAR(255)
);

-- Создание таблицы "Пользователь"
CREATE TABLE [User] (
    [user_id] INT primary key,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    status VARCHAR(255),
    password VARCHAR(255)
);

-- Создание таблицы "Плановый маршрут"
CREATE TABLE PlannedRoute (
    plan_route_id INT primary key,
    longitude FLOAT,
    latitude FLOAT,
    departure_city VARCHAR(255),
    arrival_city VARCHAR(255),
    date_added DATE
);

INSERT into RailwayRoute (train_number, plan_route_id, departure_time, arrival_time, user_id, 
track_number) VALUES (123, 1, '2023-09-25T08:00:00 AM', '2023-09-26T18:00:00', 1, 2); 

INSERT INTO TrainOccupancy (track_number, track_name, wagon_type) VALUES (2, 'Путь №2', 
'Пассажирский'); 

INSERT INTO [User] ([user_id], first_name, last_name, email, status, password) VALUES (1, 'Иван', 'Иванов', 
'ivan@example.com', 'Активный', 'password123'); 

INSERT INTO PlannedRoute (plan_route_id, longitude, latitude, departure_city, arrival_city, date_added) 
VALUES (1, 55.7558, 37.6176, 'Москва', 'Санкт-Петербург', '2023-09-24');

INSERT INTO PlannedRoute (plan_route_id, longitude, latitude, departure_city, arrival_city, date_added) 
VALUES (2, 55.7558, 37.6176, 'Москва', 'Санкт-Петербург', '2023-09-24');

ALTER TABLE RailwayRoute
ADD CONSTRAINT FK_RailwayRoute_User
FOREIGN KEY ([user_id])
REFERENCES [User]([user_id]);

-- Добавление связи между таблицей RailwayRoute и таблицей TrainOccupancy
ALTER TABLE RailwayRoute
ADD CONSTRAINT FK_RailwayRoute_TrainOccupancy
FOREIGN KEY (track_number)
REFERENCES TrainOccupancy(track_number);

--Добавление связи между таблицей PlannedRoute и таблицей RailwayRoute
ALTER TABLE RailwayRoute
ADD CONSTRAINT FK_RailwayRoute_PlannedRoute
FOREIGN KEY (plan_route_id)
REFERENCES PlannedRoute(plan_route_id);