--desc sh.CUSTOMERS;

--1. Find customers born after the year 1990.
--select * from sh.customers where CUST_YEAR_OF_BIRTH >1990

--2. List all male customers (`CUST_GENDER = 'M'`).
--select * from sh.customers where CUST_GENDER = 'M'

-- 3. Retrieve all female customers (`CUST_GENDER = 'F'`) living in Sydney.

--SELECT CUST_GENDER,CUST_CITY FROM SH.CUSTOMERS WHERE CUST_GENDER = 'F' AND CUST_CITY = 'Sydney'


--4. Find customers with income level `"G: 130,000 - 149,999"`.
--SELECT * FROM SH.CUSTOMERS WHERE CUST_INCOME_LEVEL  = 'G: 130,000 - 149,999'


-- 5. Get all customers with a credit limit above 10,000.
--SELECT CUST_ID FROM SH.CUSTOMERS WHERE CUST_CREDIT_LIMIT =10000;


-- 6. Retrieve customers from the state "California".

--SELECT * FROM SH.CUSTOMERS WHERE CUST_STATE_PROVINCE='CALIFORNIA'


--7. Find customers who have provided an email address.
--SELECT CUST_ID,CUST_EMAIL FROM SH.CUSTOMERS

--8. List customers with missing marital status.
--SELECT CUST_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_MARITAL_STATUS FROM sh.CUSTOMERS WHERE CUST_MARITAL_STATUS IS NULL

--9. Find customers whose postal code starts with "53".
-- SELECT CUST_ID, 
--        CUST_FIRST_NAME, 
--        CUST_LAST_NAME, 
--        CUST_POSTAL_CODE
-- FROM SH.CUSTOMERS
-- WHERE CUST_POSTAL_CODE LIKE '53%';


-- 10. Get customers born before 1980 with a credit limit above 5,000.
-- SELECT CUST_ID,
--        CUST_FIRST_NAME,
--        CUST_LAST_NAME,
--        CUST_YEAR_OF_BIRTH,
--        CUST_CREDIT_LIMIT
-- FROM SH.CUSTOMERS
-- WHERE CUST_YEAR_OF_BIRTH < 1980
--   AND CUST_CREDIT_LIMIT > 5000;


--11. Retrieve customers from Almere or Amersfoort.
-- SELECT CUST_ID,
--        CUST_FIRST_NAME,
--        CUST_LAST_NAME,
--        CUST_CITY
-- FROM SH.CUSTOMERS
-- WHERE CUST_CITY IN ('Almere', 'Amersfoort')

-- 12. Find customers who do not have a credit limit.
-- SELECT CUST_ID,
--        CUST_FIRST_NAME,
--        CUST_LAST_NAME,
--        CUST_CREDIT_LIMIT
-- FROM SH.CUSTOMERS WHERE CUST_CREDIT_LIMIT IS  NULL
       

 -- 13. List customers whose phone number starts with "487".
-- SELECT  CUST_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_MAIN_PHONE_NUMBER FROM SH.CUSTOMERS WHERE CUST_MAIN_PHONE_NUMBER LIKE '487%'     


-- 14. Find married customers with income level `"Medium"`.
-- SELECT CUST_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_MARITAL_STATUS,CUST_INCOME_LEVEL FROM SH.CUSTOMERS WHERE CUST_MARITAL_STATUS ='married' 
 
--15. Get customers whose last name starts with "G".
-- select CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME FROM SH.CUSTOMERS WHERE CUST_LAST_NAME LIKE 'G%'

--16. Find customers with city_id = 51057.
-- SELECT CUST_ID, CUST_FIRST_NAME,CUST_LAST_NAME,CUST_CITY,CUST_CITY_ID FROM SH.CUSTOMERS WHERE CUST_CITY_ID =51057

-- 17. Retrieve all customers who are valid (`CUST_VALID = 'A'`).
-- SELECT CUST_ID, CUST_FIRST_NAME,CUST_LAST_NAME,CUST_VALID FROM SH.CUSTOMERS WHERE CUST_VALID ='A'

-- 18. Find customers whose effective start date (`CUST_EFF_FROM`) is after 2020.
-- SELECT CUST_ID, CUST_FIRST_NAME,CUST_LAST_NAME,CUST_EFF_FROM FROM SH.CUSTOMERS WHERE CUST_EFF_FROM > TO_DATE('2020-12-31', 'YYYY-MM-DD');


--19. Retrieve customers whose effective end date (`CUST_EFF_TO`) is before 2021.
-- SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME, CUST_EFF_TO
-- FROM SH.CUSTOMERS
-- WHERE CUST_EFF_TO < TO_DATE('2021-01-01', 'YYYY-MM-DD');


