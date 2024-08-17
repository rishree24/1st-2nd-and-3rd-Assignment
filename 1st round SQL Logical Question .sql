--create table country_pollution
--(
--Country char(20),
--Temperature float,
--CO2_Emissions float,
--Date_Year DATE,
--);
--Go


--Insert into country_pollution
--values
--('India', 32.0, 1.8, '2023'),
--('USA', 12.5, 15.5, '2021'),
--('Canada', -5.3, 16.2, '2024'),
--('Australia', 21.8, 17.4, '2019'),
--('UK', 10.2, 5.7, '2018')

--Insert into country_pollution (Country,CO2_Emissions, Date_year)
--values
--('Russia',  12.2,'2020'),
--('China',  7.6,'2015'),
--('Brazil', 2.5,'2016')



--1. Question: Write a query to find the countries with the highest temperatures in the dataset?
select Country, Temperature from country_pollution
where Temperature = (Select max(temperature) from country_pollution);

--2.Question: Write a query to identify the countries with the lowest CO2 emissions is the dataset.
select Country, CO2_Emissions from country_pollution
where CO2_Emissions = (Select min(CO2_Emissions) from country_pollution);

--3. Question: Write a query to find all temperature records above a specific value, for example, 20 degrees Celsius.
select Temperature from country_pollution
where Temperature >= 10;

--4. Question: Write a query to list all countries with CO2 emissions data available for the year 2020.
select Country,CO2_Emissions from country_pollution
where year(date_year) = 2020;

--5. Question: Write a query to count the total number of temperature records in the dataset.
select count(temperature) as total_number_of_temp_record from country_pollution;

--6. Question: Write a query to identify any countries with missing temperature data for specific year, for example, 2015.
select country, temperature, date_year from country_pollution
where temperature is null;

--7. Question: Write a query to find the average temperature for each year in the dataset.
select year(date_year) as year, avg(temperature) as avg_temperature from country_pollution
group by year(date_year);

--8. Question: Write a query to calculate the total CO2 emissions for all countries in the dataset.
select sum(CO2_Emissions) as total_co2_emissions from country_pollution;

--9. Question: Write a query to sort the temperature data in descending order based of the temperature values.
select temperature from country_pollution
order by temperature desc;

