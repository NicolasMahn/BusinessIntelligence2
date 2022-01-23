#Q10_Fluxkomensation_LR


q10 <- function() {
  #
  # First Approach
  #
  
  # Sort the data frames
  sortedTestData <- testData[order(testData$Fluxkomensation), ]
  sortedTrainData <- trainData[order(trainData$Fluxkomensation), ]
  
  model <- lm(Fluxkomensation~Durchmesser+Hoehe+Gewicht, sortedTrainData)
  predictedFluxkomensation <<- predict(model, sortedTestData)
  fluxkomensation <<- sortedTestData$Fluxkomensation
  
  error <- abs(predictedFluxkomensation - fluxkomensation)
  sortedError <<- error[order(error)]
  
  
  # sorted by weight
  sortedTestDataByWeight <<- testData[order(testData$Gewicht), ]
  sortedTrainDataByWeight <- trainData[order(trainData$Gewicht), ]
  
  model <- lm(Fluxkomensation~Durchmesser+Hoehe+Gewicht, sortedTrainDataByWeight)
  errorByWeight <<- abs(predict(model, sortedTestDataByWeight) 
                        -sortedTestDataByWeight$Fluxkomensation)
  
  # sorted by diameter
  sortedTestDataByDiameter <<- testData[order(testData$Durchmesser), ]
  sortedTrainDataByDiameter <- trainData[order(trainData$Durchmesser), ]
  
  model <- lm(Fluxkomensation~Durchmesser+Hoehe+Gewicht, sortedTrainDataByDiameter)
  errorByDiameter <<- abs(predict(model, sortedTestDataByDiameter) 
                          -sortedTestDataByDiameter$Fluxkomensation)
  
  # sorted by height
  sortedTestDataByHeight <- testData[order(testData$Hoehe), ]
  sortedTrainDataByHeight <- trainData[order(trainData$Hoehe), ]
  
  model <- lm(Fluxkomensation~Durchmesser+Hoehe+Gewicht, sortedTrainDataByHeight)
  errorByHeight <<- abs(predict(model, sortedTestDataByHeight) 
                        -sortedTestDataByHeight$Fluxkomensation)
  
  print("q10 is initialized visualize with: q10Results(), q10Errors()")
}

# Visualization
q10Result <- function(){
  plot(x=fluxkomensation, xlab="Fluxkomensation", xlim= c(12,35), 
       y=predictedFluxkomensation, ylab="Vorhergesagte Fluxkomensation", 
       ylim= c(12,35), col=turquoise)
  points(seq(1.0, 35.0), col=lightTurquoise, type="l")
}

q10Errors <- function(){
  plot(x=seq(1,length(error),by=1),y=sortedError,
       xlab="sortierte Abweichungen",
       ylab="absoluter Abweichungswert",
       col=orange)
  print(paste("Durchschnittliche Abweichung:", mean(sortedError)))
  #sqrt(mean(error))
}

q10ErrorsNachGewicht <- function(){
  plot(x=seq(1,length(errorByWeight),by=1),y=errorByWeight,
       xlab="sortierte Abweichungen nach Gewicht",
       ylab="absoluter Abweichungswert",
       col=orange)
}

q10ErrorsNachDurchmesser <- function(){
  plot(x=seq(1,length(errorByDiameter),by=1),y=errorByDiameter,
       xlab="sortierte Abweichungen nach Durchmesser",
       ylab="absoluter Abweichungswert",
       col=orange)
}

q10ErrorsNachHoehe <- function(){
  plot(x=seq(1,length(errorByHeight),by=1),y=errorByHeight,
       xlab="sortierte Abweichungen nach H\U00F6he",
       ylab="absoluter Abweichungswert",
       col=orange)
}
