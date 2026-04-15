library(ggplot2)
library(MASS)

x <- seq(-4, 4, by=0.1)
y <- pnorm(x, mean=0, sd=1)
plot(x, y, type='l', main='CDF of Normal Distribution', ylab='Cumulative Probability', xlab='x')

pnorm(1.5, mean=0, sd=1)

pnorm(2, mean=0, sd=1) - pnorm(1, mean=0, sd=1)

qnorm(0.25, mean=0, sd=1)  # 25th percentile

qnorm(0.75, mean=0, sd=1)  # 75th percentile

x <- 0:10
y <- pbinom(x, size=10, prob=0.5)
plot(x, y, type='s', main="CDF of Binomial Distribution", ylab="Cumulative Probability", xlab="x")

pbinom(4, size=10, prob=0.5)

pbinom(7, size=10, prob=0.5) - pbinom(2, size=10, prob=0.5)

qbinom(0.25, size=10, prob=0.5)

qbinom(0.75, size=10, prob=0.5)

x <- seq(-4, 4, length=100)
y <- seq(-4, 4, length=100)
z <- outer(x, y, function(x, y) dnorm(x, mean=0, sd=1) * dnorm(y, mean=0, sd=1))
contour(x, y, z, main="Joint Distribution of Two Independent Normal Variables")

pnorm(1, mean=0, sd=1) * pnorm(1, mean=0, sd=1)

