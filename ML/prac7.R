# Load required package (optional for plotting)
install.packages("ggplot2")
library(ggplot2)

#1 Simulating Data
# Simulate data from two normal distributions
set.seed(123)
x1 <- rnorm(100, mean=2, sd=1)
x2 <- rnorm(100, mean=7, sd=1.5)
data <- c(x1, x2)
hist(data, breaks=30, col="skyblue", main="Histogram of Simulated Data")

#2 Initialize Parameters
# Initial guesses
mu1 <- 1; mu2 <- 6
sd1 <- 1; sd2 <- 1
pi1 <- 0.5; pi2 <- 0.5

#3 EM Algorithm Steps

# EM Algorithm
log_likelihood <- function(x, mu1, mu2, sd1, sd2, pi1, pi2) {
  sum(log(pi1*dnorm(x, mu1, sd1) + pi2*dnorm(x, mu2, sd2)))
}

for (i in 1:20) {
  # E-step: responsibilities
  r1 <- pi1 * dnorm(data, mu1, sd1)
  r2 <- pi2 * dnorm(data, mu2, sd2)
  gamma1 <- r1 / (r1 + r2)
  gamma2 <- 1 - gamma1
  
  # M-step: update parameters
  mu1 <- sum(gamma1 * data) / sum(gamma1)
  mu2 <- sum(gamma2 * data) / sum(gamma2)
  sd1 <- sqrt(sum(gamma1 * (data - mu1)^2) / sum(gamma1))
  sd2 <- sqrt(sum(gamma2 * (data - mu2)^2) / sum(gamma2))
  pi1 <- mean(gamma1)
  pi2 <- 1 - pi1
  
  cat("Iteration:", i, "Log-Likelihood:", log_likelihood(data, mu1, mu2, sd1, sd2, pi1, pi2), "
")
}

#4. Final Parameter Estimates
cat("Estimated mu1:", mu1, "Estimated mu2:", mu2, "\n")

cat("Estimated sd1:", sd1, "Estimated sd2:", sd2, "\n")

cat("Estimated pi1:", pi1, "Estimated pi2:", pi2, "\n")

