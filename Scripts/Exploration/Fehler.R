# Fehler Exploration

summary(smartBuildDataFrame$Fehler)
# Ausschuss     Fehler im Toleranzbereich      nein 
# 3969          1072                           4959

smartBuildDataFrameFiltered = smartBuildDataFrame$Gewicht >= 250 & smartBuildDataFrame$Gewicht <= 300
smartBuildDataFrameFiltered = smartBuildDataFrame[smartBuildDataFrameFiltered,]
summary(smartBuildDataFrameFiltered$Fehler)
# Ausschuss     Fehler im Toleranzbereich      nein 
# 128           52                             4080


smartBuildDataFrameFiltered = smartBuildDataFrame$Gewicht > 300
smartBuildDataFrameFiltered = smartBuildDataFrame[smartBuildDataFrameFiltered,]
summary(smartBuildDataFrameFiltered$Fehler)
# Ausschuss     Fehler im Toleranzbereich      nein 
# 405           269                            165


smartBuildDataFrameFiltered = smartBuildDataFrame$Gewicht < 250
smartBuildDataFrameFiltered = smartBuildDataFrame[smartBuildDataFrameFiltered,]
summary(smartBuildDataFrameFiltered$Fehler)
# Ausschuss     Fehler im Toleranzbereich      nein 
# 3436          751                            714
