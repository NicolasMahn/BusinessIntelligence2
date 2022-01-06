#Aufgabe 2:
#Erläutern Sie die von Ihnen zur Datenanalyse genutzten Konzepte

#Hier wurde das DecisionTree Model genutzt:
  
treeModel <- ctree (Fehler ~ Gewicht+Hoehe+Durchmesser, trainData)
plot(treeModel)
table (Vorhergesagt = results, Tatsaechlich = testData$LScore)


#Evaluieren und prüfen Sie Ihre Ergebnisse

accuracy <- sum (results == testData$LScore) / nrow(testData)

#Prüfen Sie, auf welcher Basis Ihre Modelle die Prognose erzeugen

# Auf Grundlage Gewicht, Hoehe und Durchmesser die Prognose erzeugt. 
# Gewicht ist alleine ausschlaggebend für die Generierung des DecisionTree.

#Anmerkung: Ggf. können Sie auch zeigen, dass keine gute Vorhersage (mit den von uns behandelten Modellen)möglich ist.