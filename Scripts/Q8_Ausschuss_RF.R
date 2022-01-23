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


# ROCR Kurve
predicted <- predict(randomForestModel, testData, type="prob")
pred <- data.frame(t(matrix(unlist(predicted), 2)))
#calculating the probability that an instance belongs to a given class
pred_prob <- pred[ , 1]
pred_prob <- 1 - pred_prob
#obtaining the RoC Curve
pr <- prediction(pred_prob, testData$IstQualitativ)
roc <- performance(pr, "tpr", "fpr")
plot(roc)
# Line from 0 to 1
abline(0,1)
