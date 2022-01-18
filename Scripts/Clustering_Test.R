plot3d(smartBuildDataFrame$Durchmesser, 
         smartBuildDataFrame$Hoehe, 
         smartBuildDataFrame$Gewicht)


max = apply(smartBuildDataFrame[,c(2:4)], 2, max)
max = apply(smartBuildDataFrame[,c(2:4)], 2, max)
scaled = as.data.frame(scale(smartBuildDataFrame[,c(2:4)], center = min, scale = max - min))


plot3d(smartBuildDataFrame$Durchmesser, 
         smartBuildDataFrame$Hoehe, 
         smartBuildDataFrame$Gewicht, 
         col=as.numeric(smartBuildDataFrame$Fehler))

sortedByGewicht <- smartBuildDataFrame[order(smartBuildDataFrame$Gewicht),]
plot(seq(1,length(sortedByGewicht$Gewicht), by= 1), 
     sortedByGewicht$Gewicht, col=as.numeric(sortedByGewicht$Fehler))
# black = Ausschuss
# red = Nein
# green = Fehler im Toleranzbereich



plot3d(smartBuildDataFrame$Durchmesser, 
         smartBuildDataFrame$Hoehe, 
         smartBuildDataFrame$Gewicht, 
         col = as.numeric(smartBuildDataFrame$XKlasse))


plot3d(smartBuildDataFrame$Durchmesser, 
         smartBuildDataFrame$Hoehe, 
         smartBuildDataFrame$Gewicht, 
         col = as.numeric(smartBuildDataFrame$LScore))
sortedByGewicht <- smartBuildDataFrame[order(smartBuildDataFrame$Gewicht),]
plot(seq(1,length(sortedByGewicht$Gewicht), by= 1), 
     sortedByGewicht$Gewicht, col=as.numeric(sortedByGewicht$LScore))

