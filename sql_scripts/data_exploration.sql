select
	Gender,
	COUNT(Gender) as TotalCount,
	COUNT(Gender) * 100.0 / (select COUNT(*) from stg_Churn) as Percentage
from stg_Churn
group by Gender;

-- If 100.0 is not multiplied, you'll get Percentage as 0 because you are dividing integers

select count(*) from stg_Churn;

select
	Contract,
	COUNT(Contract) as TotalCount,
	COUNT(Contract) * 100.0 / (select COUNT(*) from stg_Churn) as Percentage
from stg_Churn
group by Contract;

select 
	Customer_Status,
	COUNT(Customer_Status) as TotalCount,
	SUM(Total_Revenue) as TotalRev,
	SUM(Total_Revenue) / (select SUM(Total_Revenue) from stg_Churn) * 100 as RevPercentage
from stg_Churn
group by Customer_Status;

select
	State,
	COUNT(State) as TotalCount,
	COUNT(State) * 100.0 / (select COUNT(*) from stg_Churn) as Percentage
from stg_Churn
group by State
order by Percentage DESC;

select distinct Internet_Type
from stg_Churn;

