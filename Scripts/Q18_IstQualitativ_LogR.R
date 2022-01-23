# Q8 with logistical regression for IstQualitativ

# Logistische Regression
logisticModel <- glm(IstQualitativ ~ Gewicht+Hoehe+Durchmesser, 
                     family = "binomial", data = logisticTrainData)
results <- predict(logisticModel, logisticTestData, type = "response")

modResults <- ifelse(results > 0.5, 1, 0)

table(vorhergesagt = modResults, real = logisticTestData$IstQualitativ)
#             real
# vorhergesagt   0   1
#           0  930  74
#           1   57 939
mean(modResults == logisticTestData$IstQualitativ)
# 93.45%

# Datenpunkte bei 1.0 sind qualitativ, bei 0 nicht
newData <- data.frame(Gewicht = seq(min(logisticTestData$Gewicht), 
                                    max(logisticTestData$Gewicht), 
                                    len=nrow(logisticTestData)),
                      Hoehe = seq(min(logisticTestData$Hoehe), 
                                  max(logisticTestData$Hoehe), 
                                  len=nrow(logisticTestData)),
                      Durchmesser = seq(min(logisticTestData$Hoehe), 
                                        max(logisticTestData$Hoehe), 
                                        len=nrow(logisticTestData)))
newData$QualPred = predict(logisticModel, newData, type="response")



# Plot der Sigmoid Kurve nur mit Hoehe und Gewicht
plot3d(logisticTestData$Gewicht, logisticTestData$Hoehe, 
       logisticTestData$Qualitaet, col=(logisticTestData$IstQualitativ+1))
#points3d(newData$Gewicht, newData$Hoehe, newData$QualPred, col=lightTurquoise)
