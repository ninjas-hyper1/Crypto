# Aim: Implement Metropolis-Hastings Algorithm
# Objective:
# To sample from a target distribution using the MH algorithm.

# Step 1: Define the Target Distribution
# Example Target Distribution: Normal(mean = 3, sd = 1)

target_density <- function(x) {
  dnorm(x, mean = 3, sd = 1)
}

# Explanation:
# This is the probability density function we want to sample from.
# Step 2: Define Metropolis-Hastings Sampler

mh_sampler <- function(start, iterations, proposal_sd) {
  
  samples <- numeric(iterations)
  samples[1] <- start
  
  for (i in 2:iterations) {
    
    # Generate proposal value
    proposal <- rnorm(1, mean = samples[i - 1], sd = proposal_sd)
    
    # Compute acceptance probability
    accept_prob <- min(
      1,
      target_density(proposal) / target_density(samples[i - 1])
    )
    
    # Accept or reject proposal
    if (runif(1) < accept_prob) {
      samples[i] <- proposal
    } else {
      samples[i] <- samples[i - 1]
    }
  }
  
  return(samples)
}

# Explanation:
# New proposals are accepted probabilistically to preserve target distribution.

# Step 3: Run the Sampler


set.seed(123)

samples <- mh_sampler(
  start = 0,
  iterations = 10000,
  proposal_sd = 1
)

# Step 4: Reset Graphics and Plot Results

graphics.off()

# Open new plotting window (Windows only)
windows()

# Set plotting layout
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))

# Trace Plot
plot(
  samples,
  type = "l",
  main = "Trace Plot",
  xlab = "Iteration",
  ylab = "Sample Value"
)

# Histogram
hist(
  samples,
  breaks = 40,
  main = "Histogram of Samples",
  xlab = "Sample Value"
)

# Autocorrelation Plot
acf(
  samples,
  main = "Autocorrelation"
)

# Q-Q Plot
qqnorm(samples, main = "Q-Q Plot")
qqline(samples)


# Step 5: Reset Plot Layout


par(mfrow = c(1,1))