-- 20. Find customers with credit limit between 5,000 and 9,000.
-- SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME, CUST_CREDIT_LIMIT
-- FROM SH.CUSTOMERS 
-- WHERE CUST_CREDIT_LIMIT BETWEEN 5000 AND 9000


-- 21. Get all customers from country_id = 101.

-- SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME,COUNTRY_ID FROM SH.CUSTOMERS WHERE COUNTRY_ID = 101


-- 22. Find customers whose email ends with `"@company.example.com"`.
--SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME,CUST_EMAIL FROM SH.CUSTOMERS WHERE CUST_EMAIL LIKE '%@company.example.com'


--23. List customers with `CUST_TOTAL_ID = 52772`
--SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME,CUST_TOTAL_ID FROM SH.CUSTOMERS WHERE CUST_TOTAL_ID = 52772

-- 24. Find customers with `CUST_SRC_ID` in (10, 20, 30).
--SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME,CUST_SRC_ID FROM SH.CUSTOMERS WHERE CUST_SRC_ID = 10 OR CUST_SRC_ID = 20 OR CUST_SRC_ID = 30



-- 25. Retrieve customers who either do not have email or do not have a credit limit.
-- SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME, CUST_EMAIL,CUST_CREDIT_LIMIT 
-- FROM SH.CUSTOMERS 
-- WHERE CUST_EMAIL IS NULL OR CUST_CREDIT_LIMIT IS NULL


--26. Count the number of customers in each city.
-- SELECT CUST_CITY, COUNT(*) AS NUM_CUSTOMERS
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_CITY
-- ORDER BY NUM_CUSTOMERS DESC;


-- 27. Find cities with more than 100 customers.
-- SELECT CUST_CITY, COUNT(*) AS NUM_CUSTOMERS
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_CITY
-- HAVING COUNT(*) > 100
-- ORDER BY NUM_CUSTOMERS DESC;


--  28. Count the number of customers in each state.
-- select CUST_STATE_PROVINCE, COUNT(*) AS NUM_CUSTOMERS 
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_STATE_PROVINCE 
-- ORDER BY NUM_CUSTOMERS


-- 29. Find states with fewer than 50 customers.
-- SELECT CUST_STATE_PROVINCE,COUNT(*) AS NUM_CUSTOMERS
-- FROM SH.CUSTOMERS 
-- GROUP BY CUST_STATE_PROVINCE 
-- HAVING COUNT(*)<50 
-- ORDER BY NUM_CUSTOMERS

-- 30. Calculate the average credit limit of customers in each city.
-- SELECT CUST_CITY, AVG(CUST_CREDIT_LIMIT) AS AVERAGE_CREDIT_LIMIT 
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_CITY 
-- ORDER BY AVERAGE_CREDIT_LIMIT DESC


-- 31. Find cities with average credit limit greater than 8,000.
-- SELECT CUST_CITY, AVG(CUST_CREDIT_LIMIT) AS AVERAGE_CREDIT_LIMIT 
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_CITY 
-- HAVING AVG(CUST_CREDIT_LIMIT)
-- ORDER BY AVERAGE_CREDIT_LIMIT DESC



-- 32. Count customers by marital status.
-- SELECT CUST_MARITAL_STATUS, COUNT(*) AS NUM_CUSTOMERS
-- FROM SH.CUSTOMERS 
-- GROUP BY CUST_MARITAL_STATUS 
-- ORDER BY NUM_CUSTOMERS 


-- 33. Find marital statuses with more than 200 customers.
-- SELECT CUST_MARITAL_STATUS, COUNT(*) AS NUM_CUSTOMERS
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_MARITAL_STATUS
-- HAVING COUNT(*) >200
-- ORDER BY NUM_CUSTOMERS DESC

-- 34. Calculate the average year of birth grouped by gender.
-- SELECT CUST_GENDER, AVG(CUST_YEAR_OF_BIRTH) AS average_year_of_birth
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_GENDER
-- ORDER BY average_year_of_birth DESC

-- 35. Find genders with average year of birth after 1990.
-- SELECT CUST_GENDER, AVG(CUST_YEAR_OF_BIRTH) AS average_year_of_birth
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_GENDER
-- HAVING AVG(CUST_YEAR_OF_BIRTH) >1990 
-- ORDER BY average_year_of_birth DESC


-- 36. Count the number of customers in each country.
-- SELECT COUNTRY_ID, COUNT(*) AS NUM_CUSTOMERS
-- FROM SH.CUSTOMERS
-- GROUP BY COUNTRY_ID
-- ORDER BY NUM_CUSTOMERS 

