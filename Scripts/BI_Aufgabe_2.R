# Comment out when package is not installed
# install.packages("readr")
# install.packages("RCOR")
# install.packages("party")
# install.packages("rgl")

# Libraries
library("readr")
library("RCOR")
library("party")
library("rgl")

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

# Here can filter and factoring be defined
smartBuildDataFrame <- smartBuildDataFrame[ , ]
smartBuildDataFrame$Fehler <- as.factor(smartBuildDataFrame$Fehler)
smartBuildDataFrame$XKlasse <- as.factor(smartBuildDataFrame$XKlasse)
smartBuildDataFrame$LScore <- as.factor(smartBuildDataFrame$LScore)

# set Seed
set.seed(42)

# Split into train (80%) and test data (20%)
selectIndex <- sample(1:nrow(smartBuildDataFrame), size=round(0.8*nrow(smartBuildDataFrame)))
trainData <- smartBuildDataFrame[selectIndex, ]
testData <- smartBuildDataFrame[-selectIndex, ]