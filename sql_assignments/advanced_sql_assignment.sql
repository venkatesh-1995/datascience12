-- 1.Find the total, average, minimum, and maximum credit limit of all customers.
-- SELECT 
--     SUM(credit_limit) AS total_credit_limit,
--     AVG(credit_limit) AS average_credit_limit,
--     MIN(credit_limit) AS minimum_credit_limit,
--     MAX(credit_limit) AS maximum_credit_limit
-- FROM customers;

-- --2.Count the number of customers in each income level.
-- SELECT 
--     income_level,
--     COUNT(*) AS number_of_customers
-- FROM customers
-- GROUP BY income_level
-- ORDER BY income_level;

-- -- 3.Show total credit limit by state and country.
-- SELECT 
--     CUST_STATE_PROVINCE,
--     COUNTRY_ID,
--     SUM(CUST_CREDIT_LIMIT) AS total_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY 
--     CUST_STATE_PROVINCE, 
--     COUNTRY_ID


-- -- 4.Display average credit limit for each marital status and gender combination.
-- SELECT 
--     CUST_MARITAL_STATUS,
--     CUST_GENDER,
--     ROUND(AVG(CUST_CREDIT_LIMIT), 2) AS avg_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY 
--     CUST_MARITAL_STATUS, 
--     CUST_GENDER


-- -- 5.Find the top 3 states with the highest average credit limit.
-- SELECT 
--     CUST_STATE_PROVINCE,
--     ROUND(AVG(CUST_CREDIT_LIMIT), 2) AS avg_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_STATE_PROVINCE
-- ORDER BY avg_credit_limit DESC
-- FETCH FIRST 3 ROWS ONLY;

-- -- 6.Find the country with the maximum total customer credit limit.
-- SELECT 
--     COUNTRY_ID,
--     SUM(CUST_CREDIT_LIMIT) AS total_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY COUNTRY_ID
-- ORDER BY total_credit_limit DESC
-- FETCH FIRST 1 ROW ONLY;

-- -- 7.Show the number of customers whose credit limit exceeds their state average.
-- SELECT 
--     COUNT(*) AS num_customers_above_avg
-- FROM SH.CUSTOMERS c
-- WHERE CUST_CREDIT_LIMIT > (
--     SELECT AVG(c2.CUST_CREDIT_LIMIT)
--     FROM SH.CUSTOMERS c2
--     WHERE c2.CUST_STATE_PROVINCE = c.CUST_STATE_PROVINCE
-- );

-- -- 8.Calculate total and average credit limit for customers born after 1980.
-- SELECT 
--     SUM(CUST_CREDIT_LIMIT) AS total_credit_limit,
--     AVG(CUST_CREDIT_LIMIT) AS average_credit_limit
-- FROM SH.CUSTOMERS
-- WHERE CUST_YEAR_OF_BIRTH > 1980;

-- -- 9.Find states having more than 50 customers.
-- SELECT 
--     CUST_STATE_PROVINCE,
--     COUNT(*) AS numbers_of_customers
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_STATE_PROVINCE
-- HAVING COUNT(*) > 50
-- ORDER BY numbers_of_customers DESC;

-- -- 10.List countries where the average credit limit is higher than the global average
-- SELECT 
--     COUNTRY_ID,
--     AVG(CUST_CREDIT_LIMIT) AS avg_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY COUNTRY_ID
-- HAVING AVG(CUST_CREDIT_LIMIT) > (
--     SELECT AVG(CUST_CREDIT_LIMIT) FROM SH.CUSTOMERS
-- )
-- ORDER BY avg_credit_limit DESC;


-- 11.Calculate the variance and standard deviation of customer credit limits by country.

-- SELECT 
--     COUNTRY_ID,
--     VARIANCE(CUST_CREDIT_LIMIT)as variance_of_credit_limit,
--     STDDEV(CUST_CREDIT_LIMIT) as standard_devation_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY COUNTRY_ID


--12.Find the state with the smallest range (max–min) in credit limits.

-- SELECT 
--     CUST_STATE_PROVINCE,
--     Max(CUST_CREDIT_LIMIT) as maximum_credit_limit,
--     MIN(CUST_CREDIT_LIMIT) as minimum_credit_limit,
--     (MAX(CUST_CREDIT_LIMIT) - MIN(CUST_CREDIT_LIMIT)) AS range_credit_limit

-- FROM SH.CUSTOMERS
-- GROUP BY CUST_STATE_PROVINCE
-- ORDER BY range_credit_limit
-- FETCH FIRST 1 ROWS  ONLY


--13.Show the total number of customers per income level and the percentage contribution of each.

-- SELECT 
--     CUST_INCOME_LEVEL,
--     COUNT(*) as total_num_of_customers,
--     ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),2) as percentage_contribution
-- FROM sh.CUSTOMERS
-- GROUP BY CUST_INCOME_LEVEL
-- ORDER BY total_num_of_customers DESC 


-- 14.For each income level, find how many customers have NULL credit limits.
-- SELECT
--     CUST_INCOME_LEVEL,
--     COUNT(*) AS number_of_customers
-- FROM SH.CUSTOMERS
-- WHERE CUST_CREDIT_LIMIT IS NULL
-- GROUP BY CUST_INCOME_LEVEL

-- 15.Display countries where the sum of credit limits exceeds 10 million.
-- SELECT
--     COUNTRY_ID,
--     SUM(CUST_CREDIT_LIMIT) as total_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY COUNTRY_ID
-- HAVING SUM(CUST_CREDIT_LIMIT) >10000000  

-- 16.Find the state that contributes the highest total credit limit to its country.

