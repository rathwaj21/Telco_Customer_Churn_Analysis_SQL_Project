-- 1. Check for NULLs in TotalCharges
SELECT COUNT(*) AS NullTotalCharges
FROM TelcoChurn
WHERE TotalCharges IS NULL;

-- 2. Check for blanks (sometimes TotalCharges has empty strings)
SELECT COUNT(*) AS BlankTotalCharges
FROM TelcoChurn
WHERE TRIM(TotalCharges) = '';

-- 3. Count total rows vs. unique CustomerID rows
SELECT COUNT(*) AS TotalRows,
       COUNT(DISTINCT CustomerID) AS UniqueCustomerIDs
FROM TelcoChurn;

-- 4. Check min/max for Tenure
SELECT MIN(Tenure) AS MinTenure, MAX(Tenure) AS MaxTenure
FROM TelcoChurn;

-- 5. Check min/max for MonthlyCharges
SELECT MIN(MonthlyCharges) AS MinMonthlyCharges,
       MAX(MonthlyCharges) AS MaxMonthlyCharges
FROM TelcoChurn;

-- 6. Check min/max for TotalCharges
SELECT MIN(TotalCharges) AS MinTotalCharges,
       MAX(TotalCharges) AS MaxTotalCharges
FROM TelcoChurn;

-- 7. Find any negative charges or tenure (should be zero or positive only)
SELECT *
FROM TelcoChurn
WHERE Tenure < 0 OR MonthlyCharges < 0 OR TotalCharges < 0;


