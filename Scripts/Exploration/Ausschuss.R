# Fehler Exploration

# Add new Attribute Ausschuss
# One against all. Fehler --> Ausschuss (Ausschuss = "ja", nein and Fehler im Toleranzbereich = "nein")
smartBuildDataFrame$Ausschuss <- ifelse(smartBuildDataFrame$Fehler == "Ausschuss", "ja", "nein")
smartBuildDataFrame$Ausschuss <- as.factor(smartBuildDataFrame$Ausschuss)

summary(smartBuildDataFrame$Ausschuss)
# ja          nein 
# 3969        6031 

smartBuildDataFrameFiltered = smartBuildDataFrame$Gewicht >= 250 & smartBuildDataFrame$Gewicht <= 300
smartBuildDataFrameFiltered = smartBuildDataFrame[smartBuildDataFrameFiltered,]
summary(smartBuildDataFrameFiltered$Ausschuss)
# ja          nein 
# 128         4132 


smartBuildDataFrameFiltered = smartBuildDataFrame$Gewicht > 300
smartBuildDataFrameFiltered = smartBuildDataFrame[smartBuildDataFrameFiltered,]
summary(smartBuildDataFrameFiltered$Ausschuss)
# ja           nein
# 405           434 


smartBuildDataFrameFiltered = smartBuildDataFrame$Gewicht < 250
smartBuildDataFrameFiltered = smartBuildDataFrame[smartBuildDataFrameFiltered,]
summary(smartBuildDataFrameFiltered$Ausschuss)
# ja            nein 
# 3436          1465

