library(randomForest)
library(party)

# Q8 Random Forest on Ausschuss

# With 200 trees
randomForestModel <- randomForest(Ausschuss ~ Gewicht+Hoehe+Durchmesser, 
                                  data = trainData, 
                                  ntree=50,
                                  mtry=3,
                                  importance = TRUE)
randomForestModel

plot(randomForestModel)

predictions <- predict(randomForestModel, testData)

table(pred = predictions, real = testData$Ausschuss)
#       real
# pred    Ja   Nein
# Ja      645  294
# Nein    157  904

mean(predictions == testData$Ausschuss)
# 77.45%
