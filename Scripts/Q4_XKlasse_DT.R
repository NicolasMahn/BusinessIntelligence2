#Aufgabe 4:
#XKlasse

#Hier wurde das DecisionTree Model genutzt:

treeModel <- ctree (XKlasse ~ Gewicht+Hoehe+Durchmesser, trainData)
# plot(treeModel)

results <- predict(treeModel, testData)
#Evaluieren und prüfen Sie Ihre Ergebnisse
table (Vorhergesagt = results, Tatsaechlich = testData$XKlasse)

#Tatsaechlich
#Vorhergesagt   gut mittel schlecht
#gut             160      0        1
#mittel           41    731       61
#schlecht         12     20      974

accuracy <- sum (results == testData$XKlasse) / nrow(testData)
accuracy
# 24.25%

plot(treeModel)
