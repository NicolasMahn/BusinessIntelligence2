#Everything is executed from here

#To run this in the Console type these two commands
#> source("Scripts/Main.R")
#> main()



main <-function() {

  #Load all Scripts
  source("Scripts/Package_Managing.R")
  source("Scripts/Load_Data.R")
  source("Scripts/Q1.R")
  
  #Load all Packages
  loadPackages()
  
  #Load Data into Global Variables
  loadData()
  
  
  #Execute 
  print("Execute functions with 'qx()' (ex. for Q1 'q1()') ")

}