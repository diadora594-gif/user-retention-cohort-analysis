# User Retention & Cohort Analysis Framework

## 📊 Project Overview
This project focuses on calculating, visualizing, and analyzing user lifecycle retention metrics using dynamic cohort analysis. The analytical workflow processes raw transactional and relational database logs, aggregates granular activity into monthly offsets, and evaluates the long-term retention intensity across different acquisition channels (**Organic Traffic** vs. **Paid Promo Campaigns**).

The repository contains:
1. `postgresql_cohort_retention_query.sql` — Production-grade PostgreSQL script executing complex CTEs, date-normalization regex, and interval offsets.
2. `User_Retention_&_Cohort_Analysis_Dashboard.xlsx` — An interactive business dashboard featuring professional formatting and retention rate heatmaps.

---

## 📈 Key Analytical Insights & Conclusions

### 1. Executive Summary
The cohort matrix demonstrates a high and stable overall user retention rate, indicating strong and sustainable product value for the target audience.

### 2. Short-Term Retention (Month 1 Retention)
All cohorts exhibit a highly confident start, with Month 1 retention fluctuating between **70% and 76%**. This significantly exceeds industry benchmarks and validates the high effectiveness of the product's onboarding flow.

### 3. Long-Term Retention Dynamics
The longest tracking cohort (January) shows a smooth, predictable decline in activity. Over a six-month period, retention drops linearly from 76% to 40%. A monthly churn rate of approximately 10% indicates a steady, linear audience attrition rather than sudden drops.

### 4. Cross-Cohort Comparison
All cohorts from January to June display an almost identical retention structure. This trend confirms product stability, consistent release quality, and a uniform user experience over time.

### 5. Paid Promo Segment Analysis (`promo_signup_flag = 1`)
Users acquired through promotional campaigns demonstrate significantly lower retention performance:
* **Month 1 Retention:** Drops to 47–62% (compared to organic benchmarks).
* **Months 4–5 Drop:** Attrition accelerates sharply, with retention plummeting to 9–18%.
* **Behavioral Insight:** There is a high probability of immediate user churn right after the promotional bonus or upfront incentive is consumed.

---

## 💡 Actionable Recommendations
* 🎯 **Shift Acquisition Focus:** Scale down mass promotional campaigns and pivot marketing budgets toward organic and high-intent acquisition channels.
* 🔄 **Restructure Incentive Mechanics:** Redesign the bonus system to reward milestone retention (e.g., unlocking rewards at Months 2–3) rather than providing full upfront sign-up bonuses.
* ⚡ **Optimize Re-engagement:** Deploy targeted reactivation and lifecycle marketing campaigns specifically tailored to promo segments before their critical Month 4 churn window.

**Final Summary:** A strategic shift toward acquisition quality over quantity will preserve a highly stable and valuable core of monthly active users (MAU).

---

## 📅 Cohort Retention Matrices

### 🟢 Organic Acquisition Cohorts (Retention Rate %)
| Cohort Month | Month 0 | Month 1 | Month 2 | Month 3 | Month 4 | Month 5 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **2025-01** | 100% | 76.0% | 68.3% | 52.9% | 47.1% | 40.4% |
| **2025-02** | 100% | 67.3% | 62.5% | 59.6% | 49.0% | — |
| **2025-03** | 100% | 72.0% | 74.4% | 63.4% | — | — |
| **2025-04** | 100% | 70.5% | 58.1% | — | — | — |
| **2025-05** | 100% | 70.4% | — | — | — | — |
| **2025-06** | 100% | — | — | — | — | — |

### ⚡ Promo Campaign Acquisition Cohorts (Retention Rate %)
| Cohort Month | Month 0 | Month 1 | Month 2 | Month 3 | Month 4 | Month 5 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **2025-01** | 100% | 58.8% | 38.2% | 29.4% | 17.6% | 11.8% |
| **2025-02** | 100% | 47.1% | 35.3% | 23.5% | 8.8% | — |
| **2025-03** | 100% | 61.5% | 46.2% | 15.4% | — | — |
| **2025-04** | 100% | 50.0% | 25.0% | — | — | — |
| **2025-05** | 100% | 52.6% | — | — | — | — |
| **2025-06** | 100% | — | — | — | — | — |

---

## 🛠️ Tech Stack & Skills Demonstrated
* **SQL (PostgreSQL):** Advanced Common Table Expressions (CTEs), Regexp Data Cleaning, Data Type Casting, Date-Interval Math.
* **Excel / Spreadsheets:** Pivot Matrices, Conditional Heatmapping, Business Formatting, Data Segmentation.
* **Product Analytics:** Growth Analysis, Cohort Frameworks, Retention/Churn Optimization, Acquisition Channel Evaluation.
