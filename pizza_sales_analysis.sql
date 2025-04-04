select * from pizza_sales

#TOTAL REVENUE
select sum(total_price) as Total_Revenue from pizza_sales

# Average Order Value
select Sum(Total_price) / COUNT(DISTINCT order_id) as Average_Order_Value from pizza_sales

#total pizzas sold
select sum(quantity) as Total_Pizza_Sold from pizza_sales

#total orders
select count(distinct order_id) as Total_Orders from pizza_sales

#Average Pizzas per order
select CAST(CAST(SUM(quantity) as DECIMAL(10,2)) / CAST(count(distinct order_id) AS DECIMAL(10,2))AS 
DECIMAL(10,2))as Average_Pizza_perorder from pizza_sales


#daily trends for orders

select datename(DW,order_date) as order_day,count(distinct order_id) as Total_Orders
from pizza_sales
GROUP BY datename(DW,order_date)

#montly trend for order placed

select datename(MONTH,order_date) as month_name,count(distinct order_id) as total_orders 
from pizza_sales
Group by  datename(MONTH,order_date)

#percentage of sales by pizaa category

select pizza_category, sum(total_price) *100 /(select sum(total_price) from pizza_sales where month(order_date)=1) as Percent_Total_Sales
from pizza_sales 
where month(order_date)=1
GROUP BY pizza_category

#Percentage of sales by pizza size
select pizza_size, sum(total_price) *100 /(select sum(total_price) from pizza_sales ) as Percent_Total_Sales
from pizza_sales 
GROUP BY pizza_size


#Top 5 best sellers by Revenue, Total Quantity and Total Orders

select Top 5 pizza_name ,SUM(total_price) as Total_Revenue from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

#. Bottom 5 sellers by Revenue, Total Quantity and Total Orders

select Top 5 pizza_name ,SUM(quantity)as Total_Quantity ,COUNT(distinct order_id) as Total_Orders
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC, Total_Orders ASC