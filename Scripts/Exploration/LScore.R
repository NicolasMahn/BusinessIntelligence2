# LScore Exploration

summary(smartBuildDataFrame$LScore)
# gut   mittel schlecht 
# 1195     3775     5030


smartBuildDataFrameFiltered = smartBuildDataFrame$Gewicht < 250
smartBuildDataFrameFiltered = smartBuildDataFrame[smartBuildDataFrameFiltered,]
summary(smartBuildDataFrameFiltered$LScore)
# gut   mittel schlecht 
#  84       85     4732


smartBuildDataFrameFiltered = smartBuildDataFrame$Gewicht >= 250 & smartBuildDataFrame$Gewicht <= 300
smartBuildDataFrameFiltered = smartBuildDataFrame[smartBuildDataFrameFiltered,]
summary(smartBuildDataFrameFiltered$LScore)
# gut   mittel schlecht 
# 282     3682      296 


smartBuildDataFrameFiltered = smartBuildDataFrame$Gewicht > 300
smartBuildDataFrameFiltered = smartBuildDataFrame[smartBuildDataFrameFiltered,]
summary(smartBuildDataFrameFiltered$LScore)
# gut   mittel schlecht 
# 829        8        2 

smartBuildDataFrameFiltered <- smartBuildDataFrame[smartBuildDataFrame$LScore == "gut",]
summary(smartBuildDataFrameFiltered)

smartBuildDataFrameFiltered <- smartBuildDataFrame[smartBuildDataFrame$LScore == "schlecht",]
summary(smartBuildDataFrameFiltered)

smartBuildDataFrameFiltered <- smartBuildDataFrame[smartBuildDataFrame$LScore == "mittel",]
summary(smartBuildDataFrameFiltered)
