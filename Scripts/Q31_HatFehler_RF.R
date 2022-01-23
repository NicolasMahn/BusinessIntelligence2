# Q31 random forest on HatFehler

# With 200 trees
randomForestModel <- randomForest(HatFehler ~ Gewicht+Hoehe+Durchmesser, 
                                  data = trainData, 
                                  ntree=200,
                                  mtry=2,
                                  importance = TRUE)
randomForestModel

plot(randomForestModel)

predictions <- predict(randomForestModel, testData)

table(pred = predictions, real = testData$HatFehler)
#                Observed Class
# Predicted Class  Ja     Nein
# Ja              968      188
# Nein             47      797

mean(predictions == testData$HatFehler)
# 88.25%