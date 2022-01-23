# Q30 AdaBoost on HatFehler

# AdaBoost
adaBoostModel <- boosting(HatFehler~Hoehe+Durchmesser+Gewicht,
                          data = trainData, 
                          boos = TRUE, 
                          mfinal = 50)
adaBoostModel
# importance
# Durchmesser     Gewicht       Hoehe 
# 0.4586497     98.4020309   1.1393195

predictions <- predict(adaBoostModel, testData)

predictions$confusion
#                Observed Class
# Predicted Class  Ja     Nein
# Ja              979      187
# Nein             36      798

mean(predictions$class == testData$HatFehler)
# 88.85%

