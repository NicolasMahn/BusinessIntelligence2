# Aufgabe 17: Neuronales Netz auf Farbreinheit

numColsSmartBuildDataFrame <- smartBuildDataFrame[,sapply(smartBuildDataFrame, is.numeric)]

max = apply(numColsSmartBuildDataFrame, 2 , max)
min = apply(numColsSmartBuildDataFrame, 2 , min)

scaledSmartBuildDataFrame = as.data.frame(scale(numColsSmartBuildDataFrame, center = min, scale = max - min))

index <- sample(1:nrow(scaledSmartBuildDataFrame), size = nrow(scaledSmartBuildDataFrame)*0.8)

scaledTrainData <- scaledSmartBuildDataFrame[index,]
scaledTestData <- scaledSmartBuildDataFrame[-index,]

scaledTrainData

set.seed(42)

model <- neuralnet(Farbreinheit~Hoehe+Durchmesser+Gewicht,
                   scaledTrainData, hidden=c(2,3), act.fct = 'logistic', 
                   linear.output = T, rep = 3)
plot(model)

?neuralnet

pred <- compute(model, scaledTestData)
pred$net.result
pred$net.result = (pred$net.result * (max(testData$Farbreinheit) - min(testData$Farbreinheit))) + min(testData$Farbreinheit)
pred$net.result
err <- mean(abs(pred$net.result - testData$Farbreinheit))
err
# 5.037

# Baseline Error
mean(abs(testData$Farbreinheit - mean(trainData$Farbreinheit)))
# 5.038

linModel <- lm(ShineScore~Hoehe+Gewicht+Durchmesser, trainData)
linPred <- predict(linModel, testData)
mean(abs(linPred - testData$ShineScore))
# 5.037