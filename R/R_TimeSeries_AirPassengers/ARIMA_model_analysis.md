# 📈 ARIMA Model Analysis – Monthly Flight Traffic

This document summarizes the structure, estimated coefficients, model quality, and error metrics of an ARIMA model applied to a monthly flight traffic dataset.

---

## 1️⃣ ARIMA Model Structure

**Series**: `ts_flights`  
**Model**: ARIMA(2,1,1)(0,1,0)[12]  

🔹 The fitted model is an ARIMA(2,1,1)(0,1,0)[12], which means:

- **(2,1,1)**: Represents the **non-seasonal** component:
  - **AR(2)** → Two autoregressive lags (depends on 2 past values).
  - **I(1)** → One differencing to make the series stationary.
  - **MA(1)** → One moving average lag.

- **(0,1,0)[12]**: Represents the **seasonal** component:
  - 0 seasonal AR terms  
  - 1 seasonal differencing (to remove annual patterns)  
  - 0 seasonal MA terms

- **[12]** indicates that the seasonality repeats every 12 periods (likely monthly).

---

## 2️⃣ Estimated Coefficients

```     ar1     ar2      ma1
  0.5960  0.2143  -0.9819
s.e. 0.0888 0.0880 0.0292
```

✅ **Interpretation**:

- **AR(1) = 0.5960** → The current value is influenced by 59.6% of the previous month’s value.
- **AR(2) = 0.2143** → There is also a smaller impact (21.4%) from two months ago.
- **MA(1) = -0.9819** → The error from the previous period has a strong and negative weight (-98.2%), indicating almost complete correction of past errors.
- **Standard error (s.e.)** → Small values suggest that the coefficients are precisely estimated.

---

## 3️⃣ Model Fit Quality

```
sigma^2 = 132.3 log likelihood = -504.92
AIC = 1017.85 AICc = 1018.17 BIC = 1029.35
```


✅ **Interpretation**:

- **σ² = 132.3** → Variance of the model residuals. Lower is better.
- **Log-Likelihood = -504.92** → Measures the likelihood of the data given the model. Higher (less negative) values indicate better fit.
- **AIC = 1017.85**, **BIC = 1029.35** → Model selection criteria; lower values indicate a better model. AIC is more commonly used for comparison among models in the same class.

---

## 4️⃣ Model Error Metrics

```
    Training set error measures:
                          ME      RMSE    MAE      MPE     MAPE     MASE       ACF1
    Training set      1.3423 10.84619 7.86754 0.420698 2.800458 0.245628 -0.00124847
```


✅ **Interpretation**:

- **ME (Mean Error) = 1.3423** → Slight positive bias, indicating the model may slightly overestimate.
- **RMSE = 10.85** → Measures the spread of residuals. Lower values indicate better performance.
- **MAE = 7.87** → Average magnitude of errors.
- **MPE = 0.42%** → On average, the model overestimates by 0.42%.
- **MAPE = 2.80%** → Small average percentage error, indicating good fit.
- **MASE = 0.2456** → Value below 1 indicates better performance than a naive model.
- **ACF1 = -0.0012** → Autocorrelation of residuals at lag 1. Near-zero implies no residual autocorrelation — a good sign.

---

## 📌 Conclusion

✅ The model appears **suitable for forecasting** because:

- The **AIC is relatively low**.
- The **MAPE is only 2.8%**, indicating high accuracy.
- **Residuals show no significant autocorrelation** (ACF1 near zero).
- Slight positive bias (ME), but not problematic.
