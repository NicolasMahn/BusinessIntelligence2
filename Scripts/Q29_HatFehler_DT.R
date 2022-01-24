# Q29, decision tree on HatFehler

treeModel <- ctree(HatFehler ~ Hoehe+Durchmesser+Gewicht, trainData)

results <- predict(treeModel, testData)

table(vorhergesagt=results, real = testData$HatFehler)

mean(results == testData$HatFehler)

plot(treeModel)


# ROCR Curve
predictions <- predict(treeModel, testData, type="prob")
predictions <- data.frame(t(matrix(unlist(predictions),2)))

predictionsProbabilities <- predictions[ , 2]

# Obtaining the RoC Curve
# With predictions probabilities and value in test data
# ROCR::prediction, since other libraries use that function too
prediction <- ROCR::prediction(predictionsProbabilities, testData$HatFehler)
rocCurve <- performance(prediction, "tpr", "fpr")

# Plot RoC curve and a line
plot(rocCurve)
abline(0,1,col=turquoise)
