# Testdata to validate
newData <- data.frame(Gewicht=seq(min(testData$Gewicht), max(testData$Gewicht), length.out=nrow(testData)))

# Linear Regression on Fluxkomensation
linModel <- lm(Warpfaktor~Gewicht, trainData)
linRes <- predict(linModel, newData)

# Plotting
plot(trainData$Gewicht, trainData$Warpfaktor, col=lightRose, xlab="Gewicht", ylab="Warpfaktor")
points(newData$Gewicht, linRes, type="l", col=orange, lwd=4)

linPred <- predict(linModel, testData)
linErr <- mean(abs(linPred - testData$Warpfaktor))
baseErr <- mean(abs(mean(trainData$Warpfaktor) - testData$Warpfaktor))
linErr
# 4.339991
baseErr
# 28.39107
mean(trainData$Warpfaktor)

plot(x=testData$Warpfaktor, xlab="Warpfaktor",
     y=linPred, ylab="Vorhergesagter Warpfaktor", col=turquoise)
points(seq(0, 450), col=pink, type="l")