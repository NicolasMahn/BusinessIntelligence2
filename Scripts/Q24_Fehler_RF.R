#Aufgabe 24:
#Fehler Random Forest

#Hier wurde das Random Forest Model genutzt:
# 200 trees, 2 variables
randomForestModel <- randomForest(Fehler ~ Gewicht+Hoehe+Durchmesser, 
                                  data = trainData, 
                                  ntree=200,
                                  mtry=2,
                                  importance = TRUE)
randomForestModel
# plot(randomForestModel)
predictions <- predict(randomForestModel, testData)

table(pred = predictions, real = testData$Fehler)
#                             real
# pred                        Ausschuss Fehler im Toleranzbereich nein      Fehler
# Ausschuss                       686                       149  170        0.16
# Fehler im Toleranzbereich        74                        52   13        0.78
# nein                             42                        12  802        0.17

mean(predictions == testData$Fehler)
# 77.05%

plot(randomForestModel)
