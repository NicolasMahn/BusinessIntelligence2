q1 <- function() {
  #
  # First Approach
  #
  
  # Sort the data frames
  sortedTestData <- testData[order(testData$Qualitaet), ]
  sortedTrainData <- trainData[order(trainData$Qualitaet), ]
  
  model <- lm(Qualitaet~Durchmesser+Hoehe+Gewicht, sortedTrainData)
  prediction <- predict(model, sortedTestData)
  
  error <- prediction - sortedTestData$Qualitaet
  mean(abs(error))
  sqrt(mean(abs(error)))
  
  # Visualization
  qualitaet <- sortedTestData$Qualitaet
  plot(x=qualitaet, y=prediction)
  # Needs to be adjusted
  points(seq(1.0, 2.0), col="red", type = "l")
  #plot3d(prediction, sortedTestData$Qualitaet)

}