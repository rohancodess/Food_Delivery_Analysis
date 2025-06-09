-- is there any impact of weather condition on delivery?
SELECT Weatherconditions, AVG(`Time_taken(min)`) FROM food_delivery_data
GROUP BY Weatherconditions
ORDER BY AVG(`Time_taken(min)`) DESC;

-- an average delivery time taken in different weather condition with distinct traffic situation.
SELECT Weatherconditions, Road_traffic_density, AVG(`Time_taken(min)`) FROM food_delivery_data
GROUP BY Weatherconditions, Road_traffic_density
ORDER BY AVG(`Time_taken(min)`) DESC; 

-- Analyse the comparison of delivery time and total orders by festival or not.
SELECT festival,COUNT(*) AS 'Total_Orders', AVG(`Time_taken(min)`) AS 'Average Delivery Time' from food_delivery_data
group by festival;

-- find average delivery time by city and traffic condition
SELECT city,Road_traffic_density,AVG(`Time_taken(min)`) from food_delivery_data
group by city, Road_traffic_density
order by AVG(`Time_taken(min)`) ;


-- top 10 delivery person who has deliveres most orders with average minimum delivery time of his career
SELECT Delivery_person_ID, COUNT(*) AS 'Total Delivered Orders', AVG(`Time_taken(min)`) AS 'Avg. Delivery time' from food_delivery_data 
GROUP BY Delivery_person_ID
ORDER BY COUNT(*) DESC ,AVG(`Time_taken(min)`) LIMIT 10;

-- impact on delivery time on vehicle condition 
SELECT `Vehicle_condition_name`, AVG(`Time_taken(min)`) from food_delivery_data
group by `Vehicle_condition_name`
order by AVG(`Time_taken(min)`) DESC ;

-- order volume over time
select 
	CASE 
		WHEN month(Order_Date)=2 THEN 'FEBRUARY'
        WHEN month(Order_Date)=3 THEN 'MARCH'
        ELSE 'APRIL'
        END AS 'month_name', COUNT(*) AS 'total orders within_month'
        from food_delivery_data
        GROUP BY month_name
        order by COUNT(*) ;