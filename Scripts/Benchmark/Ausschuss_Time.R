install.packages("adabag")
install.packages("robustbase")
install.packages("microbenchmark")
install.packages("fastAdaboost")

library(randomForest)
library(microbenchmark)
library(fastAdaboost)
library(party)
library(caret)
library(robustbase)
library(adabag)


microbenchmark(
  model <- randomForest(Ausschuss ~ Gewicht+Hoehe+Durchmesser, 
                        data = trainData, 
                        ntree=50,
                        mtry=3,
                        importance = TRUE),
  times = 10L
)
pred = predict(model, testData)
table(vorhergesagt=pred, real=testData$Ausschuss)
mean(testData$Ausschuss == pred)
# milliseconds
# min       lq         mean        median     uq       max         neval
# 352.5382  370.19    399.0409     389.3379   421.8633 485.1736    10
# 77.85%


microbenchmark(
  model <- boosting(Ausschuss~Hoehe+Durchmesser+Gewicht, data = trainData, boos = TRUE, mfinal = 50),
  times = 10L
)
pred <- predict(model, testData)
pred$confusion
mean(testData$Ausschuss == pred$class)
# seconds
# min       lq         mean        median     uq       max         neval
# 7.446035  7.83156    9.244902    8.594524   10.98202 12.12873    10
# 78.6%


microbenchmark(
  model <- adaboost(Ausschuss~Gewicht,trainData, 50),
  times = 10L
)
pred = predict(model, testData)
print(pred$error)
table(vorhergesagt=pred$class, real=testData$Ausschuss)
mean(testData$Ausschuss == pred$class)
# seconds
# min       lq         mean        median     uq       max         neval
# 2.415945  2.499976   2.628062    2.658197   2.731998 2.780969    10
# 71.35%
