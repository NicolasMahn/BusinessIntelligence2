# Q9 with logistical regression for Ausschuss

# Logistische Regression
logisticModel <- glm(Ausschuss ~ Gewicht, family = "binomial", data = logisticTrainData)
results <- predict(logisticModel, logisticTestData, type = "response")

modResults <- ifelse(results > 0.5, 1, 0)

table(vorhergesagt = modResults, real = logisticTestData$Ausschuss)
#               real
# vorhergesagt   0   1
#            0  997 352
#            1  201 450
mean(modResults == logisticTestData$Ausschuss)
# 72.35%

newData <- data.frame(Gewicht = seq(min(logisticTestData$Gewicht), max(logisticTestData$Gewicht), len=nrow(logisticTestData)))
newData$AusschussPred = predict(logisticModel, newData, type="response")

# Datenpunkte bei 1.0 sind Ausschüsse, bei 0 keine
plot(logisticTestData$Gewicht, logisticTestData$Ausschuss, col=orange)
plot(AusschussPred~Gewicht, newData, type="l", col=lightTurquoise)
