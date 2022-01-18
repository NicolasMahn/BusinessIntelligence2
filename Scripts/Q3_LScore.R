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
#Unter _x
#Prüfen Sie, auf welcher Basis Ihre Modelle die Prognose erzeugen

# Auf Grundlage Gewicht, Hoehe und Durchmesser die Prognose erzeugt. 
# Gewicht ist alleine ausschlaggebend für die Generierung des DecisionTree.

#Anmerkung: Ggf. können Sie auch zeigen, dass keine gute Vorhersage (mit den von uns behandelten Modellen)möglich ist.