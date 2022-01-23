loadData <-function(seed = 42, trainPortion = 0.8) {
  
  print("---LOADING DATA...---")
  
  # Change path for read
  smartBuildDataFrame <- read_csv("./Data/SmartBuild.csv")

  # Result
  # Rows: 10000 Columns: 14                                                       
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
  
  # Add attributes Ausschuss and IstQualitativ
  # Here is one against all concept
  smartBuildDataFrame$Ausschuss <- ifelse(smartBuildDataFrame$Fehler == "Ausschuss", "Ja", "Nein")
  smartBuildDataFrame$IstQualitativ <- ifelse(smartBuildDataFrame$Qualitaet >= 1.5, "Ja", "Nein")
  
  # Here can filter and factoring be defined
  smartBuildDataFrame <- smartBuildDataFrame[ , ]
  smartBuildDataFrame$Fehler <- as.factor(smartBuildDataFrame$Fehler)
  smartBuildDataFrame$XKlasse <- as.factor(smartBuildDataFrame$XKlasse)
  smartBuildDataFrame$LScore <- as.factor(smartBuildDataFrame$LScore)
  smartBuildDataFrame$Ausschuss <- as.factor(smartBuildDataFrame$Ausschuss)
  smartBuildDataFrame$IstQualitativ <- as.factor(smartBuildDataFrame$IstQualitativ)
  
  
  # Convert to clean data frame
  # class(smartBuildDataFrame)
  # "tbl_df"     "tbl"        "data.frame"
  smartBuildDataFrame <- data.frame(smartBuildDataFrame)
  # class(smartBuildDataFrame)
  # "data.frame"
  
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
  
  
  # Preparing Logistic Dataframe, since logistical regression needs either 1 or 0
  logisticDataFrame <- smartBuildDataFrame
  logisticDataFrame$Ausschuss <- ifelse(logisticDataFrame$Ausschuss == "Ja", 1, 0)
  logisticDataFrame$IstQualitativ <- ifelse(logisticDataFrame$IstQualitativ == "Ja", 1, 0)
  logisticDataFrame <<- logisticDataFrame
  print("The logistic dataframe can be found under 'logisticDataFrame'")
  
  logisticTrainData <<- logisticDataFrame[selectIndex, ]
  print("The logistic testing dataframe can be found under 'logisticTrainData'")
  logisticTestData <<- logisticDataFrame[-selectIndex, ]
  print("The logistic testing dataframe can be found under 'logisticTestData'")
  
  # Preparing scaled Dataframe for neural nets
  numColsSmartBuildDataFrame <- smartBuildDataFrame[,sapply(smartBuildDataFrame, is.numeric)]
  max = apply(numColsSmartBuildDataFrame, 2 , max)
  min = apply(numColsSmartBuildDataFrame, 2 , min)
  
  scaledSmartBuildDataFrame = as.data.frame(scale(numColsSmartBuildDataFrame, center = min, scale = max - min))
  scaledSmartBuildDataFrame <<- scaledSmartBuildDataFrame
  print("The scaled dataframe can be found under 'scaledSmartBuildDataFrame'")
  
  scaledTrainData <- scaledSmartBuildDataFrame[selectIndex,]
  print("The scaled dataframe can be found under 'scaledTrainData'")
  scaledTestData <- scaledSmartBuildDataFrame[-selectIndex,]
  print("The scaled dataframe can be found under 'scaledTestData'")
  
  print("---DATA HAS BEEN LOADED---")
}
