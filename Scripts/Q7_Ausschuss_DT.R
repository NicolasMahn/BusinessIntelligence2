# Q7 Decision Tree on Ausschuss

treeModel <- ctree(as.factor(Ausschuss) ~ Gewicht+Hoehe+Durchmesser, trainData)

plot(treeModel)

predictions <- predict(treeModel, testData)

table(pred = predictions, real = testData$Ausschuss)
#      real
# pred    Ja   Nein
# Ja      692  313
# Nein    110  885

mean(predictions == testData$Ausschuss)
# 78.85%
