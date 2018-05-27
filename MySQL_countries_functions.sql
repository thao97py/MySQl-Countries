use world;
-- 1 --
select country.name, countrylanguage.language, countrylanguage.percentage
from country
join countrylanguage on country.code = countrylanguage.countrycode
where countrylanguage.language = 'Slovene'
order by countrylanguage.percentage desc;
-- 2 --
select country.code, country.name, count(city.id) as number_of_cities, group_concat('  ',city.name)
from country 
left join city on country.code = city.countrycode
group by country.code
order by count(city.id) desc;
-- 3--
select country.code, city.name as city_name, city.population
from country
left join city on country.code = city.countrycode
where country.name ='Mexico' and city.population>500000
order by  city.population desc;
-- 4 --
select country.name, group_concat(language, ' ') as languages, countrylanguage.percentage
from country
left join countrylanguage on country.code = countrylanguage.countrycode
where countrylanguage.percentage >89
group by country.code
order by countrylanguage.percentage desc;
-- 5 --
select name, population, surfacearea
from country
where surfacearea < 501 and population>100000;
-- 6--
select name , lifeexpectancy as life_expectancy, governmentform as goverment, capital
from country
where governmentform = 'Constitutional Monarchy' and capital >200 and lifeexpectancy >75;
-- 7--
select country.name, city.name, city.district, city.population 
from country
left join city on country.code = city.countrycode
where city.district = 'Buenos Aires' and city.population>500000;
-- 8--
select region, count(code) as number_of_cities
from country
group by region
order by count(code) desc 
