#Aufgabe 2:
#Erläutern Sie die von Ihnen zur Datenanalyse genutzten Konzepte

#Hier wurde das DecisionTree Model genutzt:
  
treeModel <- ctree (Fehler ~ Gewicht+Hoehe+Durchmesser, trainData)
# plot(treeModel)

results <- predict(treeModel, testData)
#Evaluieren und prüfen Sie Ihre Ergebnisse
table (Vorhergesagt = results, Tatsaechlich = testData$Fehler)

                            #Tatsaechlich
#Vorhergesagt                Ausschuss Fehler im Toleranzbereich nein
#Ausschuss                       775                       204  188
#Fehler im Toleranzbereich         0                         0    0
#nein                             27                         9  797

accuracy <- sum (results == testData$Fehler) / nrow(testData)
accuracy
#[1] 0.786
#Unter
#Prüfen Sie, auf welcher Basis Ihre Modelle die Prognose erzeugen

plot(treeModel)

# Auf Grundlage Gewicht, Hoehe und Durchmesser die Prognose erzeugt. 
# Gewicht ist alleine ausschlaggebend für die Generierung des DecisionTree.

#Anmerkung: Ggf. können Sie auch zeigen, dass keine gute Vorhersage (mit den von uns behandelten Modellen)möglich ist.