loadStyle <- function(){
  
  #defining standard colors
  blue <<- "#1A5E8F"
  lightRose <<- "#FFD6E1"
  rose <<- "#E898AC"
  turquoise <<- "#00CFCC"
  lightOrange <<- "#FF9973"
  pink <<- "#F64975"
  lightTurquoise <<- "#5EFFFD"
  orange <<- "#FC723F"
  
  backgroundColor <<- "#002845"
  textColor <<- "#FFFFFF"
  
  
  #loading fonts
  loadfonts(device = "win", quiet = TRUE)
  if (is.null(head(fonts()))) {
    remotes::install_version("Rttf2pt1", version = "1.3.8")
    extrafont::font_import()
    loadfonts(device = "win", quiet = TRUE)
  }
  
  
  par(bg = backgroundColor,
      fg = textColor,
      col = textColor,
      col.axis = textColor, cex.axis = 1,
      col.main = textColor, cex.main = 2,
      col.sub = textColor, cex.sub = 1,
      col.lab = textColor, cex.lab = 1, 
      lwd = 3,
      bty = "l",
      family = "Bahnschrift")
  
  
  print("---STYLE HAS BEEN SET---")
}



