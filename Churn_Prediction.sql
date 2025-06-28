

-- Creating New Database
Create Database db_churn;

use db_churn;

-- Using Table Data Import Wizard to Create Table and Import Data
select * from stg_churn;

-- ------------------------------------- Data Exploration ---------------------------------------------------- 
select Gender, count(gender) as Total_Count, 
round(((count(gender) / (select count(*) from stg_churn))*100),2) as percentage 
from stg_churn group by gender;

select Contract, count(Contract) as Total_Count, 
round(((count(Contract) / (select count(*) from stg_churn))*100),2) as percentage 
from stg_churn group by Contract Order by contract;

select Customer_status, count(customer_status) as Total_Count,sum(total_revenue) as total_revenue,
round(((sum(total_revenue) / (select sum(total_revenue) from stg_churn))*100),2) as percentage 
from stg_churn group by Customer_status;

select State, count(state) as Total_Count, 
round(((count(state) / (select count(*) from stg_churn))*100),2) as percentage 
from stg_churn group by state Order by percentage desc;

-- --------------------------------------------Checking Null Values--------------------------------------------------

SELECT 
    SUM(case WHEN Customer_ID IS NULL OR TRIM(Customer_ID) = '' THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(case WHEN Gender IS NULL OR TRIM(Gender) = '' THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(case WHEN Age IS NULL OR TRIM(Age) = '' THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(case WHEN Married IS NULL OR TRIM(Married) = '' THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(case WHEN State IS NULL OR TRIM(State) = '' THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(case WHEN Number_of_Referrals IS NULL OR TRIM(Number_of_Referrals) = '' THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(case WHEN Tenure_in_Months IS NULL OR TRIM(Tenure_in_Months) = '' THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(case WHEN Value_Deal IS NULL OR TRIM(Value_Deal) = '' THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(case WHEN Phone_Service IS NULL OR TRIM(Phone_Service) = '' THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(case WHEN Multiple_Lines IS NULL OR TRIM(Multiple_Lines) = '' THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(case WHEN Internet_Service IS NULL OR TRIM(Internet_Service) = '' THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(case WHEN Internet_Type IS NULL OR TRIM(Internet_Type) = '' THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(case WHEN Online_Security IS NULL OR TRIM(Online_Security) = '' THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(case WHEN Online_Backup IS NULL OR TRIM(Online_Backup) = '' THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(case WHEN Device_Protection_Plan IS NULL OR TRIM(Device_Protection_Plan) = '' THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(case WHEN Premium_Support IS NULL OR TRIM(Premium_Support) = '' THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(case WHEN Streaming_TV IS NULL OR TRIM(Streaming_TV) = '' THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(case WHEN Streaming_Movies IS NULL OR TRIM(Streaming_Movies) = '' THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(case WHEN Streaming_Music IS NULL OR TRIM(Streaming_Music) = '' THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(case WHEN Unlimited_Data IS NULL OR TRIM(Unlimited_Data) = '' THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(case WHEN Contract IS NULL OR TRIM(Contract) = '' THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(case WHEN Paperless_Billing IS NULL OR TRIM(Paperless_Billing) = '' THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(case WHEN Payment_Method IS NULL OR TRIM(Payment_Method) = '' THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(case WHEN Monthly_Charge IS NULL OR TRIM(Monthly_Charge) = '' THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(case WHEN Total_Charges IS NULL OR TRIM(Total_Charges) = '' THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(case WHEN Total_Refunds IS NULL OR TRIM(Total_Refunds) = '' THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(case WHEN Total_Extra_Data_Charges IS NULL OR TRIM(Total_Extra_Data_Charges) = '' THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(case WHEN Total_Long_Distance_Charges IS NULL OR TRIM(Total_Long_Distance_Charges) = '' THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(case WHEN Total_Revenue IS NULL OR TRIM(Total_Revenue) = '' THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(case WHEN Customer_Status IS NULL OR TRIM(Customer_Status) = '' THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(case WHEN Churn_Category IS NULL OR TRIM(Churn_Category) = '' THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(case WHEN Churn_Reason IS NULL OR TRIM(Churn_Reason) = '' THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM stg_Churn;

-- ----------------------------------------- Preparing New table for Visualization For BI ------------------------------- 
CREATE TABLE prod_Churn AS
SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,

    IFNULL(NULLIF(TRIM(Value_Deal), ''), 'None') AS Value_Deal,
    Phone_Service,
    IFNULL(NULLIF(TRIM(Multiple_Lines), ''), 'No') AS Multiple_Lines,
    Internet_Service,
    IFNULL(NULLIF(TRIM(Internet_Type), ''), 'None') AS Internet_Type,
    IFNULL(NULLIF(TRIM(Online_Security), ''), 'No') AS Online_Security,
    IFNULL(NULLIF(TRIM(Online_Backup), ''), 'No') AS Online_Backup,
    IFNULL(NULLIF(TRIM(Device_Protection_Plan), ''), 'No') AS Device_Protection_Plan,
    IFNULL(NULLIF(TRIM(Premium_Support), ''), 'No') AS Premium_Support,
    IFNULL(NULLIF(TRIM(Streaming_TV), ''), 'No') AS Streaming_TV,
    IFNULL(NULLIF(TRIM(Streaming_Movies), ''), 'No') AS Streaming_Movies,
    IFNULL(NULLIF(TRIM(Streaming_Music), ''), 'No') AS Streaming_Music,
    IFNULL(NULLIF(TRIM(Unlimited_Data), ''), 'No') AS Unlimited_Data,

    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,

    IFNULL(NULLIF(TRIM(Churn_Category), ''), 'Others') AS Churn_Category,
    IFNULL(NULLIF(TRIM(Churn_Reason), ''), 'Others') AS Churn_Reason

FROM stg_Churn;

select * from prod_churn;

-- ---------------------------------------------- Creating Training and Testing Data For Random Forest Model-------------------------------------- 

-- Training Data
create view vw_ChurnData as 
select Customer_ID, Gender, Age, Married,State,	Number_of_Referrals	,Value_Deal,	Phone_Service,
	Multiple_Lines,	Internet_Service,	Internet_Type,	Online_Security,	Online_Backup,
	Device_Protection_Plan,	Premium_Support,	Streaming_TV,
	Streaming_Movies,	Streaming_Music,	Unlimited_Data,
	Contract,	Paperless_Billing,	Payment_Method,	Monthly_Charge,	Customer_Status
from prod_churn where customer_status in("churned","stayed");

select * from vw_ChurnData;

-- Testing Data
create view vw_JoinData as 
select Customer_ID, Gender, Age, Married,State,	Number_of_Referrals	,Value_Deal,	Phone_Service,
	Multiple_Lines,	Internet_Service,	Internet_Type,	Online_Security,	Online_Backup,
	Device_Protection_Plan,	Premium_Support,	Streaming_TV,
	Streaming_Movies,	Streaming_Music,	Unlimited_Data,
	Contract,	Paperless_Billing,	Payment_Method,	Monthly_Charge
    from prod_churn where customer_status = "Joined";
    
select * from vw_JoinData;


