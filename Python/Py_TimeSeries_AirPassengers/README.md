# ![icon_Python_30 30px](https://github.com/user-attachments/assets/66c7bd9e-2265-4863-b161-01e4b147afae) ✈️ ARIMA Forecast for Monthly Flight Traffic (1961)

This project applies a time series forecasting technique (ARIMA) to model and predict monthly flight traffic using historical data. The main goal is to forecast the number of flights for the 12 months of 1961, along with 95% confidence intervals.

## 📁 Project Structure

Py_TimeSeries_AirPassengers/ ├── AirPassengers.csv ├── Py_TimeSeries_AirPassengers.ipynb └── README.md

## 📊 Dataset

- **Source**: `AirPassengers.csv (Kaggle)`
- **Required Columns**:
  - `Date`: Monthly timestamps in `YYYY-MM-DD` format.
  - `Flights`: Number of flights per month.

> Ensure the dataset is clean and has no missing values in the `Date` or `Flights` columns.

## 🧠 Model

This project uses an **ARIMA(2,1,1)** Seasonal (0, 1, [], 12) model to analyze and forecast flight traffic. ARIMA is a classical time series model capable of handling trends and autocorrelations.

### Key Features

- Visualizes monthly flight traffic over time.
- Fits an ARIMA model and evaluates it with MAE and RMSE.
- Generates a 12-month forecast for 1961.
- Plots confidence intervals (95%) as a shaded area.

## 🛠️ Requirements

Install dependencies with:

```bash
pip install pandas numpy matplotlib statsmodels scikit-learn
```
  
## ▶️ How to Run

1. Place your `AirPassengers.csv` in the project directory.

2. Run the script:
`Py_TimeSeries_AirPassengers.ipynb`

3. Output includes:
- ARIMA model summary
- Forecasted flight numbers for 1961
- Evaluation metrics (MAE, RMSE, BIC and AIC)
- Plot of observed and forecasted values with confidence intervals

**If you liked the project, don't forget to give the repository a ⭐!**

**Improvement suggestions are very welcome! Thank you! :)**
