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

accuracy <- mean(results == testData$Fehler)
accuracy
# 0.786

plot(treeModel)

