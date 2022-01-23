#Q12_Ionisationsfaktor_LR


q12 <- function() {
  #
  # First Approach
  #
  
  # Sort the data frames
  sortedTestData <- testData[order(testData$Ionisationsfaktor), ]
  sortedTrainData <- trainData[order(trainData$Ionisationsfaktor), ]
  
  model <- lm(Ionisationsfaktor~Durchmesser+Hoehe+Gewicht, sortedTrainData)
  predictedIonisationsfaktor <<- predict(model, sortedTestData)
  ionisationsfaktor <<- sortedTestData$Ionisationsfaktor
  
  error <- abs(predictedIonisationsfaktor - ionisationsfaktor)
  sortedError <<- error[order(error)]
  
  
  # sorted by weight
  sortedTestDataByWeight <<- testData[order(testData$Gewicht), ]
  sortedTrainDataByWeight <- trainData[order(trainData$Gewicht), ]
  
  model <- lm(Ionisationsfaktor~Durchmesser+Hoehe+Gewicht, sortedTrainDataByWeight)
  errorByWeight <<- abs(predict(model, sortedTestDataByWeight) 
                        -sortedTestDataByWeight$Ionisationsfaktor)
  
  # sorted by diameter
  sortedTestDataByDiameter <<- testData[order(testData$Durchmesser), ]
  sortedTrainDataByDiameter <- trainData[order(trainData$Durchmesser), ]
  
  model <- lm(Ionisationsfaktor~Durchmesser+Hoehe+Gewicht, sortedTrainDataByDiameter)
  errorByDiameter <<- abs(predict(model, sortedTestDataByDiameter) 
                          -sortedTestDataByDiameter$Ionisationsfaktor)
  
  # sorted by height
  sortedTestDataByHeight <- testData[order(testData$Hoehe), ]
  sortedTrainDataByHeight <- trainData[order(trainData$Hoehe), ]
  
  model <- lm(Ionisationsfaktor~Durchmesser+Hoehe+Gewicht, sortedTrainDataByHeight)
  errorByHeight <<- abs(predict(model, sortedTestDataByHeight) 
                        -sortedTestDataByHeight$Ionisationsfaktor)
  
  print("q12 is initialized visualize with: q12Results(), q12Errors()")
}

# Visualization
q12Result <- function(){
  plot(x=ionisationsfaktor, xlab="Ionisationsfaktor", xlim= c(12,35), 
       y=predictedIonisationsfaktor, ylab="Vorhergesagter Ionisationsfaktor", 
       ylim= c(12,35), col=turquoise)
  points(seq(1.0, 35.0), col=orange, type="l")
}

q12Errors <- function(){
  plot(x=seq(1,length(error),by=1),y=sortedError,
       xlab="sortierte Abweichungen",
       ylab="absoluter Abweichungswert",
       col=orange)
  print(paste("Durchschnittliche Abweichung:", mean(sortedError)))
  #sqrt(mean(error))
}

q12ErrorsNachGewicht <- function(){
  plot(x=seq(1,length(errorByWeight),by=1),y=errorByWeight,
       xlab="sortierte Abweichungen nach Gewicht",
       ylab="absoluter Abweichungswert",
       col=orange)
}

q12ErrorsNachDurchmesser <- function(){
  plot(x=seq(1,length(errorByDiameter),by=1),y=errorByDiameter,
       xlab="sortierte Abweichungen nach Durchmesser",
       ylab="absoluter Abweichungswert",
       col=orange)
}

q12ErrorsNachHoehe <- function(){
  plot(x=seq(1,length(errorByHeight),by=1),y=errorByHeight,
       xlab="sortierte Abweichungen nach H\U00F6he",
       ylab="absoluter Abweichungswert",
       col=orange)
}
