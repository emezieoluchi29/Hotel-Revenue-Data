--merge multiple tables  with same column header using UNION 

WITH HOTELS AS (
SELECT * FROM[dbo].['2018$']
UNION
SELECT * FROM [dbo].['2019$']
UNION
SELECT * FROM [dbo].['2020$'])

--including the table with different column structures using join
SELECT * FROM HOTELS as h
left join [dbo].[market_segment$] as ms
on h.market_segment = ms.market_segment
left join [dbo].[meal_cost$] as mc
on mc.meal = h.meal;

--creating a calculated revenue column 
-- is the hotel revenue growing by year across hotel location
select  arrival_date_year, hotel, round(sum(([stays_in_week_nights] + [stays_in_weekend_nights])*adr),2) as revenue
FROM HOTELS
group by arrival_date_year, hotel;











--including those with different column structures — using join