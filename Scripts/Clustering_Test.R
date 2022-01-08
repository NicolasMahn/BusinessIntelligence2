points3d(smartBuildDataFrame$Durchmesser, 
         smartBuildDataFrame$Hoehe, 
         smartBuildDataFrame$Gewicht)
axes3d()


points3d(smartBuildDataFrame$Durchmesser, 
         smartBuildDataFrame$Hoehe, 
         smartBuildDataFrame$Gewicht, 
         col=as.numeric(smartBuildDataFrame$Fehler))
axes3d()
sortedByGewicht <- smartBuildDataFrame[order(smartBuildDataFrame$Gewicht),]
plot(seq(1,length(sortedByGewicht$Gewicht), by= 1), 
     sortedByGewicht$Gewicht, col=as.numeric(sortedByGewicht$Fehler))
# black = Ausschuss
# red = Nein
# green = Fehler im Toleranzbereich



points3d(smartBuildDataFrame$Durchmesser, 
         smartBuildDataFrame$Hoehe, 
         smartBuildDataFrame$Gewicht, 
         col = as.numeric(smartBuildDataFrame$XKlasse))
axes3d()


points3d(smartBuildDataFrame$Durchmesser, 
         smartBuildDataFrame$Hoehe, 
         smartBuildDataFrame$Gewicht, 
         col = as.numeric(smartBuildDataFrame$LScore))
axes3d()
sortedByGewicht <- smartBuildDataFrame[order(smartBuildDataFrame$Gewicht),]
plot(seq(1,length(sortedByGewicht$Gewicht), by= 1), 
     sortedByGewicht$Gewicht, col=as.numeric(sortedByGewicht$LScore))

