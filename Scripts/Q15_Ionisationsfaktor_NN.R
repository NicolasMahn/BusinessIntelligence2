# Aufgabe 15: Neuronales Netz auf Ionisationsfaktor

# neural net
model <- neuralnet(Ionisationsfaktor~Hoehe+Durchmesser+Gewicht,
                   scaledTrainData, hidden=c(2,3), act.fct = 'logistic', linear.output = T)
plot(model)

# Be careful with compute, since another library also has a compute function, which cannot handle a neural net model
pred <- compute(model, scaledTestData)
pred$net.result
pred$net.result = (pred$net.result * (max(testData$Ionisationsfaktor) - min(testData$Ionisationsfaktor))) + min(testData$Ionisationsfaktor)
pred$net.result
err <- mean(abs(pred$net.result - testData$Ionisationsfaktor))
err
# 1.724

# Baseline Error
mean(abs(testData$Ionisationsfaktor - mean(trainData$Ionisationsfaktor)))
# 2.335

linModel <- lm(Ionisationsfaktor~Hoehe+Durchmesser+Gewicht, testData)
linPred <- predict(linModel, testData)
mean(abs(linPred - testData$Ionisationsfaktor))
# 1.603