#Aufgabe 5:
#XKlasse Random Forest

#Hier wurde das Random Forest Model genutzt:

library(randomForest)
library(party)

print("-----------Random Forest---------------------")
randomForestModel <- randomForest(XKlasse ~ Gewicht+Hoehe+Durchmesser, 
                                  data = trainData, 
                                  ntree=50,
                                  mtry=3,
                                  importance = TRUE)

randomForestModel

# plot(randomForestModel)

predictions <- predict(randomForestModel, testData)

table(pred = predictions, real = testData$XKlasse)
#       real
# pred   I     II    III   IV
# I      119   123   122   130
# II     116   156   140   122
# III    104   123   114   141
# IV     126   120   124   120


mean(predictions == testData$XKlasse)
# 25.5%

plot(randomForestModel)


