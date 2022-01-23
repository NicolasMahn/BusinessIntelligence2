#Everything is executed from here

#To run this command in the console to execute this Skript
#source("Scripts/Main.R")


main <-function() {

  #Load all Scripts
  
  source("Scripts/Q13_Ionisationsfaktor_NN.R")
  source("Scripts/Q12_Ionisationsfaktor.R")
  source("Scripts/Q1_Qualitaet_LR.R")
  source("Scripts/Configuration/Package_Managing.R")
  source("Scripts/Configuration/Load_Data.R")
  source("Scripts/Configuration/Style.R")
  #source("Scripts/SHAP/shap.R")
  #source("Scripts/SHAP/Q4.R")
  #source("Scripts/SHAP/Q5.R")
  #source("Scripts/SHAP/Q6.R")
  #source("Scripts/SHAP/Q7.R")
  #source("Scripts/SHAP/Q8.R")
  
  #Load all Packages
  loadPackages()
  #the first time the script is run it doesn't always load all packages...
  
  #Load Data into Global Variables
  loadData()
  
  #Load Style
  loadStyle()
  
  #Execute 
  print("Execute functions with 'qx()' (ex. for Q1 'q1()') ")
  

}
main()

