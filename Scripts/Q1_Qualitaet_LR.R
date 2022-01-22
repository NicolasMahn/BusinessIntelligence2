
q1 <- function() {
  
  # Sort the data frames
  sortedTestData <- testData[order(testData$Qualitaet), ]
  sortedTrainData <- trainData[order(trainData$Qualitaet), ]
  
  model <- lm(Qualitaet~Durchmesser+Hoehe+Gewicht, sortedTrainData)
  predictedQualitaet <<- predict(model, sortedTestData)
  qualitaet <<- sortedTestData$Qualitaet
  
  error <- abs(predictedQualitaet - qualitaet)
  sortedError <<- error[order(error)]
  
  
  # sorted by weight
  sortedTestDataByWeight <<- testData[order(testData$Gewicht), ]
  sortedTrainDataByWeight <- trainData[order(trainData$Gewicht), ]
  
  model <- lm(Qualitaet~Durchmesser+Hoehe+Gewicht, sortedTrainData)
  errorByWeight <<- abs(predict(model, sortedTestDataByWeight) 
                      -sortedTestDataByWeight$Qualitaet)
  
  # sorted by weight
  sortedTestDataByWeight <<- testData[order(testData$Gewicht), ]
  sortedTrainDataByWeight <- trainData[order(trainData$Gewicht), ]
  
  model <- lm(Qualitaet~Durchmesser+Hoehe+Gewicht, sortedTrainDataByWeight)
  errorByWeight <<- abs(predict(model, sortedTestDataByWeight) 
                        -sortedTestDataByWeight$Qualitaet)
  
  # sorted by diameter
  sortedTestDataByDiameter <<- testData[order(testData$Durchmesser), ]
  sortedTrainDataByDiameter <- trainData[order(trainData$Durchmesser), ]
  
  model <- lm(Qualitaet~Durchmesser+Hoehe+Gewicht, sortedTrainDataByDiameter)
  errorByDiameter <<- abs(predict(model, sortedTestDataByDiameter) 
                        -sortedTestDataByDiameter$Qualitaet)
  
  # sorted by height
  sortedTestDataByHeight <- testData[order(testData$Hoehe), ]
  sortedTrainDataByHeight <- trainData[order(trainData$Hoehe), ]
  
  model <- lm(Qualitaet~Durchmesser+Hoehe+Gewicht, sortedTrainDataByHeight)
  errorByHeight <<- abs(predict(model, sortedTestDataByHeight) 
                        -sortedTestDataByHeight$Qualitaet)

  print("q1 is initialized visualize with: q1Results(), q1Errors()")
}

  
# Visualization
q1Result <- function(){
  plot(x=qualitaet, xlab="Qualit\U00E4t", 
       y=predictedQualitaet, ylab="Vorhergesagte Qualit\U00E4t", col=turquoise)
  points(seq(1.0, 2.0), col=pink)
}

q1Errors <- function(){
  plot(x=seq(1,length(error),by=1),y=sortedError,
               xlab="sortierte Abweichungen",
               ylab="absoluter Abweichungswert",
               ylim=c(0,0.2), col=pink)
  print(paste("Durchschnittliche Abweichung:", mean(sortedError)))
  #sqrt(mean(error))
}

q1ErrorsNachGewicht <- function(){
  plot(x=seq(1,length(errorByWeight),by=1),y=errorByWeight,
       xlab="sortierte Abweichungen nach Gewicht",
       ylab="absoluter Abweichungswert",
       ylim=c(0,0.2), col=pink)
}

q1ErrorsNachDurchmesser <- function(){
  plot(x=seq(1,length(errorByDiameter),by=1),y=errorByDiameter,
       xlab="sortierte Abweichungen nach Durchmesser",
       ylab="absoluter Abweichungswert",
       ylim=c(0,0.2), col=pink)
}

q1ErrorsNachHoehe <- function(){
  plot(x=seq(1,length(errorByHeight),by=1),y=errorByHeight,
       xlab="sortierte Abweichungen nach H\U00F6he",
       ylab="absoluter Abweichungswert",
       ylim=c(0,0.2), col=pink)
}
