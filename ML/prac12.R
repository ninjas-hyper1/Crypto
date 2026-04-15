# Step 1: Define the Conditional Distributions
# Assume:
# x | y ~ Normal(mean = y, sd = 1)
# y | x ~ Normal(mean = x, sd = 1)

# Step 2: Initialize Variables
set.seed(123)

iterations <- 1000
x <- numeric(iterations)
y <- numeric(iterations)

# Initial values
x[1] <- 0
y[1] <- 0

# Step 3: Run Two-Stage Gibbs Sampler
for (i in 2:iterations) {
  x[i] <- rnorm(1, mean = y[i - 1], sd = 1)
  y[i] <- rnorm(1, mean = x[i], sd = 1)
}

# Step 4: Reset Graphics
graphics.off()

# Open new plotting window (Windows only)
windows()

# Set plotting layout and margins
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))

# Trace Plot of x
plot(
  x,
  type = "l",
  main = "Trace Plot of x",
  xlab = "Iteration",
  ylab = "x"
)

# Trace Plot of y
plot(
  y,
  type = "l",
  main = "Trace Plot of y",
  xlab = "Iteration",
  ylab = "y"
)

# Scatter Plot
plot(
  x, y,
  main = "Scatter Plot of x vs y",
  xlab = "x",
  ylab = "y"
)

# Histogram of x
hist(
  x,
  main = "Histogram of x",
  xlab = "x"
)

# Step 5: Reset layout back to normal
par(mfrow = c(1,1))