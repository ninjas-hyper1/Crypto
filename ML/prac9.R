# required packages
install.packages("e1071")
install.packages("ggplot2")

# load packages
library(e1071)
library(ggplot2)

# Step 2: Simulate a Binary Classification Dataset.
set.seed(123)
x1 <- rnorm(100)
x2 <- rnorm(100)
y <- ifelse(x1 + x2 + rnorm(100) > 0, 'Class1', 'Class2')
data <- data.frame(x1 = x1, x2 = x2, y = as.factor(y))
head(data)

# Step 3: Train the SVM Model
model <- svm(y ~ ., data = data, kernel = "linear")
summary(model)

# Step 4: Predict Using the Model
pred <- predict(model, data)
table(Predicted = pred, Actual = data$y)

# Step 5: Visualize the Classification
data$predicted <- pred

ggplot(data, aes(x = x1, y = x2, color = predicted, shape = y)) +
  geom_point(size = 3) +
  labs(title = "SVM Binary Classification") +
  theme_minimal()
