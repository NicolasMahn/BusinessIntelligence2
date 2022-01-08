loadData <-function(seed = 42, trainPortion = 0.8) {
  
  print("---LOADING DATA...---")
  
  # Change path for read
  smartBuildDataFrame <- read.csv("./Data/SmartBuild.csv", nrows=9986)
  
  # Result
  # Rows: 9986 Columns: 14                                                       
  # -- Column specification ------------------------------------------------------
  #  Delimiter: ","
  # chr  (3): Fehler, XKlasse, LScore
  # dbl (11): id, Durchmesser, Hoehe, Gewicht, Qualitaet, Farbreinheit, ShineS...
  # 
  # i Use `spec()` to retrieve the full column specification for this data.
  # i Specify the column types or set `show_col_types = FALSE` to quiet this message.
  
  # Comment out for View
  # View(smartBuildDataFrame)
  
  # Comment out for Summary
  # summary(smartBuildDataFrame)
  
  # Here can filter and factoring be defined
  smartBuildDataFrame <- smartBuildDataFrame[ , ]
  smartBuildDataFrame$Fehler <- as.factor(smartBuildDataFrame$Fehler)
  smartBuildDataFrame$XKlasse <- as.factor(smartBuildDataFrame$XKlasse)
  smartBuildDataFrame$LScore <- as.factor(smartBuildDataFrame$LScore)
  
  smartBuildDataFrame <<- smartBuildDataFrame
  print("The entire dataframe can be found under 'smartBuildDataFrame'")
  
  # set Seed
  set.seed(seed)
  
  # Split into train and test data (default is 80%/20%)
  selectIndex <- sample(1:nrow(smartBuildDataFrame), size=round(trainPortion*nrow(smartBuildDataFrame)))
  trainData <<- smartBuildDataFrame[selectIndex, ]
  print("The training dataframe can be found under 'trainData'")
  testData <<- smartBuildDataFrame[-selectIndex, ]
  print("The testing dataframe can be found under 'testData'")
  
  print("---DATA HAS BEEN LOADED---")
}