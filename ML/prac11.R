# Step 1: Install Required Packages (Run only once if not already installed)
# install.packages("tidyverse")
# install.packages("zoo")
# install.packages("forecast")

# Load Libraries
library(tidyverse)
library(zoo)
library(forecast)
library(ggplot2)

# Step 2: Simulate a Multivariate Time Series
set.seed(123)

time <- 1:100
x1 <- cumsum(rnorm(100))
x2 <- cumsum(rnorm(100))
x3 <- cumsum(rnorm(100))

data <- data.frame(
  Time = time,
  Series1 = x1,
  Series2 = x2,
  Series3 = x3
)

# Step 3: Convert Data to Long Format
data_long <- pivot_longer(
  data,
  cols = -Time,
  names_to = "Series",
  values_to = "Value"
)

# Step 4: Reset Graphics Device
graphics.off()

# Step 5: Plot Multivariate Time Series
ggplot(data_long, aes(x = Time, y = Value, color = Series)) +
  geom_line() +
  theme_minimal() +
  labs(title = "Multivariate Random Walk Time Series")

# Step 6: Forecast Using Random Walk Model
fit1 <- rwf(ts(data$Series1), h = 10)
fit2 <- rwf(ts(data$Series2), h = 10)
fit3 <- rwf(ts(data$Series3), h = 10)

# Set Proper Margins
par(mar = c(4, 4, 2, 2))

# Plot Forecasts
plot(fit1, main = "Random Walk Forecast - Series1")
plot(fit2, main = "Random Walk Forecast - Series2")
plot(fit3, main = "Random Walk Forecast - Series3")