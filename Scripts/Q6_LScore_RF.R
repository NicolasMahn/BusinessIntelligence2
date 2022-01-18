#Aufgabe 6:
#LScore Random Forest

#Hier wurde das Random Forest Model genutzt:

library(randomForest)
library(party)

# 200 trees
randomForestModel <- randomForest(LScore ~ Gewicht+Hoehe+Durchmesser, 
                                  data = trainData, 
                                  ntree=200,
                                  mtry=3,
                                  importance = TRUE)

randomForestModel

# plot(randomForestModel)
predictions <- predict(randomForestModel, testData)

table(pred = predictions, real = testData$LScore)
#           real
# pred       gut mittel schlecht
# gut        158      3        1
# mittel     41    726       61
# schlecht   14     22      974

mean(predictions == testData$LScore)
# 93%

plot(randomForestModel)
