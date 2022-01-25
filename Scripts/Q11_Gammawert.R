# Create Test Data
test <- data.frame(Hoehe=seq(min(testData$Hoehe), max(testData$Hoehe), length.out=nrow(testData)))

# Create Models
polModel <- lm(Gammawert~poly(Hoehe, 2, raw=T), trainData)
linModel <- lm(Gammawert~Hoehe, trainData)

# Create Visualisation
plot(trainData$Hoehe, trainData$Gammawert, col=lightRose, xlab="Höhe", ylab="Gammawert", cex=1)
points(test$Hoehe, predict(polModel, test), col=orange, lwd=1)

# Evaluation
polErr <- mean(abs(predict(polModel, testData) - testData$Gammawert))
linErr <- mean(abs(predict(linModel, testData) - testData$Gammawert))
baselineErr <- mean(abs(mean(trainData$Gammawert)- testData$Gammawert))

plot(x=testData$Gammawert, xlab="Gammawert", y=predict(polModel, testData), ylab="Vorhergesagter Gammawert", col=turquoise)
points(seq(0, 1000), col=orange, type="l")
