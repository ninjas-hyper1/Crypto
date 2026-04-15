# Aim: Demonstrate Filtering Techniques
# FIXED VERSION: Use stats::filter() instead of dplyr::filter()

# Step 1: Load Required Package

library(forecast)

# Step 2: Create Sample Time Series Data

set.seed(123)

time_series <- ts(
  100 + cumsum(rnorm(100)),
  frequency = 12
)

# Reset graphics
graphics.off()


# Plot Original Series
plot(
  time_series,
  main = "Original Time Series",
  ylab = "Value",
  xlab = "Time"
)

# Step 3: Apply Simple Moving Average (SMA)

# IMPORTANT: Use stats::filter()

sma <- stats::filter(
  time_series,
  rep(1/3, 3),
  sides = 2
)

plot(
  time_series,
  main = "Simple Moving Average Filter",
  ylab = "Value",
  xlab = "Time"
)

lines(sma)

legend(
  "topleft",
  legend = c("Original", "SMA (3)"),
  lty = 1
)

# Step 4: Apply Weighted Moving Average (WMA)


wma <- stats::filter(
  time_series,
  c(0.1, 0.3, 0.6),
  sides = 2
)

plot(
  time_series,
  main = "Weighted Moving Average Filter",
  ylab = "Value",
  xlab = "Time"
)

lines(wma)

legend(
  "topleft",
  legend = c("Original", "WMA"),
  lty = 1
)


# Step 5: Apply Exponential Smoothing


exp_smoothed <- ses(
  time_series,
  alpha = 0.3
)

plot(
  exp_smoothed,
  main = "Exponential Smoothing"
)

# Step 6: Compare All Filters

plot(
  time_series,
  main = "Comparison of Filtering Techniques",
  ylab = "Value",
  xlab = "Time"
)

lines(sma)
lines(wma)
lines(fitted(exp_smoothed))

legend(
  "topleft",
  legend = c("Original", "SMA", "WMA", "Exponential"),
  lty = 1
)

# Reset plotting layout
par(mfrow = c(1,1))