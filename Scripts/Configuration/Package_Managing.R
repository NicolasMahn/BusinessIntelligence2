# Install packages, when these libraries were never installed
# Last Update: 20.01.2022 08:30

#This file will install all necessary packages

# =======
loadPackages <- function() {
  print("---INSTALLING AND LOADING PACKAGES...---")
  
  packages <- c(
  #Add packages to install and add here:
  "rgl", 
  "readr",
  "ROCR",
  "party",
  "xgboost",
  "shapr",
  "tidyverse",
  "caret",
  "extrafont",
  "remotes",
  "rpart",
  "rpart.plot",
  "randomForest",
  "neuralnet",
  "adabag",
  "fastAdaboost",
  "robustbase",
  "microbenchmark"
  )
  
  package.check <- lapply(
       packages,
       FUN = function(x) {
         if (!require(x, character.only = TRUE)) {
             install.packages(x, dependencies = TRUE)
         }
         library(x, character.only = TRUE)
         library(x, character.only = TRUE)
         #When the Code is executed for the first time on a device the 
         #libraries sometimes don't load properly, I hope that this fixes it.
         
       }
   )
  print("---ALL PACKAGES ARE INSTALLED AND LOADED---")
  
}
#>>>>>>> 7100ead48be8003834a41beb4c9ad8fd25aeb000

