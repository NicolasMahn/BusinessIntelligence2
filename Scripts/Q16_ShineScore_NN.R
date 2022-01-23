# Aufgabe 16: Neuronales Netz auf ShineScore

#neural net
model <- neuralnet(ShineScore~Hoehe+Durchmesser+Gewicht,
                   scaledTrainData, hidden=c(2,3), act.fct = 'logistic', 
                   linear.output = T, rep = 3)
plot(model)

# Be careful with compute, since another library also has a compute function, which cannot handle a neural net model
pred <- neuralnet::compute(model, scaledTestData)
pred$net.result
pred$net.result = (pred$net.result * (max(testData$ShineScore) - min(testData$ShineScore))) + min(testData$ShineScore)
pred$net.result
err <- mean(abs(pred$net.result - testData$ShineScore))
err
# 5.037

# Baseline Error
mean(abs(testData$ShineScore - mean(trainData$ShineScore)))
# 5.038

linModel <- lm(ShineScore~Hoehe+Gewicht+Durchmesser, trainData)
linPred <- predict(linModel, testData)
mean(abs(linPred - testData$ShineScore))
# 5.037