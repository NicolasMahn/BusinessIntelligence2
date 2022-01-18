#Aufga
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
# 24.25%be 4:
#XKlasse

#Hier wurde das DecisionTree Model genutzt:


tM <- rpart (XKlasse ~ Gewicht+Hoehe+Durchmesser, trainData)
rpart.plot(tM, type=4, extra = 109,col = textColor, 
           branch.col=textColor, split.col = textColor, 
           box.palette = list(pink, orange, turquoise, blue))
