trainDataVolumen <- trainData
testDataVolumen <- testData
trainDataVolumen$Volumen <- trainData$Hoehe * trainData$Durchmesser
testDataVolumen$Volumen <- testData$Hoehe * testData$Durchmesser

model <- lm(ShineScore~Durchmesser, trainDataVolumen)

maeTest <- mean(abs(testDataVolumen$ShineScore - predict(model, testDataVolumen)))
maeTrain <- mean(abs(trainDataVolumen$ShineScore - predict(model, trainDataVolumen)))

baselineMae <- mean(abs(trainDataVolumen$ShineScore - mean(trainDataVolumen$ShineScore)))

summary(trainDataVolumen$ShineScore)

hist(testDataVolumen$ShineScore, col=turquoise)

