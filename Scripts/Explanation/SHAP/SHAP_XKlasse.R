# SHAP Value for XKlasse

  require(xgboost)
  require(tidyverse)
  require(shapr)
  source(gsub(" ", "", paste(getwd(), "/Scripts/Explanation/SHAP/shap.R")))
  
  smartBuildDummy = dummyVars( ~ Durchmesser + Hoehe + Gewicht, data=trainData)
  smartBuildX = predict(smartBuildDummy, newdata = smartBuildDataFrame)
  
  model = xgboost(data = smartBuildX, 
                  nround = 100, 
                  objective = "reg:linear",
                  label = smartBuildDataFrame$XKlasse)
  
  shapResults = shap.score.rank(xgb_model = model, 
                                X_train = smartBuildX,
                                shap_approx = F
  )
  
  var_importance(shapResults, top_n=3)
  
  
  shapLongResults = shap.prep(shap = shapResults,
                              X_train = smartBuildX, 
                              top_n = 3
  )
  
  plot.shap.summary(data_long = shapLongResults)
  
  
  xgb.plot.shap(data = smartBuildX, # input data
                model = model, # xgboost model
                features = names(shapResults$mean_shap_score[1:3]), # only top 3 features
                n_col = 3, # layout option
                plot_loess = T # add red line to plot
  )