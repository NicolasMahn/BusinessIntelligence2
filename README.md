# BusinessIntelligence2

## Nutzung
Um alle Skripte ausführen zu können sollten zuerst die Daten und die verwendeten Libraries sowie das Style geladen werden. Dieser Vorgang wurde mit den folgenden Zeilen Code vereinfacht, die in der Konsole eingegeben werden müssen:

"""
source("Scripts/Configuration/Package_Managing.R")
source("Scripts/Configuration/Load_Data.R")
source("Scripts/Configuration/Style.R")

loadPackages()
loadData()
loadStyle()
"""
Damit sind die nötigen Daten geladen und die Libraries eingestellt, wodurch alle Skripte ausgeführt werden können.
Style wird benötigt für die Farben, die in den Plots genutzt werden, da sonst Fehler geschmissen werden. Bei Aufforderung einer y/n Antwort für das Laden von weiteren Fonts kann hier n gedrückt werden, da der Prozess zum Downloaden der Fonts lange dauert.


## Installation

**1. Git Installieren**  
    Teste ob git schon installiert ist. Öffne dafür das Terminal in R Studio und gebe folgende Befehle ein:  
### 
      which git
      git --version     
      
Wenn du keinen Fehler bekommst ist git Installiert.  
![image](https://user-images.githubusercontent.com/64785342/145038905-fa79bf23-9fde-42e5-9a26-f7dd9346408e.png)  
<br />
Sollte Git bei dir nicht installiert sein findest du [hier](https://happygitwithr.com/install-git.html) eine Anleitung      
<br />
<br />
               
**2. Repository Klonen**  
    Gehe in R Studio in der Menu Leiste oben links auf File > NewProject > Version Control > Git.  
    Fülle die Zeilen ensprechend aus:  
    Repository URL: ```https://github.com/NicolasMahn/BusinessIntelligence2.git```  
    Project Directory Name: ```BusinessIntelligence2```  
    Create the Project as a subsidiary of: Gebe hier den Pfad zu deinem Lokalen Speicherort an  
    Klicke auf  | Create Project |  
    ![image](https://user-images.githubusercontent.com/64785342/145043155-82341640-28de-45ef-940a-d15019b7f984.png)
    
    
## Package Managing
Die verwendeten Packages sind in dem Dokument ```Package_Managing.R``` zu finden.  
Bevor man den restlichen Code ausführen kann muss man dieses Skript einmal durchlaufen lassen.   
**Solltest du eine neue Library verwenden wollen füge diese bitte zuerst in ```Package_Managing.R``` hinzu!**

## Abkürzungen
- LR = Lineare Regression
- LogR = Logistische Regression
- DT = Decision Tree
- RF = Random Forest
- NN = Neuronale Netze
- AB = AdaBoost
