create database healthcare;
use healthcare;
select * from healthcare_dataset;
select * from healthcare_dataset limit 10;


          -- PATIENT DEMOGRAPHICS AND OVERVIEW
          
-- TOTAL PATIENT COUNT:
select count(*) as TOTAL_PATIENT from healthcare_dataset;

-- GENDER WISE COUNT:
 select Gender,count(*) as GENDER_COUNT from healthcare_dataset
 group by Gender;
 
 -- AVG AGE OF PATIENTS:
SELECT ROUND(AVG(Age), 1) AS Average_Age FROM healthcare_dataset;


-- AGE GROUP ANALYSIS
SELECT CASE
    WHEN Age < 18 THEN 'Child'
    WHEN Age BETWEEN 18 AND 60 THEN 'Adult'
    ELSE 'Senior'
END AS Age_group,
COUNT(*) AS Total_patients
FROM healthcare_dataset GROUP BY age_group;


               -- MEDICAL CONDITIONS ANALYSIS
               
               
-- PATIENT WITH MEDICAL CONDITION:
select Name,Medical_Condition from healthcare_dataset;

-- TOTAL PATIENT PER CONDITION:
 select Medical_Condition ,count(*) as TOTAL_PATIENTS 
 from healthcare_dataset 
 group by Medical_Condition order by TOTAL_PATIENTS DESC;
 
 -- TOP 5 MEDICAL CONDITIONS:
 select Medical_Condition ,count(*) as TOTAL_PATIENTS from healthcare_dataset group by 
 Medical_Condition order by TOTAL_PATIENTS desc limit 5;
 
 -- AVERAGE AGE PER CONDITION:
 select Medical_Condition,ROUND(avg(Age), 1) as Avg_Age,
 min(Age) as Min_Age,
 max(Age) as Max_Age from 
 healthcare_dataset group by Medical_Condition ORDER BY Avg_Age desc;
 
 
 -- PATIENT COUNT BY GENDER AND MEDICAL CONDITION:
 select Medical_Condition,Gender,count(*) as PATIENT_COUNT from healthcare_dataset 
 group by Medical_Condition, Gender
ORDER BY Medical_Condition, Patient_Count DESC;


-- CONDITION BY ADMISSION TYPE:
SELECT Medical_Condition,Admission_Type, COUNT(*) AS Total
FROM healthcare_dataset
GROUP BY Medical_Condition, Admission_Type
ORDER BY Medical_Condition, Total DESC;



          -- BILLING ANALYSIS

 -- AVERAGE BILLING AMOUNT BY MEDICAL CONDITION?
 
 select Medical_Condition,ROUND(avg(Billing_Amount), 2) as AVERAGE_BILLING_AMOUNT
 from healthcare_dataset group by Medical_Condition
 order by AVERAGE_BILLING_AMOUNT DESC;
 

-- BILLING SATATUS PER CONDITION
select Medical_Condition,
ROUND(avg(Billing_Amount), 2) as Avg_Billing,
ROUND(min(Billing_Amount), 2) as Min_Billing,
ROUND(max(Billing_Amount), 2) as Max_Billing,
ROUND(SUM(Billing_Amount), 2)as Total_Billing from healthcare_dataset
group by Medical_Condition order by Avg_Billing desc;



-- BILLING BY INSURANCE PROVIDER
 select Insurance_Provider,
 count(*) as Total_patients,
 ROUND(Avg(Billing_Amount), 2) as Avg_Billing,
 ROUND(Sum(Billing_Amount), 2) as Total_Billing
 from healthcare_dataset 
 group by Insurance_Provider order by Total_Billing desc;
 
 
 -- BILLING BY ADMISSION TYPE:
 
 SELECT Admission_Type,
       ROUND(AVG(Billing_Amount), 2) AS Avg_Billing,
       COUNT(*) AS Total_Patients
FROM healthcare_dataset
GROUP BY Admission_Type
ORDER BY Avg_Billing DESC;


-- TOP 10 HIGHEST BILLED PATIENTS:

select Name,Medical_Condition,Insurance_Provider,
ROUND(Billing_Amount ,2) as BILLING_AMOUNT 
from healthcare_dataset order by  BILLING_AMOUNT desc LIMIT 10;


        -- HOSPITAL AND DOCTOR ANALYSIS

-- TOP 10 HOSPITALS BY PATIENT VOLUME
select Hospital,count(*) as Total_patients from healthcare_dataset group by Hospital
 order by Total_patients  desc limit 10;
 
 -- TOP 10 DOCTORS BY PATIENT COUNT
 select Doctor,count(*) as Total_patients  from healthcare_dataset group by Doctor
 order by Total_patients  desc limit 10;
 
 
 -- AVERAGE BILLING PER DOCTOR
 
 SELECT Doctor, COUNT(*) AS Total_Patients,
ROUND(AVG(Billing_Amount), 2) AS Avg_Billing
FROM healthcare_dataset GROUP BY Doctor
ORDER BY Avg_Billing DESC LIMIT 10;


-- MOST COMMON CONDITON PER HOSPITAL

select Hospital,Medical_Condition,count(*) as Total from healthcare_dataset
 group by Hospital,Medical_Condition order by Total desc limit 10;
 
 
 -- ADMISSION TYPE PER HOSPITAL
 
 select Hospital,Admission_Type,count(*)as Total from healthcare_dataset 
 group by Hospital,Admission_Type
 order by Total desc limit 10;
 
                     
                     -- LENGTH OF STAY ANALYSIS
 
--  AVERAGE LENGTH OF STAY:

SELECT Medical_Condition,
ROUND(AVG(DATEDIFF(Discharge_Date, Date_of_Admission)), 1) AS Avg_Stay_Days
FROM healthcare_dataset
GROUP BY Medical_Condition
ORDER BY Avg_Stay_Days DESC;


-- AVERAGE STAY BY ADMISSION TYPE:

SELECT Admission_Type,
ROUND(AVG(DATEDIFF(Discharge_Date, Date_of_Admission)), 1) AS Avg_Stay_Days,
count(*) as Total_patients FROM healthcare_dataset
GROUP BY Admission_Type
ORDER BY Avg_Stay_Days DESC;


-- LONGEST STAY:
 
 SELECT Name, Medical_Condition,
       Admission_Type,
       DATEDIFF(Discharge_Date, Date_of_Admission) AS Stay_Days
FROM healthcare_dataset
ORDER BY Stay_Days DESC
LIMIT 5;


