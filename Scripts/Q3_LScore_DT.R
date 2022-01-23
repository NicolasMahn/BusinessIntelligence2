#Aufgabe 3:
#Erläutern Sie die von Ihnen zur Datenanalyse genutzten Konzepte

#Hier wurde das DecisionTree Model genutzt:

treeModel <- ctree (LScore ~ Gewicht+Hoehe+Durchmesser, trainData)
# plot(treeModel)

results <- predict(treeModel, testData)
#Evaluieren und prüfen Sie Ihre Ergebnisse
table (Vorhergesagt = results, Tatsaechlich = testData$LScore)

               #Tatsaechlich
#Vorhergesagt   gut mittel schlecht
#gut             160      0        1
#mittel           41    731       61
#schlecht         12     20      974

accuracy <- sum (results == testData$LScore) / nrow(testData)
accuracy

plot(treeModel)
#[1] 0.9325