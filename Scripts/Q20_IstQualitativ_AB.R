# Q20 AdaBoost on IstQualitativ

# With 200 trees
adaBoostModel <- boosting(IstQualitativ~Hoehe+Durchmesser+Gewicht,
                          data = trainData, 
                          boos = TRUE, 
                          mfinal = 200)
adaBoostModel
# importance
# Durchmesser     Gewicht       Hoehe 
# 32.4882         38.7007       28.8111

predictions <- predict(adaBoostModel, testData)

predictions$confusion
#       real
# pred    Ja   Nein
# Ja      953  47
# Nein    60   940

mean(predictions$class == testData$IstQualitativ)
# 94.


# Decision Tree for comparison
treeModel <- ctree(IstQualitativ~Hoehe+Durchmesser+Gewicht, trainData)
predict <- predict(treeModel, testData)

table(pred = predict, real = testData$IstQualitativ)
#       real
# pred    Ja   Nein
# Ja      827  150
# Nein    186  837

mean(predict==testData$IstQualitativ)
# 93.25%
