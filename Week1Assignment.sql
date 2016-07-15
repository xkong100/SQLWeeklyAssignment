# 1. Which destination in the flights database is the furthest distance away, based on information in the flights table. 
# Answer: HNL, 4983
SELECT dest,distance 
From flights 
order by distance DESC Limit 1;

# 2.What are the different numbers of engines in the planes table? for each number of engines, which aircraft have the most number of seats? 
select engines
from planes
group by engines;
#engines are 1, 2, 3, 4
#For engine 1, OTTER DHC-3, 16 seats
select distinct(model), seats  from planes where seats = (select max(seats) from planes where engines = 1 group by engines)
#For engine 2, '777-222','400' '777-200','400' '777-224','400' '777-232','400'
select distinct(model), seats  from planes where seats = (select max(seats) from planes where engines = 2 group by engines)
#For engine 3, 'A321-231','379' 'A330-323','379' 'A330-223','379'
select distinct(model), seats  from planes where seats = (select max(seats) from planes where engines = 3 group by engines)
#For engine 4. 747-451 450
select distinct(model), seats  from planes where seats = (select max(seats) from planes where engines = 4 group by engines)

#3. show the total number of flights.
#answer is 664096549
select sum(flight) From flights;

#4. Show the total number of flights by airline.alter.
#The answer is '9E','65847885'

select carrier, sum(flight)
From flights
group by carrier;

#5. Show all of the airlines, ordered by number of flights in descending order.
answer: 
'EV','250500399'
'MQ','101761406'
'DL','66141518'
'9E','65847885'
'UA','56289091'
'B6','36669259'
'US','33468909'
'AA','29978858'
'WN','18007421'
'YV','1972985'
'FL','1651670'
'VX','1137352'
'F9','469385'
'OO','174263'
'HA','17442'
'AS','8706'


select carrier, sum(flight)
From flights
group by carrier
order by sum(flight) DESC;

#6. Show only the top 5 airlines, by number of flights, ordered by number of flights in sescending order.
answer:
'EV','250500399'
'MQ','101761406'
'DL','66141518'
'9E','65847885'
'UA','56289091'

select carrier, sum(flight)
From flights
group by carrier
order by sum(flight) DESC Limit 5;

#7. Show only the top 5 airlines, by number of flights od distance 1,000 miles or greater, ordered by number of flights in descending order.
'UA','39207824'
'DL','38562575'
'EV','28434588'
'AA','22506685'
'B6','16578976'

select carrier,sum(flight)
From flights where distance >= 1000
group by carrier 
order by sum(flight) DESC Limit 5;

#8.Create a question that uses data from the flights database, and requires aggregation to answer it.
Question: what are the average of arriving delay times of three major New York airports on January 2013, order by the average arriving delay time by descending order?
'EWR','12.8166'
'LGA','3.3824'
'JFK','1.3684'

select origin, avg(arr_delay) 
From flights where (origin = 'JFK'Or origin='EWR' Or origin='LGA')AND (Year = 2013 AND month = 1)
group by origin
order by avg(arr_delay) DESC;