-- 37. Find countries with more than 1,000 customers.
-- SELECT COUNTRY_ID, COUNT(*) AS NUM_CUSTOMERS
-- FROM SH.CUSTOMERS
-- GROUP BY COUNTRY_ID
-- HAVING COUNT(*) >1000
-- ORDER BY NUM_CUSTOMERS desc


-- 38. Calculate the total credit limit per state.
-- SELECT CUST_STATE_PROVINCE, SUM(CUST_CREDIT_LIMIT) AS total_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_STATE_PROVINCE
-- ORDER BY total_credit_limit DESC

-- 39. Find states where the total credit limit exceeds 100,000.
-- SELECT CUST_STATE_PROVINCE, SUM(CUST_CREDIT_LIMIT) AS total_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_STATE_PROVINCE 
-- HAVING SUM(CUST_CREDIT_LIMIT) >100000
-- ORDER BY total_credit_limit DESC

-- 40. Find the maximum credit limit for each income level.
-- SELECT CUST_INCOME_LEVEL, MAX(CUST_CREDIT_LIMIT) AS MAX_CREDIT_LIMIT
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_INCOME_LEVEL
-- ORDER BY MAX_CREDIT_LIMIT DESC;

-- 41. Find income levels where the maximum credit limit is greater than 15,000.
-- SELECT CUST_INCOME_LEVEL, MAX(CUST_CREDIT_LIMIT) AS MAX_CREDIT_LIMIT
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_INCOME_LEVEL
-- HAVING MAX(CUST_CREDIT_LIMIT) >15000
-- ORDER BY MAX_CREDIT_LIMIT DESC;

-- 42. Count customers by year of birth.
-- SELECT CUST_YEAR_OF_BIRTH, COUNT(*) AS NUM_CUSTOMERS
-- FROM SH.CUSTOMERS 
-- GROUP BY CUST_YEAR_OF_BIRTH
-- ORDER BY NUM_CUSTOMERS DESC

-- 43. Find years of birth with more than 50 customers.
-- SELECT CUST_YEAR_OF_BIRTH, COUNT(*) AS NUM_CUSTOMERS
-- FROM SH.CUSTOMERS 
-- GROUP BY CUST_YEAR_OF_BIRTH
-- HAVING COUNT(*)>50
-- ORDER BY NUM_CUSTOMERS DESC

-- 44. Calculate the average credit limit per marital status.
-- SELECT CUST_MARITAL_STATUS, AVG(CUST_CREDIT_LIMIT) AS average_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_MARITAL_STATUS
-- ORDER BY average_credit_limit DESC

-- 45. Find marital statuses with average credit limit less than 5,000.
-- SELECT CUST_MARITAL_STATUS, AVG(CUST_CREDIT_LIMIT) AS average_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_MARITAL_STATUS
-- HAVING AVG(CUST_CREDIT_LIMIT)<5000
-- ORDER BY average_credit_limit DESC

-- 46. Count the number of customers by email domain (e.g., `company.example.com`).

-- SELECT SUBSTR(CUST_EMAIL, INSTR(CUST_EMAIL, '@') + 1) AS EMAIL_DOMAIN,COUNT(*) AS CUSTOMER_COUNT
-- FROM SH.CUSTOMERS
-- GROUP BY SUBSTR(CUST_EMAIL, INSTR(CUST_EMAIL, '@') + 1)
-- ORDER BY CUSTOMER_COUNT DESC;



-- 47. Find email domains with more than 300 customers.

SELECT SUBSTR(CUST_EMAIL, INSTR(CUST_EMAIL, '@') + 1) AS EMAIL_DOMAIN,COUNT(*) AS CUSTOMER_COUNT
FROM SH.CUSTOMERS
GROUP BY SUBSTR(CUST_EMAIL, INSTR(CUST_EMAIL, '@') + 1)
HAVING count(*)>300
ORDER BY CUSTOMER_COUNT DESC;

-- 48. Calculate the average credit limit by validity (`CUST_VALID`).
-- SELECT CUST_VALID, AVG(CUST_CREDIT_LIMIT) AS average_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_VALID
-- ORDER BY average_credit_limit desc

-- 49. Find validity groups where the average credit limit is greater than 7,000.
-- SELECT CUST_VALID, AVG(CUST_CREDIT_LIMIT) AS average_credit_limit
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_VALID
-- HAVING AVG(CUST_CREDIT_LIMIT) > 7000
-- ORDER BY average_credit_limit desc



-- 50. Count the number of customers per state and city combination where there are more than 50 customers.
-- SELECT CUST_STATE_PROVINCE, CUST_CITY, COUNT(*) AS NUM_CUSTOMERS
-- FROM SH.CUSTOMERS
-- GROUP BY CUST_STATE_PROVINCE, CUST_CITY
-- HAVING COUNT(*) > 50
-- ORDER BY NUM_CUSTOMERS DESC;

