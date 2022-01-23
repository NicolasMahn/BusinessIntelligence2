# Q25 AdaBoost on Fehler

# With 50 stumps
adaBoostModel <- boosting(Fehler~Hoehe+Durchmesser+Gewicht,
                          data = trainData, 
                          boos = TRUE, 
                          mfinal = 50)
adaBoostModel
# importance
# Durchmesser     Gewicht       Hoehe 
# 0.009671835     95.063748562  4.926579603

predictions <- predict(adaBoostModel, testData)

predictions$confusion
#                Observed Class
# Predicted Class                 Ausschuss Fehler im Toleranzbereich nein
# Ausschuss                       775       204                       187
# nein                            27        9                         798
# Fehler im Toleranzbereich       0         0                         0

mean(predictions$class == testData$Fehler)
# 78.65%