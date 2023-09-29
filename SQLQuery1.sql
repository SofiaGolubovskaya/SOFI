select * from PlannedRoute
where departure_city = 'Красноярск' and arrival_city = 'Анапа'

update RailwayRoute
set arrival_time = '2023-09-26T20:00:00'
where train_number =123

delete from PlannedRoute
where date_added='2023-09-23'

insert into PlannedRoute (plan_route_id,longitude, latitude, departure_city, arrival_city, date_added)
values (4,55.7558,37.6176,'Москва','Санкт-Петербург','2023-09-24')