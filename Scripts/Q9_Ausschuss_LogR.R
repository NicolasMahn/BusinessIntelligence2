logisticDataFrame <- smartBuildDataFrame
# Q8 with logistical regression for Ausschuss

logisticDataFrame$Ausschuss <- ifelse(logisticDataFrame$Ausschuss == "Ja", 1, 0)

logisticTrainData <- trainData
logisticTrainData$Ausschuss <- ifelse(logisticTrainData$Ausschuss == "Ja", 1, 0)

logisticTestData <- testData
logisticTestData$Ausschuss <- ifelse(logisticTestData$Ausschuss == "Ja", 1, 0)

# Logistische Regression
logisticModel <- glm(Ausschuss ~ Gewicht, family = "binomial", data = logisticTrainData)
results <- predict(logisticModel, logisticTestData, type = "response")

y_pred <- ifelse(results > 0.5, 1, 0)
y_real <- logisticTestData$Ausschuss

table(pred = y_pred, real = y_real)
mean(y_pred == y_real)
# 72.35%


newData <- data.frame(Gewicht = seq(min(logisticTestData$Gewicht), max(logisticTestData$Gewicht), len=nrow(logisticTestData)))
newData$AusschussPred = predict(logisticModel, newdata, type="response")

# Datenpunkte bei 1.0 sind Ausschüsse, bei 0 keine
plot(logisticTestData$Gewicht, logisticTestData$Ausschuss, col=orange)
points(AusschussPred~Gewicht, newData, type="l", col=lightTurquoise)

# Decision Tree
treeModel <- ctree(as.factor(Ausschuss) ~ Gewicht, trainData)
plot(treeModel)
predictions <- predict(treeModel, testData)

table(pred = predictions, real = testData$Ausschuss)
mean(predictions == testData$Ausschuss)


# Decision Tree
treeModel <- ctree(Fehler ~ Gewicht, trainData)
plot(treeModel)
predictions <- predict(treeModel, testData)

table(pred = predictions, real = testData$Ausschuss)
mean(predictions == testData$Fehler)