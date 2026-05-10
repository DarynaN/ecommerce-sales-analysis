# E-Commerce Sales Analysis

End-to-end analysis of an online furniture store using BigQuery, Python, and Tableau.  
Focused on evaluating revenue performance, user behavior, and monetization efficiency across geography, traffic channels, devices, and product categories.

---

## Business Questions

1. Which countries/continents have high order volume but low revenue per order?
2. Which product categories have high demand but low monetization?
3. Which traffic channels generate value vs. just traffic?
4. Does email subscription impact actual sales?
5. How does revenue differ across device types?
6. What seasonal patterns affect revenue?

---

## Dataset

- Source: Google BigQuery (`DA` dataset)
- Grain: session-product level
- Size: ~33,500 records
- Period: November 2020 – January 2021
- Dimensions: geography, device, traffic source, product category, user registration status

---

## Tools

`Python` `pandas` `matplotlib` `seaborn` `scipy` `statsmodels` `BigQuery` `SQL` `Tableau`

---

## Key Findings

**Geography**  
Americas and Europe lead in revenue, but several high-volume countries show below-median AOV — a monetization gap, not a demand problem.

**Product Categories**  
Bookcases & shelving units and Tables & desks: high order volume, low AOV. These are priority targets for price testing and bundle offers — before investing in more traffic.

**Traffic Channels**  
Organic Search and Direct drive the most revenue per session. Paid Search generates traffic but underperforms on value. Kruskal–Wallis test confirms statistically significant differences between channels.

**Devices**  
Desktop generated 59% of total revenue. Mobile traffic showed weaker monetization efficiency, suggesting potential UX or checkout friction rather than acquisition issues.

**Registered vs. Unregistered Users**  
Unregistered users generate higher revenue per session. Difference is statistically significant (Mann–Whitney U, p < 0.001). Registration should be evaluated through retention and LTV, not short-term revenue.

**Seasonality**  
Weekdays consistently outperform weekends. Revenue declines are synchronized across continents — suggesting global demand drivers rather than regional effects.

---

## Business Recommendation

The main growth lever is **monetization, not traffic**:
- Prioritize monetization optimization before increasing acquisition spend
- Run A/B price tests on high-demand / low-AOV categories
- Optimize mobile checkout experience
- Prioritize Organic Search and Direct channel investment

---

## Dashboard

[View on Tableau Public →](https://public.tableau.com/app/profile/daryna.nakonechna/viz/AnalysisOnlineStore/Dashboard)

---

## Files

| File | Description |
|------|-------------|
| `notebooks/ecommerce_analysis.ipynb` | Full analysis notebook |
| `sql/base_dataset.sql` | BigQuery data extraction query |
| `assets/dashboard_screenshot.png` | Tableau dashboard preview |
