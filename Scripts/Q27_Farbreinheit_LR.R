#Q27_Farbreinheit_LR


q27 <- function() {
  
  # Sort the data frames
  sortedTestData <- testData[order(testData$Farbreinheit), ]
  sortedTrainData <- trainData[order(trainData$Farbreinheit), ]
  
  model <- lm(Farbreinheit~Durchmesser+Hoehe+Gewicht, sortedTrainData)
  predictedFarbreinheit <<- predict(model, sortedTestData)
  farbreinheit <<- sortedTestData$Farbreinheit
  
  error <- abs(predictedFarbreinheit - farbreinheit)
  sortedError <<- error[order(error)]
  
  # sorted by weight
  sortedTestDataByWeight <<- testData[order(testData$Gewicht), ]
  sortedTrainDataByWeight <- trainData[order(trainData$Gewicht), ]
  
  model <- lm(Farbreinheit~Durchmesser+Hoehe+Gewicht, sortedTrainDataByWeight)
  errorByWeight <<- abs(predict(model, sortedTestDataByWeight) 
                        -sortedTestDataByWeight$Farbreinheit)
  
  # sorted by diameter
  sortedTestDataByDiameter <<- testData[order(testData$Durchmesser), ]
  sortedTrainDataByDiameter <- trainData[order(trainData$Durchmesser), ]
  
  model <- lm(Farbreinheit~Durchmesser+Hoehe+Gewicht, sortedTrainDataByDiameter)
  errorByDiameter <<- abs(predict(model, sortedTestDataByDiameter) 
                          -sortedTestDataByDiameter$Farbreinheit)
  
  # sorted by height
  sortedTestDataByHeight <- testData[order(testData$Hoehe), ]
  sortedTrainDataByHeight <- trainData[order(trainData$Hoehe), ]
  
  model <- lm(Farbreinheit~Durchmesser+Hoehe+Gewicht, sortedTrainDataByHeight)
  errorByHeight <<- abs(predict(model, sortedTestDataByHeight) 
                        -sortedTestDataByHeight$Farbreinheit)
  
  print("q27 is initialized visualize with: q27Results(), q27Errors()")
}


# Visualization
q27Result <- function(){
  plot(x=farbreinheit, xlab="Farbreinheit", 
       y=predictedFarbreinheit, ylab="Vorhergesagte Farbreinheit", 
       col=lightRose)
  #points(seq(1.0, 2.0), col=pink, type="l")
}

q27Errors <- function(){
  plot(x=seq(1,length(error),by=1),y=sortedError,
       xlab="sortierte Abweichungen",
       ylab="absoluter Abweichungswert",
       ylim=c(0,0.2), col=pink)
  print(paste("Durchschnittliche Abweichung:", mean(sortedError)))
  #sqrt(mean(error))
}

q27ErrorsNachGewicht <- function(){
  plot(x=seq(1,length(errorByWeight),by=1),y=errorByWeight,
       xlab="sortierte Abweichungen nach Gewicht",
       ylab="absoluter Abweichungswert",
       ylim=c(0,0.2), col=pink)
}

q27ErrorsNachDurchmesser <- function(){
  plot(x=seq(1,length(errorByDiameter),by=1),y=errorByDiameter,
       xlab="sortierte Abweichungen nach Durchmesser",
       ylab="absoluter Abweichungswert",
       ylim=c(0,0.2), col=pink)
}

q27ErrorsNachHoehe <- function(){
  plot(x=seq(1,length(errorByHeight),by=1),y=errorByHeight,
       xlab="sortierte Abweichungen nach H\U00F6he",
       ylab="absoluter Abweichungswert",
       ylim=c(0,0.2), col=pink)
}
