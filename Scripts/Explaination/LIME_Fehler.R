library(lime)
library(MASS)
library(randomForest)
library(caret)
library(e1071)
library(party)

# LIME Explanation for Fehler for a showcase

trainDataInputs <- trainData[ , c(2,3,4,6)]
testDataInputs <- testData[ , c(2,3,4,6)]


# random forest with caret library
modelRandom <- caret::train(Fehler ~ Gewicht+Hoehe+Durchmesser,
                         data = trainDataInputs,
                         method = "rf", 
                         trControl = trainControl(method = "repeatedcv", 
                                                  number = 10,
                                                  repeats = 2, 
                                                  verboseIter = FALSE)
)
modelRandom


results <- predict(modelRandom, testDataInputs)
confusionMatrix(results,testDataInputs$Fehler)
explainer <- lime(testDataInputs, modelRandom)
explanation <- explain(testDataInputs[sample(1:nrow(testDataInputs), 4), ], explainer, n_labels = 1, n_features = 3)
plot_features(explanation, ncol = 2)

