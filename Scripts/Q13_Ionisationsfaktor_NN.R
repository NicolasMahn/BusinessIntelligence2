#Q13_Ionisationsfaktor_NN


q13 <- function() {
  
  model <- neuralnet(Ionisationsfaktor~Hoehe,
                     scaledTrainData, hidden=c(3,3), act.fct = 'logistic', 
                     linear.output = T,
                     rep=2)
  plot(model)
  
  pred <- neuralnet::compute(model, scaledTestData)
  pred$net.result
  pred$net.result = (pred$net.result * (max(testData$Ionisationsfaktor) 
                                        - min(testData$Ionisationsfaktor))) 
                    + min(testData$Ionisationsfaktor)
  pred$net.result
  err <- mean(abs(pred$net.result - testData$Ionisationsfaktor))
  err
  
  
  #linModel <- lm(X3~., housesDF)
  #linPred <- predict(linModel, testHousesDF)
  #mean(abs(linPred - testHousesDF$X3))
}