# Q21 AdaBoost on LScore

# With 200 trees
adaBoostModel <- boosting(LScore~Hoehe+Durchmesser+Gewicht,
                          data = trainData, 
                          boos = TRUE, 
                          mfinal = 50)
adaBoostModel
# importance
# Durchmesser     Gewicht       Hoehe 
# 0.121310192     99.874822357  0.003867451

predictions <- predict(adaBoostModel, testData)

predictions$confusion
#               Observed Class
#Predicted Class gut mittel schlecht
#       gut      160      0        1
#       mittel    41    731       61
#       schlecht  12     20      974

mean(predictions$class == testData$LScore)
# 93.25%