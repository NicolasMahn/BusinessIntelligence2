# Aufgabe 17: Neuronales Netz auf Farbreinheit

# neural net
model <- neuralnet(Farbreinheit~Hoehe+Durchmesser+Gewicht,
                   scaledTrainData, hidden=c(2,3), act.fct = 'logistic', 
                   linear.output = T, rep = 3)
plot(model)

# Be careful with compute, since another library also has a compute function, which cannot handle a neural net model
pred <- neuralnet::compute(model, scaledTestData)
pred$net.result
pred$net.result = (pred$net.result * (max(testData$Farbreinheit) - min(testData$Farbreinheit))) + min(testData$Farbreinheit)
pred$net.result
err <- mean(abs(pred$net.result - testData$Farbreinheit))
err
# 0.2525555

# Baseline Error
mean(abs(testData$Farbreinheit - mean(trainData$Farbreinheit)))
# 0.2521337

linModel <- lm(Farbreinheit~Hoehe+Gewicht+Durchmesser, trainData)
linPred <- predict(linModel, testData)
mean(abs(linPred - testData$Farbreinheit))
# 0.2520325