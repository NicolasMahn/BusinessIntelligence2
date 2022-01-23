# Q 23: Neuronales Netz auf Ionisationsfaktor, ShineScore und Farbreinheit
# Multiple Outputs for visualisation

# neural net
model <- neuralnet(Ionisationsfaktor+Farbreinheit+ShineScore~Hoehe+Durchmesser+Gewicht,
                   scaledTrainData, hidden=c(2,3), act.fct = 'logistic', linear.output = T)
plot(model)