-- SELECT
--     CUST_STATE_PROVINCE,
--     COUNTRY_ID,
--     SUM(CUST_CREDIT_LIMIT) as total_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_STATE_PROVINCE,COUNTRY_ID
-- ORDER BY total_credit_limit DESC
-- FETCH FIRST 1 ROWS ONLY 

-- 17.Show total credit limit per year of birth, sorted by total descending.
-- SELECT
--     CUST_YEAR_OF_BIRTH,
--     SUM(CUST_CREDIT_LIMIT) as total_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_YEAR_OF_BIRTH
-- ORDER BY total_credit_limit DESC;



-- 18.Identify customers who hold the maximum credit limit in their respective country.
-- SELECT
--     COUNTRY_ID,
--     CUST_FIRST_NAME,
--     CUST_LAST_NAME,
--     CUST_CREDIT_LIMIT
-- FROM SH.CUSTOMERS c
-- WHERE CUST_CREDIT_LIMIT = (
--     SELECT MAX(CUST_CREDIT_LIMIT)
--     FROM SH.CUSTOMERS
--     WHERE COUNTRY_ID = c.COUNTRY_ID
-- )
-- ORDER BY COUNTRY_ID

-- Show the difference between maximum and average credit limit per country.
-- SELECT
--     COUNTRY_ID,
--     MAX(CUST_CREDIT_LIMIT) AS max_credit_limit,
--     AVG(CUST_CREDIT_LIMIT) AS avg_credit_limit,
--     MAX(CUST_CREDIT_LIMIT) - AVG(CUST_CREDIT_LIMIT) AS difference
-- FROM SH.CUSTOMERS
-- GROUP BY COUNTRY_ID
-- ORDER BY difference DESC

-- Display the overall rank of each state based on its total credit limit (using GROUP BY + analytic rank).
-- SELECT
--     CUST_STATE_PROVINCE,
--     SUM(CUST_CREDIT_LIMIT) AS total_credit_limit,
--     rank() OVER(ORDER BY SUM(CUST_CREDIT_LIMIT) DESC) as state_rank
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_STATE_PROVINCE
-- ORDER BY state_rank       


-- Assign row numbers to customers ordered by credit limit descending.
SELECT 
    CUST_ID,
    CUST_FIRST_NAME,
    CUST_LAST_NAME,
    ROW_NUMBER() OVER(ORDER BY CUST_CREDIT_LIMIT DESC ) AS row_num
FROM SH.CUSTOMERS
ORDER BY row_num     

-- Rank customers within each state by credit limit.
SELECT
    CUST_STATE_PROVINCE,
    CUST_ID,
    CUST_FIRST_NAME,
    CUST_LAST_NAME,
    CUST_CREDIT_LIMIT,
    RANK() OVER (
        PARTITION BY CUST_STATE_PROVINCE 
        ORDER BY CUST_CREDIT_LIMIT DESC
    ) AS state_rank
FROM SH.CUSTOMERS
ORDER BY CUST_STATE_PROVINCE, state_rank;


-- Use DENSE_RANK() to find the top 5 credit holders per country.
SELECT *
FROM (
    SELECT 
        CUST_ID,
        COUNTRY_ID,
        CUST_CREDIT_LIMIT,
        DENSE_RANK() OVER (
            PARTITION BY COUNTRY_ID 
            ORDER BY CUST_CREDIT_LIMIT DESC
        ) AS countries_rank
    FROM SH.CUSTOMERS
) ranked_customers
WHERE countries_rank <= 5
ORDER BY COUNTRY_ID, countries_rank




-- Divide customers into 4 quartiles based on their credit limit using NTILE(4)
SELECT
    CUST_ID,
    CUST_FIRST_NAME,
    CUST_LAST_NAME,
    CUST_CREDIT_LIMIT,
    NTILE(4) OVER (ORDER BY CUST_CREDIT_LIMIT ASC) AS credit_quartile
FROM SH.CUSTOMERS
ORDER BY credit_quartile, CUST_CREDIT_LIMIT

-- Calculate a running total of credit limits ordered by customer_id.
-- Show cumulative average credit limit by country.
-- Compare each customer’s credit limit to the previous one using LAG().
-- Show next customer’s credit limit using LEAD().
-- Display the difference between each customer’s credit limit and the previous one.
-- For each country, display the first and last credit limit using FIRST_VALUE() and LAST_VALUE().
-- Compute percentage rank (PERCENT_RANK()) of customers based on credit limit.
-- Show each customer’s position in percentile (CUME_DIST() function).
-- Display the difference between the maximum and current credit limit for each customer.
-- Rank income levels by their average credit limit.
-- Calculate the average credit limit over the last 10 customers (sliding window).
-- For each state, calculate the cumulative total of credit limits ordered by city.
-- Find customers whose credit limit equals the median credit limit (use PERCENTILE_CONT(0.5)).
-- Display the highest 3 credit holders per state using ROW_NUMBER() and PARTITION BY.
-- Identify customers whose credit limit increased compared to previous row (using LAG).
-- Calculate moving average of credit limits with a window of 3.
-- Show cumulative percentage of total credit limit per country.
-- Rank customers by age (derived from CUST_YEAR_OF_BIRTH).
-- Calculate difference in age between current and previous customer in the same state.
-- Use RANK() and DENSE_RANK() to show how ties are treated differently.
-- Compare each state’s average credit limit with country average using window partition.
-- Show total credit per state and also its rank within each country.
-- Find customers whose credit limit is above the 90th percentile of their income level.
-- Display top 3 and bottom 3 customers per country by credit limit.
-- Calculate rolling sum of 5 customers’ credit limit within each country.
-- For each marital status, display the most and least wealthy customers using analytical functions.

    







