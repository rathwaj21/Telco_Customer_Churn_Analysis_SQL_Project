-- 1. How many customers churned vs. stayed
SELECT Churn, COUNT(*) AS NumCustomers
FROM TelcoChurn
GROUP BY Churn;

-- 2. How does churn differ by Contract (Month-to-month, One year, Two year)
SELECT Contract, Churn, COUNT(*) AS NumCustomers
FROM TelcoChurn
GROUP BY Contract, Churn
ORDER BY Contract, Churn;

-- 3. Are seniors more likely to churn?
SELECT SeniorCitizen, Churn, COUNT(*) AS NumCustomers
FROM TelcoChurn
GROUP BY SeniorCitizen, Churn
ORDER BY SeniorCitizen, Churn;

-- 4. Do higher spenders churn more or less?
SELECT Churn, 
       ROUND(AVG(MonthlyCharges), 2) AS AvgMonthlyCharges,
       ROUND(AVG(TotalCharges), 2) AS AvgTotalCharges
FROM TelcoChurn
GROUP BY Churn;

-- 5. How long do churned customers typically stay?
SELECT Churn, 
       ROUND(AVG(Tenure), 2) AS AvgTenureMonths
FROM TelcoChurn
GROUP BY Churn;

-- 6. Who are the highest value customers we lost?
SELECT CustomerID, MonthlyCharges, TotalCharges, Tenure
FROM TelcoChurn
WHERE Churn = 'Yes'
ORDER BY TotalCharges DESC
LIMIT 10;