# Qualität

hist(smartBuildDataFrame$Qualitaet, ylab = "Anzahl an Produkten", xlab = "Qualität")
# Normalverteilung --> Six Sigma möglich?

summary(smartBuildDataFrame$Qualitaet)

# Skalierung
qualitaetDF <- smartBuildDataFrame[ , c(2,3,4,5)]

max = apply(qualitaetDF , 2 , max)
min = apply(qualitaetDF, 2 , min)
qualitaetDF = as.data.frame(scale(qualitaetDF, center = min, scale = max - min))

View(qualitaetDF)

qualitaetDF[order("Gewicht"),]
plot(qualitaetDF$Gewicht, qualitaetDF$Qualitaet)
# Mit steigendem Gewicht nimmt Qualitaet ab, jedoch starke Streuung

qualitaetDF[order("Hoehe"),]
plot(qualitaetDF$Hoehe, qualitaetDF$Qualitaet)
# Stake Streuung, minimaler Anstieg

qualitaetDF[order("Durchmesser"),]
plot(qualitaetDF$Durchmesser, qualitaetDF$Qualitaet)
# Stake Streuung, minimaler Anstieg, ähnlich Hoehe

# Von den Attributen alleine nicht abhängig

qualitaetDF[order("Hoehe", "Gewicht"),]
plot3d(qualitaetDF$Hoehe, qualitaetDF$Gewicht, qualitaetDF$Qualitaet)
# Hoehe Hoehe und niedriges Gewicht erhöhen die Qualitaet

qualitaetDF[order("Hoehe", "Durchmesser"),]
plot3d(qualitaetDF$Hoehe, qualitaetDF$Durchmesser, qualitaetDF$Qualitaet)
# Ausgabe als Kugel, sehr starke Streeung

qualitaetDF[order("Durchmesser", "Gewicht"),]
plot3d(qualitaetDF$Durchmesser, qualitaetDF$Gewicht, qualitaetDF$Qualitaet)
# Ähnliches Verhalten wie bei Gewicht und Hoehe, nur nicht so stark

# ==> Zusammenarbeit aller Attribute
plot3d(qualitaetDF$Durchmesser, qualitaetDF$Gewicht, qualitaetDF$Hoehe, 
       col=ifelse(qualitaetDF$Qualitaet > 0.5, 1, 2))

