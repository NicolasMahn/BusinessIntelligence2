# Testdata to validate
newData <- data.frame(Hoehe=seq(min(testData$Hoehe), max(testData$Hoehe), length.out=nrow(testData)))

# Polynomial Regression on Fluxkomensation
polModel <- lm(Fluxkomensation~poly(Hoehe, 2, raw=T), testData)
polRes <- predict(polModel, newData)

# Linear Regression on Fluxkomensation
linModel <- lm(Fluxkomensation~Hoehe, trainData)
linRes <- predict(linModel, newData)

# Plotting
plot(trainData$Hoehe, trainData$Fluxkomensation, col=lightRose, xlab="Höhe", ylab="Fluxkomensation")
points(newData$Hoehe, polRes, type="l", col=turquoise, lwd=4)
points(newData$Hoehe, linRes, type="l", col=orange, lwd=4)


# Evaluation
polPred <- predict(polModel, testData)
polErr <- mean(abs(polPred - testData$Fluxkomensation))
polErr
# 1.619025

linPred <- predict(linModel, testData)
linErr <- mean(abs(linPred - testData$Fluxkomensation))
linErr
# 4.339991