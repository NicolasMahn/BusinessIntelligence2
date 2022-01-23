# Q7 Decision Tree on Ausschuss

treeModel <- ctree(as.factor(Ausschuss) ~ Gewicht+Hoehe+Durchmesser, trainData)

tM <- rpart (as.factor(Ausschuss) ~ Gewicht+Hoehe+Durchmesser, trainData)
rpart.plot(tM, type=4, extra = 109, col = textColor, 
           branch.col=textColor, split.col = textColor, 
           box.palette = list(pink, orange, turquoise, blue))

predictions <- predict(treeModel, testData)

table(pred = predictions, real = testData$Ausschuss)
#      real
# pred    Ja   Nein
# Ja      692  313
# Nein    110  885

mean(predictions == testData$Ausschuss)
# 78.85%


# ROCR Kurve
predicted <- predict(treeModel, testData, type="prob")
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
