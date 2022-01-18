
q1 <- function() {
  #
  # First Approach
  #
  
  # Sort the data frames
  sortedTestData <- testData[order(testData$Qualitaet), ]
  sortedTrainData <- trainData[order(trainData$Qualitaet), ]
  
  model <- lm(Qualitaet~Durchmesser+Hoehe+Gewicht, sortedTrainData)
  predictedQualitaet <- predict(model, sortedTestData)
  qualitaet <- sortedTestData$Qualitaet
  
  error <- abs(predictedQualitaet - qualitaet)
  mean(error)
  sqrt(mean(error))
  
  # Visualization

  sortedError <- error[order(error)]
  #plot(x=seq(1,length(error),by=1),y=sortedError,
  #             xlab="sortierte Abweichungen",
  #             ylab="absoluter Abweichungswert",
  #             ylim=c(0,0.2),
  #             col=pink,
  #             type="l")
  plot(x=qualitaet, xlab="Qualitaet", 
       y=predictedQualitaet, ylab="Vorhergesagte Qualitaet", col=turquoise)
  points(seq(1.0, 2.0), col=pink, type = "l")
  
}