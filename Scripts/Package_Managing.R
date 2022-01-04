#This file will install all necessary packages:
loadPackages <- function() {
  
  packages <- c(
  #Add packages here:
  "rgl", 
  "readr",
  "ROCR",
  "party"
  )
  
  package.check <- lapply(
       packages,
       FUN = function(x) {
         if (!require(x, character.only = TRUE)) {
             install.packages(x, dependencies = TRUE)
             library(x, character.only = TRUE)
         }
       }
   )
  print("---ALL PACKAGES ARE INSTALLED AND LOADED---")
}