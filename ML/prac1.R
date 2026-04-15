x <- seq(-4, 4, by=0.1)
y <- dnorm(x, mean=0, sd=1)
plot(x, y, type='l', main='PDF of Normal Distribution', ylab='Density', xlab='x')

y_cdf <- pnorm(x, mean=0, sd=1)
plot(x, y_cdf, type='l', main='CDF of Normal Distribution', ylab='Probability', xlab='x')

qnorm(0.025, mean=0, sd=1)   # 2.5th percentile
qnorm(0.975, mean=0, sd=1)   # 97.5th percentile

x <- 0:10
y <- dbinom(x, size=10, prob=0.5)
barplot(y, names.arg=x, main="PMF of Binomial Distribution", ylab="Probability", xlab="x")

y_cdf <- pbinom(x, size=10, prob=0.5)
plot(x, y_cdf, type='s', main="CDF of Binomial Distribution", ylab="Cumulative Probability", xlab="x")

qbinom(0.25, size=10, prob=0.5)
qbinom(0.75, size=10, prob=0.5)

library(MASS)
x <- seq(-4, 4, length=100)
y <- seq(-4, 4, length=100)
z <- outer(x, y, function(x, y) dnorm(x)*dnorm(y))
contour(x, y, z, main="Joint Distribution of Two Normal Variables")
