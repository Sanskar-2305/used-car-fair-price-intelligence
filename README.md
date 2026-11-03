
# 🚗 AUTOMARKET — Used-Car Fair Price Intelligence

**Turning used-car listings into smarter buying decisions with data analytics and machine learning.**

<p align="center">
  <strong>Data Analytics | Machine Learning | Predictive Valuation | Power BI</strong>
</p>

---

## 📌 Project Overview

AUTOMARKET is a data-driven used-car price intelligence platform designed to identify potentially undervalued and overpriced vehicle listings.

The project analyzes a large used-car listings dataset, identifies market pricing patterns, and estimates fair vehicle prices using a hybrid valuation approach combining comparable-market analysis and Random Forest regression.

The results are presented through an interactive three-page Power BI dashboard that helps users explore market trends, evaluate vehicle prices, and discover potential deals.

## 🎯 Business Problem

Used-car buyers often struggle to determine whether a vehicle is fairly priced.

Listing prices can vary significantly based on:
- Manufacturer and model
- Vehicle age
- Mileage
- Fuel type and transmission
- Market demand and comparable listings

AUTOMARKET addresses this problem by estimating fair market prices and comparing them against actual listing prices.

## 💡 Key Features

- **Market Intelligence:** Explore pricing trends across manufacturers, models and vehicle specifications.
- **Fair Price Estimation:** Estimate vehicle prices using comparable-market analysis and machine learning.
- **Deal Identification:** Classify listings as Potentially Undervalued, Fair or Potentially Overpriced.
- **Confidence Analysis:** Evaluate valuation confidence using comparable listings and model fallback information.
- **Interactive Dashboard:** Explore insights through three dedicated Power BI pages.

## 🧠 Valuation Methodology

AUTOMARKET uses a hybrid pricing approach:

1. **Comparable-Market Analysis:** Identify similar vehicles using manufacturer, model, vehicle year and mileage bands.
2. **Comparable-Based Valuation:** Calculate a market-based median price when sufficient comparable listings are available.
3. **Random Forest Fallback:** Use a trained Random Forest regression model when comparable-market coverage is insufficient.
4. **Hybrid Price Estimation:** Combine both approaches to produce the final estimated fair price.
5. **Deal Classification:** Compare actual listing prices with estimated fair prices.

### Deal Classification

| Classification | Condition |
|---|---|
| Potentially Undervalued | At least 10% below fair value |
| Fair | Within ±10% of fair value |
| Potentially Overpriced | More than 10% above fair value |

*These classifications are analytical indicators, not guarantees of actual vehicle value or savings.*

## 📊 Model Performance

The hybrid valuation approach achieved the following results on the held-out test dataset:

| Metric | Hybrid Model |
|---|---:|
| Mean Absolute Error (MAE) | $2,942.66 |
| R² Score | 0.895 |
| Comparable Coverage | 83.9% |

### Random Forest Baseline Comparison

| Metric | Random Forest | Hybrid Approach |
|---|---:|---:|
| MAE | $4,545.95 | $2,942.66 |
| R² | 0.817 | 0.895 |

The hybrid approach improved valuation accuracy over the Random Forest baseline on the held-out test data.

## 📈 Power BI Dashboard

The dashboard consists of three interactive pages.

### 01 — Market Overview

Explore the used-car market through:
- Total listings and pricing KPIs
- Price distribution
- Average price by manufacturer
- Most-listed vehicle models
- Listings by year
- Fuel type, transmission and drivetrain distributions

### 02 — Valuation Lab

Understand how vehicle prices compare against estimated fair values:
- Listing Price vs Estimated Fair Value
- Price Difference Distribution
- Average Price Difference by Manufacturer
- Market Pricing Breakdown
- Top Potential Deals

### 03 — Deal Room

Discover potential buying opportunities:
- Total Deal Candidates
- Average Potential Savings
- Maximum Deal Discount
- Average Comparable Listings
- Deal Opportunity by Price Range
- Deal Confidence Distribution
- Top Manufacturers by Deals
- Highest Estimated Savings Table

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Python | Data processing and modeling |
| Pandas | Data manipulation |
| NumPy | Numerical computing |
| Scikit-learn | Machine learning |
| Random Forest | Regression modeling |
| Jupyter Notebook | Data exploration and experimentation |
| Power BI | Interactive dashboard development |
| Git & GitHub | Version control and project management |

## 📂 Project Structure

```text
used-car-fair-price-intelligence/
│
├── data/
│   ├── cars_preprocessed.csv
│   └── fair_price_results.csv
│
├── notebooks/
│   └── 01_data_audit.ipynb
│
├── dashboard/
│   └── AUTOMARKET_Used_Car_Intelligence.pbix
│
├── screenshots/
│   ├── market-overview.png
│   ├── valuation-lab.png
│   └── deal-room.png
│
├── requirements.txt
├── README.md
└── .gitignore
```

*Adjust the folder structure above to match the files actually committed to the repository.*

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Sanskar-2305/used-car-fair-price-intelligence.git
```

### 2. Navigate to the Project

```bash
cd used-car-fair-price-intelligence
```

### 3. Create a Virtual Environment

```bash
python -m venv venv
```

Activate it on Windows:

```bash
venv\Scripts\activate
```

### 4. Install Dependencies

```bash
pip install -r requirements.txt
```

### 5. Explore the Project

Open the Jupyter notebooks to explore the dataset and analysis.

Open the Power BI `.pbix` file using Power BI Desktop to interact with the dashboard.

## 🔍 Key Project Outcomes

- Processed and analyzed over 750,000 used-car listings.
- Developed a hybrid fair-price estimation approach.
- Achieved an MAE of approximately $2.94K on held-out test data.
- Achieved an R² score of approximately 0.895.
- Created an interactive three-page Power BI dashboard.
- Identified potentially undervalued, fairly priced and overpriced listings.

## 🔮 Future Improvements

- Deploy the valuation model through a web application.
- Build a real-time used-car price prediction API.
- Add location-based vehicle price comparisons.
- Improve confidence calibration and explainability.
- Integrate additional vehicle condition and history information.
- 
## 📸 Dashboard Preview

### 01 — Market Overview

![Market Overview](screenshots/MARKET%20OVERVIEW.png)

### 02 — Valuation Lab

![Valuation Lab](screenshots/VALUATION%20LAB.png)

### 03 — Deal Room

![Deal Room](screenshots/DEAL%20ROOM.png)



## 👨‍💻 Author




**Sanskar Mirajkar**

B.Tech — Data Science


- GitHub: [Sanskar-2305](https://github.com/Sanskar-2305)

---

<p align="center">
  <strong> AUT0MARKET — Data-Driven Decisions. Smarter Car Buying.</strong>
</p>
