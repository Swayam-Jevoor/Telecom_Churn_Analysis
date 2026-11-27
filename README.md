# Telecom Customer Churn Analysis

End-to-end churn analysis of a telecom customer base using SQL Server, Power BI, and a Python Random Forest model, from raw data to a dashboard that profiles customers likely to churn.

## Dashboard Preview

### Summary Page

![](https://github.com/user-attachments/assets/d52a9f2c-8930-4117-acd5-51044bbf0653)


### Churn Prediction Page

![](https://github.com/user-attachments/assets/0a2a074e-f40e-4399-96bd-9e833f1e6278)

---

## Business Problem

Telecom companies lose revenue when customers leave. This project answers:

1. How many customers churn, and how much revenue do they represent?
2. Which customer groups (contract, internet type, age, state) churn the most?
3. Why do customers leave?
4. Which new customers are most likely to churn, so the business can act early?

---

## Dataset

- **6,418 customers**, 32 attributes (demographics, services, contract, billing, revenue, churn reason)
- **4,275** stayed, **1,732** churned, **411** newly joined
- Source: dataset provided with the Pivotalstats tutorial

---

## Tools and Skills

| Area | Tools | What I did |
|---|---|---|
| Database | SQL Server (SSMS) | Staged raw data, profiled nulls, cleaned data, created views |
| Visualization | Power BI, Power Query, DAX | Grouped age and tenure, built measures, designed 2-page dashboard |
| Machine Learning | Python, pandas, scikit-learn, Jupyter | Encoded features, trained a Random Forest, predicted churn for new customers |

---

## Project Workflow

1. **ETL and cleaning (SQL Server):** loaded data into a staging table, checked nulls in every column (`null_data.sql`), replaced nulls with meaningful defaults using `ISNULL` (`cleaned_data.sql`), and created views separating existing customers from new joiners (`views.sql`).
2. **Exploration (SQL):** distribution of gender, contract, state, and revenue by customer status (`data_exploration.sql`).
3. **Power BI modeling:** added churn flag, monthly charge range, age and tenure groups, and unpivoted service columns; built DAX measures such as Churn Rate, Total Churn, and New Joiners.
4. **Dashboard:** a Summary page (churn rate, demographics, services, contracts, churn reasons) and a Churn Prediction page.
5. **Machine learning:** trained a Random Forest on existing customers (80/20 split) and scored the 411 new joiners.

---

## Key Findings

- **Overall churn rate is 28.8%** among existing customers (1,732 of 6,007).
- **Contract type is the biggest lever:** month-to-month customers churn at **52.4%**, versus 11.2% on one-year and **2.8% on two-year** contracts.
- **Fiber optic customers churn the most:** 42.5%, versus 27.6% for cable and 20.8% for DSL.
- **Competitors drive churn:** 43.9% of churned customers left for a competitor, followed by attitude (17.4%), dissatisfaction (17.3%), and price (11.3%).
- **Top model drivers:** total revenue, contract type, total charges, and monthly charge.

**Possible actions:** push month-to-month customers toward longer contracts with incentives, review fiber optic service quality and pricing, and benchmark offers against competitors.

---

## Model Performance

Random Forest (100 trees, 80/20 train-test split, `random_state=42`):

| Metric | Result |
|---|---|
| Accuracy | 84.6% |
| Churn precision | 79% |
| Churn recall | 61% |
| Churn F1-score | 0.69 |

The model is good at confirming loyal customers but **misses about 4 in 10 real churners**.

### Limitations

- The first model flagged **373 of 411 new customers (~91%) as likely churners**, which is not realistic. This points to the need for tuning and checking for class imbalance.
- Categorical features were label-encoded, which can mislead tree models on nominal data such as state.
- No cross-validation or hyperparameter search yet.

---

## What I Added

- Documented findings and model limitations (above)
- Re-ran the model and checked the predictions critically

---

## Contact

**Swayam Jevoor** | [LinkedIn](https://www.linkedin.com/in/swayam-jevoor-905498358) | jevoorswayam095@gmail.com
