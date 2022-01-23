# Q19 Random Forest on IstQualitativ

# With 200 trees
randomForestModel <- randomForest(IstQualitativ ~ Gewicht+Hoehe+Durchmesser, 
                                  data = trainData, 
                                  ntree=200,
                                  mtry=2,
                                  importance = TRUE)
randomForestModel

plot(randomForestModel)

predictions <- predict(randomForestModel, testData)

table(pred = predictions, real = testData$IstQualitativ)
#       real
# pred    Ja   Nein
# Ja      913  88
# Nein    100  899

mean(predictions == testData$IstQualitativ)
# 90.6%
