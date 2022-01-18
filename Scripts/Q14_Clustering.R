# Q14
# Clustering



set.seed(1)
num_cols <- sapply(trainingData, is.numeric)




num_cols <- sapply(trainData, is.numeric)
data_num = testData[,num_cols]



model




material3d(alpha=0.3)



data_num$Gewicht <- data_num$Gewicht/ max(data_num$Gewicht)
data_num$Hoehe <- data_num$Hoehe/ max(data_num$Hoehe)
data_num$Durchmesser <- data_num$Durchmesser/ max(data_num$Durchmesser)
model <- kmeans(data_num,4)



plot3d(data_num$Durchmesser,data_num$Hoehe,data_num$Gewicht, size=10, col=model$cluster)
table(Lscore = testData$LScore, cluster = model$cluster)




table(Lscore = testData$XKlasse, cluster = model$cluster)