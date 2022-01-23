#Q13_Ionisationsfaktor_NN


q13 <- function() {
  
  numColsSmartBuildDataFrame <- smartBuildDataFrame[,sapply
                                                    (smartBuildDataFrame, 
                                                      is.numeric)]
  
  max = apply(numColsSmartBuildDataFrame, 2 , max)
  min = apply(numColsSmartBuildDataFrame, 2 , min)
  
  scaledSmartBuildDataFrame = as.data.frame(scale(numColsSmartBuildDataFrame, 
                                                  center = min, 
                                                  scale = max - min))
  
  index <- sample(1:nrow(scaledSmartBuildDataFrame), 
                  size = nrow(scaledSmartBuildDataFrame)*0.8)
  
  scaledTrainData <- scaledSmartBuildDataFrame[index,]
  scaledTestData <- scaledSmartBuildDataFrame[-index,]
  
  scaledTrainData
  
  model <- neuralnet(Ionisationsfaktor~Hoehe,
                     scaledTrainData, hidden=c(3,3), act.fct = 'logistic', 
                     linear.output = T,
                     rep=2)
  plot(model)
  
  ?neuralnet
  
  pred <- compute(model, scaledTestData)
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