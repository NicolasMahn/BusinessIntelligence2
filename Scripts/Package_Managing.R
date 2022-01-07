# Install packages, when these libraries were never installed
# Last Update: 04.01.2022 18:30

#This file will install all necessary packages:
#install.packages("readr")
#install.packages("ROCR")
#install.packages("party")
#install.packages("rgl")
#install.packages("xgboost")
#install.packages("shapr")

#install.packages("tidyverse")
#install.packages("caret")


# =======
loadPackages <- function() {
  
  print("---INSTALLING AND LOADING PACKAGES...---")
  
  packages <- c(
  #Add packages here:
  "rgl", 
  "readr",
  "ROCR",
  "party",
  "xgboost",
  "shapr",
  "tidyverse",
  "caret"
  )
  
  package.check <- lapply(
       packages,
       FUN = function(x) {
         if (!require(x, character.only = TRUE)) {
             install.packages(x, dependencies = TRUE)
         }
         library(x, character.only = TRUE)
       }
   )
  print("---ALL PACKAGES ARE INSTALLED AND LOADED---")
}
#>>>>>>> 7100ead48be8003834a41beb4c9ad8fd25aeb000
