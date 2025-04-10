library(readr)
library(ggplot2)
library(forecast)
library(zoo)


# Load dataset
setwd("C:/Users/rmuzz/Documents/Portfolio_DataScienceAnalytics/R/R_TimeSeries_AirPassengers/Kaggle_AirPassengers")
df <- read_csv("AirPassengers.csv")

df$Month <- as.yearmon(df$Month, "%Y-%m")

ts_flights <- ts(df$`#Passengers`, start=c(1949,1), frequency=12)  # Adjust start year

# Plot flight frequency over time
autoplot(ts_flights) + ggtitle("Monthly Flight Traffic Over Time")

# Fit ARIMA model
fit_auto <- auto.arima(ts_flights)
summary(fit_auto)

    # Series: ts_flights 
    # ARIMA(2,1,1)(0,1,0)[12] 
    # 
    # Coefficients:
    #   ar1     ar2      ma1
    # 0.5960  0.2143  -0.9819
    # s.e.  0.0888  0.0880   0.0292
    # 
    # sigma^2 = 132.3:  log likelihood = -504.92
    # AIC=1017.85   AICc=1018.17   BIC=1029.35
    # 
    # Training set error measures:
    #                  ME     RMSE     MAE      MPE     MAPE     MASE        ACF1
    # Training set 1.3423 10.84619 7.86754 0.420698 2.800458 0.245628 -0.00124847

# Forecast next 12 months
forecasted_fit_auto <- forecast(fit_auto, h=12)
autoplot(forecasted_fit_auto)

# Model evaluation
actual <- tail(ts_flights, 12)
predicted <- tail(fitted(fit_auto), 12)

actual
predicted
fit_auto$fitted[133:144]
forecasted_fit_auto

    # Point          Forecast    Lo 80    Hi 80    Lo 95    Hi 95
    # Jan 1961       445.6349 430.8903 460.3795 423.0851 468.1847
    # Feb 1961       420.3950 403.0907 437.6993 393.9304 446.8596
    # Mar 1961       449.1983 429.7726 468.6240 419.4892 478.9074
    # Apr 1961       491.8399 471.0270 512.6529 460.0092 523.6707
    # May 1961       503.3945 481.5559 525.2330 469.9953 536.7937
    # Jun 1961       566.8624 544.2637 589.4612 532.3007 601.4242
    # Jul 1961       654.2602 631.0820 677.4383 618.8122 689.7081
    # Aug 1961       638.5975 614.9704 662.2246 602.4630 674.7320
    # Sep 1961       540.8837 516.9028 564.8647 504.2081 577.5594
    # Oct 1961       494.1266 469.8624 518.3909 457.0177 531.2356
    # Nov 1961       423.3327 398.8381 447.8273 385.8715 460.7939
    # Dec 1961       465.5076 440.8229 490.1923 427.7556 503.2596

mae <- mean(abs(actual - predicted))
rmse <- sqrt(mean((actual - predicted)^2))

print(paste("MAE:", mae, "RMSE:", rmse))
    # "MAE: 14.976127766492 RMSE: 19.0796843790341"


# Adjusts alternative models
fit_311 <- Arima(ts_flights, order = c(3,1,1), seasonal = c(0,1,0))
fit_212 <- Arima(ts_flights, order = c(2,1,2), seasonal = c(0,1,0))

# Compare AIC e BIC
model_comparison <- data.frame(
  Model = c("ARIMA(2,1,1)(0,1,0)[12]","ARIMA(3,1,1)(0,1,0)[12]", "ARIMA(2,1,2)(0,1,0)[12]"),
  AIC = c(AIC(fit_auto), AIC(fit_311), AIC(fit_212)),
  BIC = c(BIC(fit_auto), BIC(fit_311), BIC(fit_212))
)

print(model_comparison)
    #                   Model      AIC      BIC
    # 1 ARIMA(2,1,1)(0,1,0)[12] 1017.848 1029.348
    # 2 ARIMA(3,1,1)(0,1,0)[12] 1019.085 1033.461
    # 3 ARIMA(2,1,2)(0,1,0)[12] 1019.291 1033.667
    #
    # Model yelded by 'auto.arima' SARIMA(2,1,1)(0,1,0)[12] has
    # the lowest AIC and BIC meaning that it is indeed the best

 # PLEASE REFER TO THE 'ARIMA_model_analysis.md' FILE FOR ALL THE DETAILS