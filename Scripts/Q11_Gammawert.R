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



# histInfo <- hist(testData$Gammawert)
# summary(testData$Gammawert)
#summary(testData$Qualitaet)
# histQual <- hist(testData$Qualitaet)
#plot(testData$Hoehe, testData$Gammawert)

#plot(histInfo$breaks[-1], histInfo$density * nrow(testData), type="l")
#plot(histQual$breaks[-1], histQual$density * nrow(testData), type="l")


# modResults <- ifelse(predict(polModel, testData) > mean(testData$Gammawert), 1, 0)
# modResults <- round(predict(polModel, test), 0)
#modResults <- predict(polModel, test)
# realResults <- ifelse(testData$Gammawert > mean(testData$Gammawert), round(test), 0)
# realResults <- round(testData$Gammawert, 0)
#realResults <- testData$Gammawert

#table(vorhergesagt = modResults, real = realResults)
# res <- mean(modResults == realResults) * 100
#mean(modResults < realResults + 400 & modResults > realResults - 400) * 100
# 99.25% Wahrscheinlichkeit

plot(x=testData$Gammawert, xlab="Gammawert", y=predict(polModel, testData), ylab="Vorhergesagter Gammawert", col=turquoise)
points(seq(0, 1000), col=orange, type="l")
